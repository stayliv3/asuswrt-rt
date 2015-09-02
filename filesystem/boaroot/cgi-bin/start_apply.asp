<%
If Request_Form("refresh_networkmap_Flag") = "1" then
	ClientList_Refresh()	
end if
If Request_Form("update_networkmap_Flag") = "1" then
	ClientList_Update()
end if
if Request_Form("action_script") = "aidisk_asusddns_register" then
	tcWebApi_Set("Ddns_Entry", "Active", "ddns_enable_x")
	tcWebApi_Set("Ddns_Entry", "MYHOST", "ddns_hostname_x")
	tcWebApi_Set("Ddns_Entry", "SERVERNAME", "ddns_server_x")
	tcWebApi_Commit("Ddns_Entry")
elseif Request_Form("action_script") = "restart_ddns" then
	tcWebApi_Set("Ddns_Entry", "Active", "ddns_enable_x")
	tcWebApi_Set("Ddns_Entry", "MYHOST", "ddns_hostname_x")
	tcWebApi_Set("Ddns_Entry", "SERVERNAME", "ddns_server_x")
	tcWebApi_Set("Ddns_Entry", "USERNAME", "ddns_username_x")
	tcWebApi_Set("Ddns_Entry", "PASSWORD", "ddns_passwd_x")
	tcWebApi_Set("Ddns_Entry", "WILDCARD", "ddns_wildcard_x")
	tcWebApi_Commit("Ddns_Entry")
elseif Request_Form("action_script") = "notif_hint" then
	tcWebApi_Set("WebCustom_Entry", "webs_notif_flag", "noti_notif_Flag")
	tcWebApi_Commit("WebCustom_Entry")	
elseif Request_Form("action_script") = "disable_aidisk_ddns" then
	tcWebApi_Set("Ddns_Entry", "Active", "ddns_enable_x")
	tcWebApi_Commit("Ddns_Entry")
elseif Request_Form("current_page") = "Advanced_VPN_Content.asp" then
	tcWebApi_Set("PPTP_Entry", "pptpd_enable", "pptpd_enable")
	tcWebApi_Set("PPTP_Entry", "pptpd_broadcast", "pptpd_broadcast")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist", "pptpd_clientlist")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist1", "pptpd_clientlist1")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist2", "pptpd_clientlist2")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist3", "pptpd_clientlist3")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist4", "pptpd_clientlist4")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist5", "pptpd_clientlist5")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist6", "pptpd_clientlist6")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist7", "pptpd_clientlist7")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist8", "pptpd_clientlist8")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist9", "pptpd_clientlist9")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist10", "pptpd_clientlist10")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist11", "pptpd_clientlist11")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist12", "pptpd_clientlist12")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist13", "pptpd_clientlist13")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist14", "pptpd_clientlist14")
	tcWebApi_Set("PPTP_Entry", "pptpd_clientlist15", "pptpd_clientlist15")
	tcWebApi_Commit("PPTP")
	tcWebApi_Commit("Firewall")
elseif Request_Form("current_page") = "Advanced_VPNAdvanced_Content.asp" then
	tcWebApi_Set("PPTP_Entry", "pptpd_broadcast", "pptpd_broadcast")
	tcWebApi_Set("PPTP_Entry", "pptpd_chap", "pptpd_chap")
	tcWebApi_Set("PPTP_Entry", "pptpd_mppe", "pptpd_mppe")
	tcWebApi_Set("PPTP_Entry", "pptpd_dns1", "pptpd_dns1")
	tcWebApi_Set("PPTP_Entry", "pptpd_dns2", "pptpd_dns2")
	tcWebApi_Set("PPTP_Entry", "pptpd_wins1", "pptpd_wins1")
	tcWebApi_Set("PPTP_Entry", "pptpd_wins2", "pptpd_wins2")
	tcWebApi_Set("PPTP_Entry", "pptpd_mru", "pptpd_mru")
	tcWebApi_Set("PPTP_Entry", "pptpd_mtu", "pptpd_mtu")
	tcWebApi_Set("PPTP_Entry", "pptpd_clients", "pptpd_clients")
	tcWebApi_Commit("PPTP")
