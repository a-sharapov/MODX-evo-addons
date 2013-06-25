<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<title>MODx CMF Manager Login</title>
<meta http-equiv="content-type" content="text/html; charset=[+modx_charset+]" />
<meta name="robots" content="noindex, nofollow" />
<style type="text/css">
/* Normalize CSS part */
html,body,div,span,h1,h2,h3,h4,h5,h6,p,em,img,strong,b,u,i,dl,dt,dd,ol,ul,li,fieldset,form,label,table,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;outline:0;vertical-align:baseline;background:transparent;font-size:100%;}
a{margin:0;padding:0;font-size:100%;vertical-align:baseline;background:transparent;}
table{border-collapse:collapse;border-spacing:0;}td,td img{vertical-align:top;}input,select,button,textarea{margin:0;font-size:100%;}
input[type="text"],input[type="password"],textarea{padding:0;}input[type="checkbox"]{vertical-align:bottom;}
input[type="radio"]{vertical-align:text-bottom;}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block;}
html{overflow-y:scroll;}body{line-height:1;background:#fff;color:#111;text-align:left;font:12px Verdana,"Geneva CY","DejaVu Sans",sans-serif;}
input,select,button,textarea{font-family:Verdana,"Geneva CY","DejaVu Sans",sans-serif;}
label,input[type="button"],input[type="submit"],button{cursor:pointer;}a,a:visited,a:focus,a:active,a:hover{cursor:pointer;}
/* Login Styles part*/
body {
background: #eee;
font: normal 14px helvetica, arial, freesans, clean, sans-serif;
height: 100%;
width: 100%;
min-height: 500px;
min-width: 1000px;
text-shadow: 0 1px 0 #fff;
line-height: 18px;
}
a {
color: #00577d;
text-decoration: none;
}
a:active, a:hover {
color: #0f1e76;
text-decoration: underline;
}
input, textarea, button {
border: 1px solid #ddd;
padding: 7px 8px !important;
vertical-align: baseline;
border-radius: 3px;
background: #fff url("data:image/png;base64,R0lGODlhAQASAKIAAP////39/fz8/Pr6+vn5+ff39/X19ezs7CH5BAQUAP8ALAAAAAABABIAAAMIeGZE8iDKmQAAOw==") repeat-x top left;
outline: none;
line-height: 16px;
color: #222;
}
input:hover, textarea:hover, input:focus, textarea:focus, .rememberme:hover #rememberme-wrapper {
border: 1px solid #73829a;
box-shadow: 0 0 3px #73829a;
}
button, input.button {
line-height: 16px;
padding: 6px 12px !important;
background: #8ea4be;
color: #fff;
text-shadow: 0 -1px 0 #333;
border: 1px solid #8ea4be;
border-top-color: #e5edf1;
border-radius: 2px;
box-shadow: 0 0 0 1px #596b7f, inset 0 -20px 20px rgba(0, 0, 0, 0.3);
}
button:hover, .button:hover {
box-shadow: 0 0 0 1px #596b7f, inset 0 0 10px #596b7f, inset 0 -20px 20px rgba(0, 0, 0, 0.2) !important;
}
.wrapper, .loginLicense {
float: none;
margin: 4% auto 0;
width: 400px;
padding: 0;
}
.loginLicense {
color: #aaa;
text-align: left;
font-size: 10px;
text-indent: 15px;
}
.sectionHeader {
width: 380px;
padding: 0 10px 20px;
height: 60px;
line-height: 60px;
text-align: left;
}
#mx_loginbox {
float: left;
padding: 15px;
margin: 0 0 20px;
border: 1px solid #ccc;
box-shadow: 0 1px 4px rgba(20,20,20,.05);
background-color: #fff;
border-radius: 5px;
color: #555;
background-image: linear-gradient(bottom, rgb(245,245,245) 23%, rgb(255,255,255) 62%);
background-image: -o-linear-gradient(bottom, rgb(245,245,245) 23%, rgb(255,255,255) 62%);
background-image: -moz-linear-gradient(bottom, rgb(245,245,245) 23%, rgb(255,255,255) 62%);
background-image: -webkit-linear-gradient(bottom, rgb(245,245,245) 23%, rgb(255,255,255) 62%);
background-image: -ms-linear-gradient(bottom, rgb(245,245,245) 23%, rgb(255,255,255) 62%);

