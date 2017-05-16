
    <%@ page language="java" import="javazoom.upload.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*,org.ncibi.ws.client.*,java.sql.*" %>
<%@ page import="org.ncibi.ws.request.RequestStatus,
   org.ncibi.ws.*,
   org.ncibi.task.TaskStatus,
  org.ncibi.chipenrich.*"%>
  <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />
<%
	//******************************************************************************************************************************************
Connection c;
		Statement s;
		

		String username = "snehal";
		String password = "snehal";
		String name = "snehal";
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/serverapps?useUnicode=true&amp;characterEncoding=UTF-8&amp;autoReconnect=true", "snehal",
				"snehal");
		
		String sql = "Select uuid from Task where id = '1'";
		s = c.createStatement();
		ResultSet results = s.executeQuery(sql);
		String value = "";
		if (results != null)
		{
			while (results.next())
			{
				
				System.out.println("uuid = " + results.getString("uuid"));
				value = results.getString("uuid");
			}
		}
	

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

The uid of the given name is: [ <%= value%> ]
<% 
String uid ="4142173747";
ChipEnrichDbConnection con = new ChipEnrichDbConnection();
String name2 ="testdec24";

con.saveUuid(name, uid, "inspiresnehal@gmail.com");

%>
</body>
</html>