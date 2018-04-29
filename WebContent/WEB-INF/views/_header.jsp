<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="getsubyoutube.beans.UserAccount"%>
<div class="col-md-12"
	style="box-shadow: 0px 3px 5px lightgrey; display: flex; padding: 10px 15px;">
	<div class="col-md-11 gradient" id="homeURL" style="font-size: 23px; cursor: pointer">English
		Subtitles</div>
	<div class="" style="display: flex" id="userinfo">
		<div class="g-signin2" data-onsuccess="onSignIn" id="login-google">Đăng
			nhập</div>
	</div>
</div>
<script>
	$("#homeURL").click(function(){
		window.location.href = "home";
	})
	
	function onSignIn(googleUser) {
			
			var profile = googleUser.getBasicProfile();
			
			$.ajax({
                type: "POST",
                url : "LoginServlet",
                data: {email: profile.getEmail()},
                success: function(responseText){
                	$("#login-google").addClass("hidden");
                	$("#userinfo").append('<div id="login-in" class="dropdown" style="cursor: pointer; padding-right: 0px;"><div class="dropdown-toggle" data-toggle="dropdown"><image class="" style="border-radius: 100px;" src="'+profile.getImageUrl()+'" width="40" height="40" /></div><ul class="dropdown-menu pull-right"><li class="dropdown-header"><div class="col-md-2" style="padding-right: 0px;padding-left: 0px;"><image style="border-radius: 100px;" src="'+profile.getImageUrl()+'" width="40" height="40" /></div><div class="col-md-9" style= "padding-left:0px;"><div class="col-md-12">'+profile.getName()+'</div><div class="col-md-12">'+profile.getEmail()+'</div></div></li></ul></div>');
                	$("#userinfo").append('<button id="sign-out" style="margin-left:10px;" class="btn btn-basic fa fa-power-off"> Sign Out</button>')
                }

        	});
			
		}
	
	$("#userinfo").on("click", "#sign-out", function(){
		$.ajax({
            type: "GET",
            url : "LogoutServlet",
            success: function(responseText){
            	$("#sign-out").remove();
            	$("#login-in").remove();
            	$("#login-google").removeClass("hidden");
            }

    	});
	})
</script>