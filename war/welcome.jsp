<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>Click login button to access the application</p>
<input type="hidden" name="name" id="name"/>
 <input type="hidden" name="id" id="id"/>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function checkLogin(){
	checkLoginState();
	callTweets();
}


function callTweets() {
	 window.location.href='test.jsp?userName='+$('input[name=name]').val()+'&userId='+$('input[name=id]').val();
} 
 

 
 
 function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			FB.api('/me', function(response) {
				 document.getElementById("name").value=response.name;
				  document.getElementById("id").value=response.id;
				  
				});
		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into this app.';
		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into Facebook.';
		}
	}

	// This function is called when someone finishes with the Login
	// Button. See the onlogin handler attached to it in the sample
	// code below.
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '1688118254763675',
			cookie : true, // enable cookies to allow the server to access
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.1' // use version 2.5
		});

		

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
  
</script>
<fb:login-button scope="public_profile, email,user_friends" onlogin="checkLogin();">
</fb:login-button>
 </body>
</html>