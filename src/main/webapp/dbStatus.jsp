<%@ page language="java" import="javazoom.upload.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*,org.ncibi.ws.client.*,org.ncibi.chipenrich.*" %>
<%@ page import="org.ncibi.ws.request.RequestStatus,
   org.ncibi.ws.*,
   org.ncibi.task.TaskStatus,
  org.ncibi.chipenrich.*"%>
<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />
<%
	//******************************************************************************************************************************************
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");

String uid = request.getParameter("uid");
String name = request.getParameter("name");
System.out.println("Uid is : "+uid + "\n"+"name is "+name);

boolean ok = false;
int count =1;
while (!ok && count < 6)
{ 
	
		NcibiChipEnrichService client = new NcibiChipEnrichService(HttpRequestType.POST);
		Response<RequestStatus<List<ChipEnrichResults>>> rs = client.chipEnrichStatus(uid);
		TaskStatus status = rs.getResponseValue().getTask().getStatus();
		//first check if status is not null
		//if its not null then check if job is done or falise
		
		System.out.println("Status is ==> " + status.name());
		if(!status.name().isEmpty())
		{  
			ok=true;
       	 //Status is not empty then check if job is done or there is R error?
       	 System.out.println("status is not empty");
			if(status == TaskStatus.DONE)
				{   
					
					 List warning  = rs.getResponseValue().getData();
					 if(warning.get(0).equals("Done"))
					{	   
						 System.out.println("yupie your task is done"+ warning.get(0));
						
						 String method = warning.get(1).toString();
						 String jsp = "tabs.jsp?outname="+name+"&method="+method ;
								%><jsp:forward page= "<%=jsp%>"/><%
					 }
		   			else{
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
									Error in your job with " <u> <b> <%= warning.get(0) %></b> </u> " message.
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
						 	</body>
						</html>	
				 <% }
		
			} 
				else { %>
				<jsp:forward page = "status.jsp">  
				  <jsp:param name="status" value="<%=status.name()%>" />				  
				</jsp:forward>
				<% } 
			
		
		}//if loop to check status is not empty 
		//**************************************************************************************************************************************
		else {
            System.out.println("In the taskstatus== done else loop");
            %>
          	<jsp:forward page = "status.jsp">  
				  <jsp:param name="status" value="<%=status.name()%>" />				  
				</jsp:forward>	
            <% }

		
}//while loops		

if (!ok)
{
	 System.out.println("After 5 attempts loops");
	 
%> 
	 <jsp:forward page=  "status.jsp"/>
<%	 
}
%>

%>
