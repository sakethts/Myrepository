<!DOCTYPE html>

<%@ page session="true" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="Data.*"%>
<%@ page import="BusinessLogic.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="static Data.Provider.*"%> 
<%@ page import="java.util.*,java.text.*" %>

<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PMS - View Report</title>

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
        ArrayList<TestReport> gori = (ArrayList<TestReport>)request.getAttribute("resultr");
        for(TestReport pit : gori)
        { 
        %>	
    

        <div style="color: white; width: 80%; margin-left: auto; margin-right: auto; text-align: center; padding-bottom: 10%">
            
            <h1><strong>PMS</strong> View Report</h1><br><br>

            <form role="form" action="Home.jsp" method="post" class="registration-form" enctype="multipart/form-data">
                                	
                <input type="text" placeholder="Patient ID..." name="PatientID" id="PatientID" value="<%= pit.PatientID %>"><br><br>
                <input type="text" placeholder="Doctor ID..." name="DoctorID" id="DoctorID" value="<%= pit.DoctorID %>"><br><br>
                <input type="text" placeholder="Date..." name="Date" id="Date" value="<%= pit.Date %>"><br><br>
                <a href="GetReport">Download Report</a><br><br>
                <div class="form-group">
                <textarea style="margin-left: auto; margin-right: auto; height: 150px;" name="Comment" placeholder="Comment..." class="form-about-yourself form-control" id="Comment"><%= pit.Comment %></textarea>
                </div>
                                 
                <br>
                <div class="top-big-link">
                
                <button name="submit" id="submit" class="btn btn-link-1">Back</button>
                </div>
            </form>

            
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