background-image: -webkit-gradient(
linear,
left bottom,
left top,
color-stop(0.23, rgb(245,245,245)),
color-stop(0.62, rgb(255,255,255))
);
}
#onManagerLoginFormRender {
float: left;
width: 100%;
padding: 0;
margin: 15px 0 0;
}
#FMP-email_label {
float: left;
margin: 7px 5px 0 0;
}
#FMP-email, #FMP-email_button {
float: right;
clear: right;
margin-bottom: 10px;
}
.rememberme {
float: left;
width: 260px;
padding: 12px 5px 0 0;
color: #999;
}
#rememberme {
padding: 0 !important;
margin: 0;
border: none;
background: none;
opacity: 0 !important;
}
#rememberme-wrapper {
float: left;
display: block;
width: 10px;
height: 10px;
margin: 1px 7px 0 0;
border: 1px solid #ddd;
padding: 2px !important;
vertical-align: baseline;
border-radius: 3px;
background: #fff url("data:image/png;base64,R0lGODlhAQASAKIAAP////39/fz8/Pr6+vn5+ff39/X19ezs7CH5BAQUAP8ALAAAAAABABIAAAMIeGZE8iDKmQAAOw==") repeat-x top left;
outline: none;
line-height: 16px;
z-index: 999;
}
#rememberme-wrapper.active {
background: #fff url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAICAYAAADA+m62AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzEwMTZFNENBQ0MxMTFFMkE4NUE4QjlBNTg5M0U0NDEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzEwMTZFNERBQ0MxMTFFMkE4NUE4QjlBNTg5M0U0NDEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDMTAxNkU0QUFDQzExMUUyQTg1QThCOUE1ODkzRTQ0MSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDMTAxNkU0QkFDQzExMUUyQTg1QThCOUE1ODkzRTQ0MSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pi7wmm4AAABhSURBVHjajM/BDcAgCIVhMN0Ix8A5uoZrdA4dQ2bCPpP2RGz/iwl+B2AfTrtKLd5qY95BIBEhM6PjC/XeaVyD0x+EWXo+dgjxPXRVXXugCC2IY/KZF0YReiECxhshNAUYAK3dQDIzgsOIAAAAAElFTkSuQmCC") no-repeat center center;
}
#submitButton {
float: right;
}
.username, .password, .captcha {
float: left;
width: 180px;
margin: 5px 0 10px;
}
.username {
margin-right: 8px;
}
.username input, .password input, input#FMP-email {
max-width: 160px;
}
.password input {
float: right;
}
.captcha {
width: 100%;
color: #999;
font-size: 11px;
line-height: 14px;
margin: 0;
}
p.caption {
float: left;
margin-bottom: 7px;
}
#captcha_image {
float: left;
margin: 0 30px 0 0;
border: 1px solid #ccc;
}
.error {
float: left;
margin: 0 0 10px;
padding: 7px 24px 7px 14px;
font-size: 11px;
width: 328px;
text-align: center;
line-height: 14px;
z-index: 999;
cursor: pointer;
border-radius: 0;
background: #fe8d73 url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAABkCAYAAABHLFpgAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTQ5MUJBMDc3NEI3MTFFMjhCMjk5QUU4QjQwMkFGRkIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTQ5MUJBMDg3NEI3MTFFMjhCMjk5QUU4QjQwMkFGRkIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxNDkxQkEwNTc0QjcxMUUyOEIyOTlBRThCNDAyQUZGQiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxNDkxQkEwNjc0QjcxMUUyOEIyOTlBRThCNDAyQUZGQiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PuGHXnkAAAAsSURBVHjaYvj//z8DEwMQDE4CBBhRxXByKWYRK0GENpL04lRCiVtwexUgwACpMAPoD1ikoAAAAABJRU5ErkJggg==") repeat-x bottom left;
border: 1px solid #83210b;
color: #83210b;
box-shadow: inset 0 1px 0 0 #ffd5cb;
text-shadow: 0 1px 0 #f2b9ac;
}
</style>
<script src="media/script/mootools/mootools.js" type="text/javascript"></script>
<script type="text/javascript">/* <![CDATA[ */if (top.frames.length!=0) {top.location=self.document.location;
}window.addEvent('domready', function() {$('submitButton').addEvent('click', function(e) { e = new Event(e).stop(); params = 'ajax=1&' + $('loginfrm').toQueryString(); url = 'processors/login.processor.php'; new Ajax(url,{method: 'post',postBody: params,onComplete:ajaxReturn}).request();$$('input').setProperty('readonly', 'readonly');});if ($('username').value != '') {$('password').focus();} else {$('username').focus();}});function ajaxReturn(response) {var header = response.substr(0,9);if (header.toLowerCase()=='location:') top.location = response.substr(10);else {var cimg = $('captcha_image');if (cimg) {cimg.src = 'includes/veriword.php?rand=' + Math.random();}$$('input').removeProperty('readonly');alert(response);}}/* ]]> */</script>
<script type="text/javascript">
window.addEvent('domready', function() {
if ( $('rememberme').getProperty('checked') == true ) {$('rememberme-wrapper').addClass('active');}
$('rememberme').addEvent('change', function() {
    if ( this.getParent('rememberme-wrapper').className.match('active') ) {
        this.getParent('rememberme-wrapper').removeClass('active');
    } else {
         this.getParent('rememberme-wrapper').addClass('active');
    }
});
});
</script>
</head>
<body id="login">
<div class="wrapper"><div class="sectionHeader"><a href="/"><img width="172" height="60" src="media/style/common/images/misc/login-logo.png" alt="[+site_name+]" /></a></div>
<div id="mx_loginbox">
<form method="post" name="loginfrm" id="loginfrm" action="processors/login.processor.php">
[+OnManagerLoginFormPrerender+]
<div class="sectionBody">
<label for="username" class="username"><input type="text" class="text" name="username" placeholder="[+username+]" id="username" tabindex="1" value="[+uid+]" /></label>
<label for="password" class="password"><input type="password" class="text" name="password" placeholder="[+password+]" id="password" tabindex="2" value="" /></label>
<div class="captcha">
<p class="caption">[+login_captcha_message+]</p>
[+captcha_image+]<label>[+captcha_input+]</label>
</div>
<label for="rememberme" class="rememberme"><div id="rememberme-wrapper"><input type="checkbox" id="rememberme" name="rememberme" tabindex="4" value="1" class="checkbox" [+remember_me+] /></div>[+remember_username+]</label>
<input type="submit" class="login button" id="submitButton" value="[+login_button+]" />
[+OnManagerLoginFormRender+]
</div>
</form>
</div></div>
<div class="loginLicense">
&copy; 2005-2013 by <a href="http://modx.com/" target="_blank">MODX&reg;</a>, and licensed under the <strong>GPL</strong>.
</div>
</body>
</html>