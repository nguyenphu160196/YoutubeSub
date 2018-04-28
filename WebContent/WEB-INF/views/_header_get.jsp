<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="getsubyoutube.beans.UserAccount"%>
<div class="col-md-12"
	style="box-shadow: 0px 3px 5px lightgrey; display: flex; padding: 10px 15px;">
	<div class="col-md-10" style="font-size: 23px;">
		<div class="col-md-3 gradient">English Subtitles</div>
		<div class="col-md-7" style="display: flex;">
			<input class="form-control col-md-8" name="getsub" type="text">
			<button class="btn col-md-2"
				style="font-weight: 600; margin-left: 10px;" id="getsub">Get</button>
		</div>
	</div>
	<div class="col-md-2" style="display: flex" id="userinfo">
		<div class="g-signin2" data-onsuccess="onSignIn" id="login">Đăng
			nhập</div>
	</div>
</div>