<%@ page language="java" import="javazoom.upload.*,java.util.*,java.text.*,java.math.*,org.ncibi.lrpath.*,org.ncibi.resource.util.*,org.ncibi.ws.client.*" %>
<%@ page import="org.ncibi.ws.request.RequestStatus, org.ncibi.ws.*,org.ncibi.task.TaskStatus"%>
<%
//******************************************************************************************************************************************

String uid = request.getParameter("uid");
String df = request.getParameter("df");
String db = "false";
DataWriter write = new DataWriter(); 

NcibiLRPathService client = new NcibiLRPathService(HttpRequestType.POST);
Response<RequestStatus<List<LRPathResult>>> rs = client.lrpathStatus(uid);
TaskStatus status = rs.getResponseValue().getTask().getStatus();

ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");

//******************************************************************************************************************************************

if(status == TaskStatus.DONE)
{
	System.out.println("inside done"+rs.getResponseValue());
	
	
	List<LRPathResult> result = rs.getResponseValue().getData();  	
	LRPathResult[] res = new LRPathResult[result.size()];
	
	for(int i=0; i<result.size(); i++)
	{
		res[i] = result.get(i);
	}
	
	Arrays.sort(res);

	String outFileNum = write.writeToFile(res, df);
	String val = String.valueOf(res.length);

	String viewurl = "view.jsp?db=" + db + "&r=" + df + "&f=1&t=" + outFileNum + "&s=" + val + "&c=0";
	response.sendRedirect(viewurl);	
}
else
{
%>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
		<head>
			<title>LRpath - Pathway Analysis using Logistic Regression</title>
			<link rel="stylesheet" type="text/css" href="css/style.css">
			<script type="text/javascript" src="js/action.js"></script>
		</head>
		<body>
			<center>
				<div id="mainPanel">

	<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->			

					<div id="logoPanel">
						<a href="<%= url.getString("webRoot")%>"><img alt="LRpath" src="images/logo.jpg" border="0"></a>
						<br />
						<br />
						<span class="logoTitle">Pathway Analysis using Logistic Regression</span>
						<hr>
					</div>
								
	<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
					
					<div id="contentPanel">
					    <span class="contentTitle">Analysis Status</span>
						<div id="textPanel">
						<span class="text">
							Your analysis status is : <%= status.toString() %>. Please check back using this link
					    	<br>
					    	<br>
					    	<a href="<%= url.getString("webRoot") %>/result.jsp?uid=<%= uid %>&df=<%= df %>">
					    	<%= url.getString("webRoot") %>/result.jsp?uid=<%= uid %>&df=<%= df %></a>
						</span>
						</div>
						<hr>
					</div>
					
<!--  FOOTER PANEL ------------------------------------------------------------------------------------------------------------------------>	
								
					<div id="contentPanel">
						<div id="textPanel">			
						<center>
						<img src="images/ncibiLogo.gif" />
						<br />
						<br />
						<span class="text">
							Copyright 2010 The University of Michigan 
							<br />
							Developed under the support of the NIH/National Library of Medicine 
							<br />
							Grant # R01 LM008106 ("Representing and Acquiring Knowledge of Genome 
							<br />
							Regulation") and the National Center for Integrative Biomedical 
							<br />
							Informatics (NCIBI), NIH Grant # U54 DA021519 01A1 
							<br />
							Terms of Use 
						</span>
						</center>
						</div>
					</div>									
				</div>
			</center>
	 	</body>
	</html>	
<%	
}
%>