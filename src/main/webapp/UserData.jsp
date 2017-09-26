<%@ page import="javazoom.upload.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*,org.ncibi.ws.client.*" %>
	
<%@ page import="org.ncibi.ws.request.RequestStatus, org.ncibi.ws.*,org.ncibi.chipenrich.ChipEnrichInputArguments"%>

<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

ResourceBundle msg = ResourceBundle.getBundle("org.ncibi.resource.bundle.message");
ResourceBundle u = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
String sender = msg.getString("sender");
String emailMessage = msg.getString("emailMessage");
String subject = msg.getString("subject");
String directionField = "Enriched";
String uid = "";

//******************************************************************************************************************************************

boolean ok = false;
int count =1;

while(!ok && count< 6)
{
	
	NcibiChipEnrichService chipenrichclient = new NcibiChipEnrichService(HttpRequestType.POST);
	Response<String> res = chipenrichclient.submitChipEnrichRequest(optionBean);
	System.out.println(res.getResponseStatus());
	JavaMailer mail = new JavaMailer();
	uid = res.getResponseValue();//?unique location I have to save file into this location
	System.out.println("Uid is :==  "+uid);

	if (uid !=  null ){
					ok = true;
					System.out.println("inside if loop"+ ok);
				//*************To save uid with outname***********************************************************************************************************
					ChipEnrichDbConnection con = new ChipEnrichDbConnection();
					String name =optionBean.getOutName();
					String email = optionBean.getEmail();
					con.saveUuid(name, uid,email);
					
					%>
					<html>
					<head>
							<title>Chip-Enrich</title>
							<link rel="stylesheet" type="text/css" href="css/style.css">
							
					</head>
					<%
						String select[] = optionBean.getSgSetList();
						
						if (select != null && select.length != 0) {
								for (int i = 0; i < select.length; i++) {
								System.out.println(select[i]); 
								}
						}
					%>
					<%
					String url = "chipEnrichResult.jsp?name=" + optionBean.getOutName() ;
					String urllink = u.getString("webRoot") + url;
					System.out.println("Your result is at "+urllink );
					%>
					
					<body>
					<center>
					<div id="mainPanel">
					<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->			
					
									<div id="logoPanel">
										<a href="chipMain.jsp">
										<img  alt="ChipEnrich" src="logos/chipLogoWeb.jpg"></a> <br /> <br /> 
										<span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</span>
										<hr>
									</div>
									<div id="loadingPanel" style="display: none;">
					                                <center>
					                                        <img src="logos/loading.gif" id="preloader" />
					                                </center>
					                                <hr>
					                        </div>
									
									
												
					<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
						<%
						
						
							%>			
									<div id="contentPanel">
								    <span class="contentTitle">Analysis Status</span>
										<div id="textPanel">
										<span class="text">
											Your dataset has been submitted for analysis with uid <%= uid %>. Please click on the link below to check the status of the job
									    	<br>
									    	<br>
									    	<a href="<%= urllink %>"> <%= urllink %></a>
									    	<%
									    	emailMessage = "Hello,\n" 
									    		+ "Your Chipenrich  analysis has been submitted.. \n" 
									    		+ "Please use the link below to check on the status of your analysis.";
											emailMessage += "\n" + urllink ;
													if(!email.isEmpty()){
														mail.sendMail("chipenrich@umich.edu", optionBean.getEmail(), subject, emailMessage);
													}
									    	%>
										</span>
										</div>
										<hr>
										</div>
									
					<!--  FOOTER PANEL ------------------------------------------------------------------------------------------------------------------------>	
												
									<div id="contentPanel">
										<div id="textPanel">			
										<center>
										<img src="logos/dcmb.jpg" />
										<br /><br />
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
			
			}
			
			else
			{	
				System.out.println("inside else loop"+ ok);
				count++;
				//<jsp:forward page=  "dbConnectError.jsp"/>
				%>
			      
				<%
			}
			
}
 if (!ok)
 {
	 System.out.println("After 5 attems loops");
	 
%> 
	 <jsp:forward page=  "dbConnectError.jsp"/>
<%	 
 }
%>

