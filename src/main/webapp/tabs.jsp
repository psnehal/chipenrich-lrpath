 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page language="java" import="javazoom.upload.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*,org.ncibi.ws.client.*,org.ncibi.chipenrich.*" %>
 <jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
public int nullIntconvert(String str){
int num=0;
if(str==null){
str="0";
}
else if((str.trim()).equals("null")){
str="0";
}
else if(str.equals("")) {
	
str="0";
}
try{
num=Integer.parseInt(str);
}
catch(Exception e){ }
return num;
}
%>

<%
int resultSize = 0;
int cursor = 0;
String outname = "" ;
String method ="";
try
{
    
	cursor = nullIntconvert(request.getParameter("c"));
	outname = request.getParameter("outname");
	method = request.getParameter("method");
	
}
catch (NullPointerException e){}
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
System.out.println("outname is" + outname);
String peaksTabLink = "displayPeakFile.jsp?outname="+outname+"&c=0&method="+method;
String resultsTabLink = "displayResultsFile.jsp?outname="+outname+"&c=0&method="+method;
String imageLink = "displayImages.jsp?outname="+outname;
String imagelocation = "Variable/"+outname+"/"+outname+"_disttss.jpeg";
String imagelocation2 = "Variable/"+outname+"/"+outname+"_qcplots.jpeg";
String outpath = url.getString("uploadDirectory");
String path = outpath+outname+"/";
//String filename = path+"/"+outname+".zip";
CreateZip cz = new CreateZip();

String location = "Variable/"+outname+"/"+outname+".zip";
System.out.println(path);
cz.createZip(path, outname);

%>

<html lang="en">
<head>
	<meta charset="utf-8" />
    <title>Main Page</title>
    <link rel="stylesheet" type="text/css" href="css/style1.css">
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    
 
</head>
<body>

<center>
<div id="mainPanel">
<!--  LOGO PANEL ----------------------------------------------------------------------------------------------------------------------->		
 	<div id="logoPanel">
		<a href="chipMain.jsp">
		<img height="50%" width="50%" alt="ChipEnrich" src="logos/chipLogo.jpg"></a><br /> <br /> 
		<span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</span>
		<hr>
		<center>
				<button onclick="window.location='/images/<%=location%>';">Download Zip File</button>
		</center>
		<br /> <br />       
   </div>
<!--  TABS PANEL -------------------------------------------------------->		

	<table id="result">
	<thead>
	<tr class="tableHeader">
	<div id="tabsF">
	    <ul>
			<li><a href="#tab1"><span> &nbsp;Plots &nbsp;</span></a></li>
			<li><a href="<%=peaksTabLink %>"><span>&nbsp;Peaks &nbsp;</span></a></li>
			<li><a href="<%=resultsTabLink %>"><span>&nbsp;Results &nbsp;</span></a></li>
	     </ul>
	</div>
	</tr>
	</thead>
	</table>                      


<!-- - IMAGE PANEL----------------------------------------------------------------------------- -->
	<div id="contentPanel">
		<div id="#tab1">
				<div id="plots">
				           <table>
					        <tr>
					            <td ROWSPAN=2> <a href="/images/<%= imagelocation2%>"><img alt="Spline Curve" src= "/images/<%= imagelocation2%>" width="404"  /> </a></td>
							    <td>  <br /> <br /></td> 
							</tr>
							<tr>
		                        <td>
		       	                <a href="/images/<%= imagelocation%>"><img alt="Distance to TSS" src= "/images/<%= imagelocation%>" width="404" /></a></td>
						   </tr>
				 		  </table>						
		        </div>		
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
