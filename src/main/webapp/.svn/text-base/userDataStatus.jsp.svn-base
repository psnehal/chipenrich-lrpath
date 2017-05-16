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
String uid = null;

//******************************************************************************************************************************************

System.out.println("uid is :==  "+uid);

if(uid !=  null)
{	
	%>
      <jsp:forward page=  "dbConnectError.jsp"/>
	<%
}
else{
		
			out.println("uid is null");

}
%>

