<%@ page language="java" import="javazoom.upload.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*,org.ncibi.ws.client.*,org.ncibi.chipenrich.*" %>
<%@ page import="org.ncibi.ws.request.RequestStatus,
   org.ncibi.ws.*,
   org.ncibi.task.TaskStatus,
  org.ncibi.chipenrich.*"%>
<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />
<%
	//******************************************************************************************************************************************
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
String name = request.getParameter("name");
System.out.println("Name is : "+name);
//String uidlink = "dbConnectError.jsp?uid="+uid+"&name=" + name;
boolean ok = false;
int count =1;

while(!ok && count < 5)
{
	
	ChipEnrichDbConnection con = new ChipEnrichDbConnection();
	String uid = con.getUuid(name);
	System.out.println("Uid is :"+ uid);
	if (uid !=  null){
		
		ok = true;
			%>			
			<jsp:forward page = "dbStatus.jsp">  
				  <jsp:param name="uid" value="<%=uid%>" />
				  <jsp:param name="name" value="<%=name%>" />
			</jsp:forward>	
			<%
	}else
	{
		ok = false;
		count++;
	}
	
}
	%>	
	
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
		<html>
			<head>
					<title>ChIP-Enrich: Gene set enrichment testing for ChIP-seq data</title>
					<link rel="stylesheet" type="text/css" href="css/style1.css">
					<script type="text/javascript" src="js/menu.js"></script>
					<script type="text/javascript" src="js/validation.js"></script>
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
								Problem occurred while connecting to database. Please refresh the page.
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
 <%			
	
	%>

