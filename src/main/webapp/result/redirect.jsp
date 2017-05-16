<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String genes = request.getParameter("r");
String[] gs = genes.split(",");
String genesLink = "";
							
for(int x=0; x<gs.length; x++)
{
	genesLink += gs[x] + " OR ";
}

String url = "http://www.ncbi.nlm.nih.gov/gene?term="+ genesLink +"&cmd=DetailsSearch";

response.sendRedirect(url);
%>