elseif Request_Form("current_page") = "Advanced_VPNClient_Content.asp" then	
	if Request_form("listFlag") = "1" Then
		tcWebApi_Set("VPNC_Entry", "clientlist", "vpnc_clientlist")
		tcWebApi_Set("VPNC_Entry", "clientlist1", "vpnc_clientlist1")
		tcWebApi_Set("VPNC_Entry", "clientlist2", "vpnc_clientlist2")
		tcWebApi_Set("VPNC_Entry", "clientlist3", "vpnc_clientlist3")
		tcWebApi_Set("VPNC_Entry", "clientlist4", "vpnc_clientlist4")
		tcWebApi_Set("VPNC_Entry", "clientlist5", "vpnc_clientlist5")
		tcWebApi_Set("VPNC_Entry", "clientlist6", "vpnc_clientlist6")
		tcWebApi_Set("VPNC_Entry", "clientlist7", "vpnc_clientlist7")
		tcWebApi_Set("VPNC_Entry", "clientlist8", "vpnc_clientlist8")
		tcWebApi_Set("VPNC_Entry", "clientlist9", "vpnc_clientlist9")
		tcWebApi_Set("VPNC_Entry", "pptp_options_list", "vpnc_pptp_options_x_list")
		tcWebApi_Commit("VPNC")
	elseif Request_form("listFlag") = "2" Then	
		tcWebApi_Set("VPNC_Entry", "appendix", "vpnc_appendix")
		tcWebApi_Set("VPNC_Entry", "clientlist", "vpnc_clientlist")		
		tcWebApi_Commit("VPNC")
	end if	
	if Request_form("connFlag") = "1" Then
		tcWebApi_Set("VPNC_Entry", "proto", "vpnc_proto")
		tcWebApi_Set("VPNC_Entry", "heartbeat", "vpnc_heartbeat_x")
		tcWebApi_Set("VPNC_Entry", "username", "vpnc_pppoe_username")
		tcWebApi_Set("VPNC_Entry", "passwd", "vpnc_pppoe_passwd")	
		tcWebApi_Set("VPNC_Entry", "auto_conn", "vpnc_auto_conn")
		tcWebApi_Set("VPNC_Entry", "pptp_options", "vpnc_pptp_options_x")
		tcWebApi_Commit("VPNC")
	elseif Request_form("connFlag") = "2" Then	
		tcWebApi_Commit("VPNC")
	end if		
elseif Request_Form("current_page") = "Main_LogStatus_Content.asp" then	
	if Request_Form("clearLog_Flag") = "1" then
		tcWebApi_commit("LogAccess_ClearLog")
	end if
elseif Request_Form("current_page") = "Advanced_SettingBackup_Content.asp" then
	if request_Form("postflag") = "1" then
		tcWebApi_set("System_Entry","upgrade_fw_status","value_NONE")
		tcWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
		tcWebApi_CommitWithoutSave("System_Entry")
	elseif request_Form("postflag") = "5" then
		tcWebApi_set("System_Entry","upgrade_fw_status","value_NONE")
	end if
elseif Request_Form("current_page") = "Advanced_IPTV_Content.asp" then
	tcWebApi_set("IPTV_Entry", "switch_stb_x", "switch_stb_x")
	tcWebApi_set("IPTV_Entry", "dr_enable_x", "dr_enable_x")
	tcWebApi_set("IPTV_Entry", "mr_enable_x", "mr_enable_x")
	tcWebApi_set("IPTV_Entry", "udpxy_enable_x", "udpxy_enable_x")
	if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then
		tcWebApi_set("IPTV_Entry", "rmvlan", "rmvlan")
	end if
	tcWebApi_set("GUITemp_Entry0", "switch_stb_modified", "modified")
	tcWebApi_commit("IPTV")
	tcWebApi_commit("Firewall")
