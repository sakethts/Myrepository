<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PMS - Home</title>

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
                <div class="navbar-header">

                </div>
            </div>
        </nav>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-7 text">
                            <form role="form" action="Authentication" method="post" class="registration-form">
                            <h1><strong>PMS</strong> Login</h1>
                            <div class="description">
                            	
                                <input type="text" placeholder="Username..." name="Email" id="Email"><br><br>
                                <input type="password" placeholder="Password..." name="Password" id="Password"><br>
                            </div>
                            <div class="top-big-link">

                                &nbsp;&nbsp;&nbsp;
                                        
                                <button type="submit" name="submit" id="submit" class="btn">Login</button>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	       
                            	<button onClick="parent.location='ForgotPassword.jsp'" class="btn">Forgot Password</button>
                            </div>
                            </form>
                        </div>
                        <div class="col-sm-5 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Sign up now</h3>
                            		<p>Fill in the form below to register:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-pencil"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="Registration" method="post" class="registration-form" id="RegForm" name="RegForm">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-first-name">First name</label>
			                        	<input type="text" name="FirstName" placeholder="First name..." class="form-first-name form-control" id="FirstName" required>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-last-name">Last name</label>
			                        	<input type="text" name="LastName" placeholder="Last name..." class="form-last-name form-control" id="LastName" required>
			                        </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-last-name">Date of birth</label>
                                        <input type="text" name="DateOfBirth" placeholder="Date of birth..." class="form-control"id="DateOfBirth" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-last-name">Gender</label>
                                        <input type="text" name="Gender" placeholder="Gender..." class="form-control"id="Gender" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-email">Email</label>
                                        <input type="email" name="Email" placeholder="Email..." class="form-email form-control" id="Email" required>
                                    </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-phone">Phone</label>
			                        	<input type="text" name="Phone" placeholder="Phone..." class="form-email form-control" id="Phone" required>
			                        </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Address">Address</label>
                                        <input type="text" name="Address" placeholder="Address..." class="form-email form-control" id="Address" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Password">Password</label>
                                        <input type="password" name="Password" placeholder="Password..." class="form-email form-control" id="Password" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Ans1"></label>
                                        <input type="text" name="Ans1" placeholder="Favorite pet..." class="form-email form-control" id="Ans1" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="Ans2"></label>
                                        <input type="text" name="Ans2" placeholder="Favorite movie..." class="form-email form-control" id="Ans2" required>
                                    </div>
                                    <br>
                                    
			                        <button type="submit" form="RegForm" name="submit" id="submit" class="btn">Sign up</button>
                                    
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


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