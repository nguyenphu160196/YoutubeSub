<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
	<div class="col-md-12" style="box-shadow: 0px 3px 5px lightgrey; display: flex; padding: 10px 15px;">
		<div class="col-md-10 gradient" style="font-size: 23px;">
			English Subtitles 
		</div>
		<% 
			if(session.getAttribute("user") == null){
		%>
			<div class="col-md-2" style="display: flex">
			<!-- <div class="btn btn-warning" style="margin-right: 20px">Đăng ký</div> -->
				<div class="g-signin2" data-onsuccess="onSignIn"></div>
			</div>
		<%
			}else{
		%>
			<div class="col-md-2" style="display: flex">
				<div class="btn btn-warning" style="margin-right: 20px" id="logout">Đăng xuất</div>
				<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
			</div>
		<%}%>
	</div>