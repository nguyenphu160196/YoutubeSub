<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="878435691543-4s5pf2jvk3srq0ikp61mfmu235iqnnsk.apps.googleusercontent.com">
<title>Home</title>
<style type="text/css">
	.gradient{
		-webkit-mask-image: -webkit-linear-gradient(top, rgba(0,0,0,1), rgba(0,0,0,.5) 30%, rgba(0,0,0,1));
		-webkit-mask-image: linear-gradient(top, rgba(0,0,0,1), rgba(0,0,0,.5) 30%, rgba(0,0,0,1));
		font-weight: 600;
	}
	.footer{
		background-color: grey;
	    padding: 10px;
	    text-align: center;
	    color: #fff;
	    font-weight: 600;
	    position: absolute;
	    bottom: 0px;
	}
</style>
</head>
<body>
<div class="container-fluid" style="padding: 0px!important;; margin: 0px!important;">

	<jsp:include page="_header.jsp"></jsp:include>
	
	<div class="col-md-12" style="margin-top: 180px;">
		<div class="col-md-12" style="display: flex; flex-direction: column; align-items: center">
			<div class="gradient" style="font-size: 72px;">Get Subtitle</div>
			<div class="col-md-5" style="display: flex; margin-top: 10px;">
				<input class="form-control col-md-8" name="getsub" type="text">
				<button class="btn col-md-2" style="font-weight: 600" id="getsub">Get</button>
			</div>
		</div>
	</div>
	
	<div class="footer col-md-12">
		Thiết kế phần mềm giáo dục.
	</div>
	
</div>


<script type="text/javascript">
	
	$("#getsub").click(function(){
		var url = $("input[name='getsub']").val();
		var key = url.split("?v=")[1];
		var key2= key.split("&")[0];
		console.log(key2);
		window.location.href = "getsub?v="+key2; 
	})

	function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>
</body>
</html>