elseif Request_Form("current_page") = "Advanced_DSL_Feedback.asp" then
	If Request_Form("saveFlag") = "1" Then
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_country","fb_country")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_ISP","fb_ISP")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_Subscribed_Info","fb_Subscribed_Info")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_email","fb_email")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_availability","fb_availability")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_comment0","fb_comment0")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_comment1","fb_comment1")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_comment2","fb_comment2")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_comment3","fb_comment3")
		tcWebApi_Set("GUITemp_Entry0","fb_tmp_comment4","fb_comment4")
		tcWebApi_Set("GUITemp_Entry0","browserInfo","browserInfo")
		tcWebApi_Set("PushMail_Entry","PM_attach_syslog","PM_attach_syslog")
		tcWebApi_Set("PushMail_Entry","PM_attach_cfgfile","PM_attach_cfgfile")
		tcWebApi_Set("PushMail_Entry","PM_attach_iptables","PM_attach_iptables")
		tcWebApi_commit("PushMail")
	end if
elseif Request_Form("current_page") = "Advanced_WANPort_Content.asp" then
	tcWebApi_Set("Dualwan_Entry","wans_mode","wans_mode")
	tcWebApi_Set("Dualwan_Entry","wans_dualwan","wans_dualwan")
	tcWebApi_Set("Dualwan_Entry","wans_lanport","wans_lanport")
	tcWebApi_Set("Dualwan_Entry","wans_lb_ratio","wans_lb_ratio")
	tcWebApi_Set("Dualwan_Entry","wans_routing_enable","wans_routing_enable")
	tcWebApi_Set("Dualwan_Entry","wans_routing_rulelist","wans_routing_rulelist")
	tcWebApi_Set("Dualwan_Entry","wan0_routing_isp_enable","wan0_routing_isp_enable")
	tcWebApi_Set("Dualwan_Entry","wan0_routing_isp","wan0_routing_isp")
	tcWebApi_Set("Dualwan_Entry","wan1_routing_isp_enable","wan1_routing_isp_enable")
	tcWebApi_Set("Dualwan_Entry","wan1_routing_isp","wan1_routing_isp")
	tcWebApi_Set("Dualwan_Entry","wandog_enable","wandog_enable")
	tcWebApi_Set("Dualwan_Entry","wandog_target","wandog_target")
	tcWebApi_Set("Dualwan_Entry","wandog_interval","wandog_interval")
	tcWebApi_Set("Dualwan_Entry","wandog_maxfail","wandog_maxfail")
	tcWebApi_Set("Dualwan_Entry","wandog_delay","wandog_delay")
	tcWebApi_Set("Dualwan_Entry","wandog_fb_count","wandog_fb_count")
	tcWebApi_commit("Dualwan")
elseif Request_Form("current_page") = "Advanced_DSL_Content.asp" then
	If Request_Form("next_page") = "Advanced_Modem_Content.asp" Then
		tcWebApi_Set("WebCurSet_Entry","dev_pvc","USBInfo_PVC")
		tcWebApi_Set("Wan_Common","TransMode","USB_TransMode")
		tcWebApi_Set("WebCurSet_Entry","wan_pvc","USBInfo_PVC")
	end if
elseif Request_Form("current_page") = "Advanced_Modem_Content.asp" then
	If Request_Form("next_page") = "Advanced_DSL_Content.asp" Then
		tcWebApi_Set("WebCurSet_Entry","dev_pvc","ModemInfo_PVC")
		tcWebApi_Set("Wan_Common","TransMode","ModemTransMode")
		tcWebApi_Set("WebCurSet_Entry","wan_pvc","ModemInfo_PVC")
	end if
end if
%>
<html>

