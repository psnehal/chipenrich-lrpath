<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//****************************************************************************************************************************************
String status = request.getParameter("status");
//******************************************************************************************************************************************
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>ChipEnrich</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		
	</head>
	<body>
		<center>
			<div id="mainPanel">

<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->			

				<div id="logoPanel">
					<a href="chipMain.jsp">
						<img  alt="ChipEnrich" src="logos/chipLogoWeb.jpg"></a> <br /> <br /> 
						<span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data</span>
					<hr>
				</div>
							
<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
				
				<div id="contentPanel">
				    <span class="contentTitle">Analysis Status</span>
					<div id="textPanel">
					<span class="text">
					Your job is <b><%=status%></b> for analysis. Please check back after some time.
				    	<br>
				    	<br>
				    	
					</span>
					</div>
					<hr>
				</div>
				
<!--  FOOTER PANEL ------------------------------------------------------------------------------------------------------------------------>	
							
				<div id="contentPanel">
				<div id="textPanel">	
				<center>		
					<img src="logos/dcmb.jpg" /><br />	<br />
					<span class="text">
						Copyright 2013 The University of Michigan 
						<br />
						Developed under the support of the NIH/NCI 
						<br />
						Grant # R01-CA158286-01A1 
						<br />
						<a href="http://portal.ncibi.org/gateway/pdf/Terms%20of%20use-web.pdf" >
                		Terms of Use</a>
					</span>
					</center>
				</div>
			    </div>	
			    
			    						
			</div>
		</center>
		<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-43767728-1', 'umich.edu');
  ga('send', 'pageview');

</script>
 	</body>
</html>	
