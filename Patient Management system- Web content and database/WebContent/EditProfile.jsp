<!DOCTYPE html>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="Data.*"%>
<%@ page import="BusinessLogic.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.IOException"%>
<%@ page import="static Data.Provider.*"%> 
<%@ page import="java.util.*,java.text.*" %>

<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
            <div class="container">
            	<div class="navbar-header" style="float: left;">
					<a style="color: white;" href="Home.jsp">HOME</a>
                </div>
                <div class="navbar-header" style="float: right;">
					<span style="color: white;"><%= session.getAttribute("FirstName") %>&nbsp;<%= session.getAttribute("LastName") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: white;" href="Logout">Logout</a>
                </div>
            </div>
        </nav>
        
        <%
       
    	response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		response.addHeader("Pragma", "no-cache"); 
		response.addDateHeader ("Expires", 0);
        if(session.getAttribute("UserID")==null)
        {
        	response.sendRedirect("index.jsp");
        }
        else{}
    
        
        request.getSession();
        ArrayList<Patient> lassana = (ArrayList<Patient>)request.getAttribute("resultp");
        for(Patient patient : lassana)
        { 
        %>
        <div style="color: white; width: 40%; margin-left: auto; margin-right: auto; text-align: center; padding-bottom: 10%">
            
            <h1><strong>PMS</strong> Edit Profile</h1><br><br>
                   
                            <div class="form-bottom">
			                    <form role="form" action="EditProfile" method="post" class="registration-form" id="RegForm" name="RegForm">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-first-name">First name</label>
			                        	<input type="text" name="FirstName" placeholder="First name..." value=" <%= patient.FirstName %>" class="form-first-name form-control" id="FirstName" required>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-last-name">Last name</label>
			                        	<input type="text" name="LastName" placeholder="Last name..." value=" <%= patient.LastName %>" class="form-last-name form-control" id="LastName" required>
			                        </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-last-name">Date of birth</label>
                                        <input type="text" name="DateOfBirth" placeholder="Date of birth..." value=" <%= patient.DateOfBirth %>" class="form-control"id="DateOfBirth" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-last-name">Gender</label>
                                        <input type="text" name="Gender" placeholder="Gender..." value="<%= patient.Gender %>" class="form-control"id="Gender" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-email">Email</label>
                                        <input type="email" name="Email" placeholder="Email..." value=" <%= patient.Email %>" class="form-email form-control" id="Email" required>
                                    </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-phone">Phone</label>
			                        	<input type="text" name="Phone" placeholder="Phone..." value="<%= patient.Phone %>" class="form-email form-control" id="Phone" required>
			                        </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Address">Address</label>
                                        <input type="text" name="Address" placeholder="Address..." value="<%= patient.Address %>" class="form-email form-control" id="Address" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Password">Password</label>
                                        <input type="password" name="Password" placeholder="Password..." value="<%= patient.Password %>" class="form-email form-control" id="Password" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Ans1"></label>
                                        <input type="text" name="Ans1" placeholder="Favorite pet..." value="<%= patient.Ans1 %>" class="form-email form-control" id="Ans1" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Ans2"></label>
                                        <input type="text" name="Ans2" placeholder="Favorite movie..." value="<%= patient.Ans2 %>" class="form-email form-control" id="Ans2" required>
                                    </div>
                                    <br>
                                    
			                        <button type="submit" form="RegForm" name="submit" id="submit" class="btn">Update Profile</button>
                                    
			                    </form>
		                    </div>
        </div>

        <%
        }
        %>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/retina-1.1.0.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>