<!--start_apply.asp-->
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="/images/favicon.png">
<link rel="icon" href="/images/favicon.png">
<script type="text/javascript">
var page_modified = 0;
var restart_time = 0;
var rc_support = "<% tcWebApi_get("SysInfo_Entry", "rc_support", "s") %>";
var dsl_support = rc_support.search("dsl");
var current_page = '<% get_parameter("current_page") %>';
var next_page = '<% get_parameter("next_page") %>';
var action_script = '<% get_parameter("action_script") %>';
var action_mode = '<% get_parameter("action_mode") %>';
var action_wait = '<% get_parameter("action_wait") %>';
var group_id = '<% get_parameter("group_id") %>';
var getflag = '<% get_parameter("flag") %>';
var postflag = '<% get_parameter("postflag") %>';
function started_validating(){
}
function done_validating(action){
	parent.done_validating(action, group_id);
}
function started_committing(){
}
function done_committing(){
	page_modified = 1;
}
function no_changes_and_no_committing(){
}
function invalid_variable_value(variable, bad_value, message){
}
function restart_needed_time(second){
	restart_time = second;
}
function delay_redirect(next_url){
document.redirectForm.action = next_url;
document.redirectForm.target = "";
document.redirectForm.submit();
}
function top_delay_redirect(next_url){
	document.redirectForm.action = next_url;
	document.redirectForm.target = "_parent";
	document.redirectForm.submit();
}
function qis_delay_redirect(next_url){
	parent.parent.document.redirectForm.action = next_url;
	parent.parent.document.redirectForm.target = "contentM";
	parent.parent.document.redirectForm.submit();
}
function redirect_page(next_url){
	parent.location.href = "/cgi-bin/"+next_url;
}
function redirect(){
	parent.location.href = 'http://'+parent.document.form.lan_ipaddr.value+'/QIS_wizard.asp?flag=detect';
}
function redirect_qis(){
	parent.location.href = 'http://'+parent.document.form.lan_ipaddr.value+'/index.asp';
}
function initial(){
	if(getflag == "set_language"){
		if(navigator.appName.indexOf("Microsoft") >= 0)
			parent.parent.location.reload();
		else
			parent.parent.location.href = parent.parent.location.href;
	}
	else if(next_page.indexOf("QIS_") >= 0){
		if(dsl_support != -1){
			setTimeout("delay_redirect('"+next_page+"');", restart_time*1000);
		}
		else {
			if(getflag.length > 0)
				document.redirectForm.flag.value = getflag;
			if(parent.$("hidden_frame")){
				setTimeout("qis_delay_redirect('qis/QIS_verify_detect.asp');", restart_time*1000);
			}
			else{
				if(getflag == "auto_way_vpn"){
					parent.showLoading(restart_time);
					setTimeout("delay_redirect('qis/QIS_verify_detect.asp');", restart_time*1000);
					return;
				}
				else if(getflag == "detect"){
					parent.showLoading(restart_time);
					setTimeout("delay_redirect('qis/QIS_detect.asp');", restart_time*1000);
					return;
				}
				else if(getflag == "verify_detect"){
					parent.showLoading(restart_time);
					setTimeout("delay_redirect('qis/QIS_verify_detect.asp');", restart_time*1000);
					return;
				}
				else{
					parent.showLoading(restart_time, "waiting");
					if(parent.parent.isWLclient())
						setTimeout("parent.parent.detectLANstatus('"+next_page+"', '"+getflag+"');", restart_time*1000);
					else
						setTimeout("top_delay_redirect('"+next_page+"');", restart_time*1000);
				}
			}
		}
	}
	else if(current_page.indexOf("Feedback") >= 0){
				
	}	
	else if(getflag == "ddnscheck"){
		setTimeout("parent.go_index_page();", 5000);
	}
	else if(getflag == "aidisk"){
		parent.Webdav_status = (parent.Webdav_status == 1) ? 0 : 1;
		parent.resultOfSwitchWebdavStatus();
	}
	else if(action_script.indexOf("aidisk_asusddns_register") >= 0){
		setTimeout("parent.checkDDNSReturnCode();", 1000);
	}
	else if(current_page.indexOf("Advanced_VPNClient") >= 0) {
		setTimeout("parent.location.reload();",500);
	}
	else if(current_page.indexOf("Advanced_DSL_Content") >= 0) {
		if(next_page.length > 0){
			setTimeout("redirect_page(next_page)", 200);
		}
	}
	else if(current_page.indexOf("Advanced_Modem_Content") >= 0) {
		if(next_page.length > 0){
			setTimeout("redirect_page(next_page)", 200);
		}
	}
	else if(action_script.indexOf("restart_ddns") >= 0) {
		setTimeout("parent.parent.checkDDNSReturnCode();", 1000);
	}
	else if(action_script.indexOf("start_webs_upgrade") >= 0) {
		setTimeout("parent.showLoadingBar(restart_time);", 1000);

	}else if(current_page.indexOf("Advanced_SettingBackup_Content.asp") >= 0){
		if(postflag == "5"){
				setTimeout("alert(\"<% tcWebApi_Get("String_Entry", "SET_fail_desc", "s") %>\");", 5000);
				setTimeout("parent.redirect_self();", 5000);
		}else if(postflag == "1"){
				parent.chk_upgrade();
				setTimeout("parent.redirect();", 120000); //90000
		}
	}
	else if(page_modified == 1){
		parent.showLoading(restart_time, "waiting");
		if(current_page.length > 0){
			if(current_page.indexOf("clients.asp") >= 0){
				document.redirectForm.flag.value = "Client";
				setTimeout("top_delay_redirect('/');", restart_time*1000);
			}
			else if(current_page == "Advanced_OperationMode_Content.asp"){
				parent.$('drword').innerHTML = "<%tcWebApi_get("String_Entry","LAN_IP_changed_suggedtion1","s")%>"+parent.document.form.lan_ipaddr.value+"<%tcWebApi_get("String_Entry","LAN_IP_changed_suggedtion2","s")%><br/>";
				setTimeout("hideLoading() ",20000);
				setTimeout("parent.dr_advise();",20000);
				setTimeout("redirect()",35000);
			}
			else if(current_page == "Advanced_LAN_Content.asp"){
				parent.$('drword').innerHTML = "<%tcWebApi_get("String_Entry","LAN_IP_changed_suggedtion1","s")%>"+parent.document.form.lan_ipaddr.value+"<%tcWebApi_get("String_Entry","LAN_IP_changed_suggedtion2","s")%><br/>";
				setTimeout("hideLoading() ",20000);
				setTimeout("parent.dr_advise();",20000);
				setTimeout("redirect_qis()",35000);
			}
			else if(getflag == "nodetect"){
				setTimeout("top_delay_redirect('"+current_page+"');", restart_time*1000);
			}
			else if(action_script == "restart_webdav"){
				setTimeout("top_delay_redirect('"+current_page+"');", restart_time*1000);
			}
			else{
				setTimeout("parent.parent.detectLANstatus('"+current_page+"', '');", restart_time*1000);
			}
		}
	}
	else if(action_script == "reboot"){
		parent.showLoading(restart_time);
		setTimeout("top_delay_redirect('"+next_page+"');", restart_time*1000);
	}
	else{
		if(current_page.length > 0){			
			setTimeout("top_delay_redirect('"+current_page+"');", restart_time*1000);
		}
		else if(next_page.length > 0){
			setTimeout("delay_redirect('"+next_page+"');", restart_time*1000);
		}
	}
}
function hideLoading(){
	parent.$("loadingBlock").style.visibility = "hidden";
	parent.$("Loading").style.width = "10px";
}
</script>
</head>
<body onload="initial();">
<form method="post" name="redirectForm" action="#" target="">
<input type="hidden" name="flag" value="">
<input type="hidden" name="prev_page" value="">
</form>




</body>

<!--start_apply.asp-->
</html>
