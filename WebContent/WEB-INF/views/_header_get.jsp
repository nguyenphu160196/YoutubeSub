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
		<%
			if (session.getAttribute("user") == null) {
		%>
		<!-- <div class="btn btn-warning" style="margin-right: 20px">Đăng ký</div> -->
		<div class="g-signin2" data-onsuccess="onSignIn" id="login">Đăng
			nhập</div>
		<%
			} else {
				UserAccount user = new UserAccount();
				user = (UserAccount) session.getAttribute("user");
		%>
		Hi,
		<%=user.getName()%>
		<div class="dropdown">
			<div class="dropdown-toggle" style="margin-left: 10px"
				data-toggle="dropdown">
				<img style="border-radius: 50%; width: 30px"
					src="<%=user.getPicture()%>" alt="Avatar"> <span
					class="caret"></span>
			</div>
			<ul class="dropdown-menu dropdown-menu-right">
				<li><a href="#">List of lesson</a></li>
				<li><a href="#" id="logout">Logout</a></li>
			</ul>
		</div>
		<%
			}
		%>
	</div>
</div>