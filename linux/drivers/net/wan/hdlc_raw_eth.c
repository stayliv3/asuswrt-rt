/*
 * Generic HDLC support routines for Linux
 * HDLC Ethernet emulation support
 *
 * Copyright (C) 2002-2006 Krzysztof Halasa <khc@pm.waw.pl>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of version 2 of the GNU General Public License
 * as published by the Free Software Foundation.
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/poll.h>
#include <linux/errno.h>
#include <linux/if_arp.h>
#include <linux/init.h>
#include <linux/skbuff.h>
#include <linux/pkt_sched.h>
#include <linux/random.h>
#include <linux/inetdevice.h>
#include <linux/lapb.h>
#include <linux/rtnetlink.h>
#include <linux/etherdevice.h>
#include <linux/hdlc.h>

static int raw_eth_ioctl(struct net_device *dev, struct ifreq *ifr);

static int eth_tx(struct sk_buff *skb, struct net_device *dev)
{
	int pad = ETH_ZLEN - skb->len;
	if (pad > 0) {		/* Pad the frame with zeros */
		int len = skb->len;
		if (skb_tailroom(skb) < pad)
			if (pskb_expand_head(skb, 0, pad, GFP_ATOMIC)) {
				hdlc_stats(dev)->tx_dropped++;
				dev_kfree_skb(skb);
				return 0;
			}
		skb_put(skb, pad);
		memset(skb->data + len, 0, pad);
	}
	return dev_to_hdlc(dev)->xmit(skb, dev);
}


static struct hdlc_proto proto = {
	.type_trans	= eth_type_trans,
	.ioctl		= raw_eth_ioctl,
	.module		= THIS_MODULE,
};


static int raw_eth_ioctl(struct net_device *dev, struct ifreq *ifr)
{
	raw_hdlc_proto __user *raw_s = ifr->ifr_settings.ifs_ifsu.raw_hdlc;
	const size_t size = sizeof(raw_hdlc_proto);
	raw_hdlc_proto new_settings;
	hdlc_device *hdlc = dev_to_hdlc(dev);
	int result;
	void *old_ch_mtu;
	int old_qlen;

	switch (ifr->ifr_settings.type) {
	case IF_GET_PROTO:
		if (dev_to_hdlc(dev)->proto != &proto)
			return -EINVAL;
		ifr->ifr_settings.type = IF_PROTO_HDLC_ETH;
		if (ifr->ifr_settings.size < size) {
			ifr->ifr_settings.size = size; /* data size wanted */
			return -ENOBUFS;
		}
		if (copy_to_user(raw_s, hdlc->state, size))
			return -EFAULT;
		return 0;

	case IF_PROTO_HDLC_ETH:
		if (!capable(CAP_NET_ADMIN))
			return -EPERM;

		if (dev->flags & IFF_UP)
			return -EBUSY;

		if (copy_from_user(&new_settings, raw_s, size))
			return -EFAULT;

		if (new_settings.encoding == ENCODING_DEFAULT)
			new_settings.encoding = ENCODING_NRZ;

		if (new_settings.parity == PARITY_DEFAULT)
			new_settings.parity = PARITY_CRC16_PR1_CCITT;

		result = hdlc->attach(dev, new_settings.encoding,
				      new_settings.parity);
		if (result)
			return result;

		result = attach_hdlc_protocol(dev, &proto, NULL,
					      sizeof(raw_hdlc_proto));
		if (result)
			return result;
		memcpy(hdlc->state, &new_settings, size);
		dev->hard_start_xmit = eth_tx;
		old_ch_mtu = dev->change_mtu;
		old_qlen = dev->tx_queue_len;
		ether_setup(dev);
		dev->change_mtu = old_ch_mtu;
		dev->tx_queue_len = old_qlen;
		memcpy(dev->dev_addr, "\x00\x01", 2);
                get_random_bytes(dev->dev_addr + 2, ETH_ALEN - 2);
		netif_dormant_off(dev);
		return 0;
	}

	return -EINVAL;
}


static int __init mod_init(void)
{
	register_hdlc_protocol(&proto);
	return 0;
}



static void __exit mod_exit(void)
{
	unregister_hdlc_protocol(&proto);
}


module_init(mod_init);
module_exit(mod_exit);

MODULE_AUTHOR("Krzysztof Halasa <khc@pm.waw.pl>");
MODULE_DESCRIPTION("Ethernet encapsulation support for generic HDLC");
MODULE_LICENSE("GPL v2");