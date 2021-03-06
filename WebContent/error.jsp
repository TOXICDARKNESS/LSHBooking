<%@ page isErrorPage="true" language="java" import="java.io.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
   if(session.isNew()) {
       session.setAttribute("loggedin", "false");
       session.setAttribute("username", "");
       session.setAttribute("userID", 0);
       session.setAttribute("email", "");
       session.setAttribute("phonenum", 0);
       session.setAttribute("admin", "false");
   }
	String navbar = "<li class=\"nav-item\"><a class=\"nav-link\" href=\"login.jsp?login=attempt\">Login</a></li><br><li class=\"nav-item\"><a class=\"btn btn-primary\" href=\"register.jsp\" role=\"button\">Register</a></li>";
	
	if (session.getAttribute("loggedin") == "true") {
	    navbar = "<div class=\"btn-group\">\n<button type=\"button\" class=\"btn btn-danger dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">" + session.getAttribute("username") + "</button>\n<div class=\"dropdown-menu\">\n<a class=\"dropdown-item\"><img src=\"https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/user.png\" class=\"img-thumbnail\"></a>\n<a class=\"dropdown-item\" href=\"accountbookings.jsp\">View Bookings</a>\n<a class=\"dropdown-item\" href=\"account.jsp\">View Account Details</a>\n<a class=\"dropdown-item\" href=\"logoutaction.jsp\">Logout</a>\n</div>\n</div>";
	}
	String message = exception.getMessage();
	if(message.equals("404")) {
		message = "404";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">

   <link href="CSSJS/css/bootstrap.min.css" rel="stylesheet">
   <link href="CSSJS/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet">
   <link href="CSSJS/css/bootstrap-slider.css" rel="stylesheet">
   <script src="CSSJS/js/bootstrap-slider.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="CSSJS/JQuery/jquery.min.js"></script>
   <script src="CSSJS/js/bootstrap.bundle.min.js"></script>
   <script src="CSSJS/js/bootstrap-datepicker.min.js"></script>
<title>Error!</title>
</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
       <div class="container">
         <a class="navbar-brand" href="index.jsp">LSH Desk Booking System</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
           <ul class="navbar-nav ml-auto">
             <li class="nav-item active">
               <a class="nav-link" href="index.jsp">Home
                 <span class="sr-only">(current)</span>
               </a>
             </li>
             <%= navbar %>
           </ul>
         </div>
       </div>
     </nav>
     <div class="container">
     	<div class="row">
     		<div class="col-3"></div>
     		<div class="col-6">
     			<h1 class="Display4">Error <%=message%></h1>
     			<hr/>
     			<h4>Woops! There has been an error</h3>
     			<br>
     			<br>
     			<a>Want to see more of the error? Press below</a>
     			<div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">StackTrace</button>
  				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
  				  <a class="dropdown-item" href="#"><% StringWriter stringWriter = new StringWriter();
  				PrintWriter printWriter = new PrintWriter(stringWriter);
  				exception.printStackTrace(printWriter);
  				out.println(stringWriter);
  				printWriter.close();
  				stringWriter.close(); %></a>
  				</div>
  				</div>
     		</div>
     		<div class="col-3"></div>
     	</div>
     </div>
</body>
</html>