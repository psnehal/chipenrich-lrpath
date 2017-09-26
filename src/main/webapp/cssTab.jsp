<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
    <title>jQuery UI Tabs - Default functionality</title>

    <link rel="stylesheet" type="text/css" href="css/style1.css"/>


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
try
{
    
	cursor = nullIntconvert(request.getParameter("c"));
	outname = "jan25test1";
	
}
catch (NullPointerException e){}
System.out.println("outname is" + outname);
String peaksLink = "displayPeakFile.jsp?outname="+outname+"&c=0";
String resultsLink = "displayResultsFile.jsp?outname="+outname+"&c=0";
String imageLink = "displayImages.jsp?outname="+outname;
String imagelocation = outname+"/"+outname+"_disttss.jpeg";
String imagelocation2 = outname+"/"+outname+"_qcplots.jpeg";


%>

</head>

<body>

<center>
<div id="mainPanel">


<center>

<!--  LOGO PANEL ----------------------------------------------------------------------------------------------------------------------->		
		 <div id="logoPanel">
			<img alt="my Image" src="images/chipLogo.jpg"/>
	 		<br /> <br /> <span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</span> 
	 		<hr></hr>
	        
	    </div>
		
<!--  TABS PANEL -------------------------------------------------------->	
<div id="contentPanel">	
<table id="result">
<thead>
<tr class="tableHeader">
<td>

			<div id="header" >
					<ul>
					<li><a href="#tab1">Images</a></li>
					<li><a href=<%=peaksLink %>>Peak</a></li>
					<li><a href=<%=resultsLink %>>Result</a></li>
					</ul>
			</div>

</td>
<!-- - IMAGE PANEL----------------------------------------------------------------------------- -->
</tr>
</thead>
</table>
</div>
<div id = "contentPanel">
<h4>Circle Tabs</h4>
                <div class="container">
                        <ul id="navCircle">
<!-- CSS Tabs -->
<li><a href="Home.html">Plots</a></li>
<li><a href="Services.html">Peaks</a></li>
<li><a href="Support.html">Results</a></li>

                        </ul>



</div>


                
                
<div id ="contentPanel">
<div id="tabsF">
                                <ul>
                                        <!-- CSS Tabs -->
<li><a href="Home.html"><span> &nbsp; Plots  &nbsp;</span></a></li>
<li><a href="Services.html"><span> &nbsp; Peaks  &nbsp;</span></a></li>
<li><a href="Support.html"><span> &nbsp; Results  &nbsp;</span></a></li>

                                </ul>
                        </div>                
		<div id="contentPanel">
			<div id="#tab1">
					<div id="plots">
					           <table>
						        <tr>
						            <td ROWSPAN=2> <a href="/images/<%= imagelocation2%>"><img alt="Spline Curve" src= "/images/<%= imagelocation2%>" width="404" height= "500" /> </a></td>
								    <td>  <br /> <br /></td> 
								</tr>
								<tr>
			                        <td>
			       	                <a href="/images/<%= imagelocation%>"><img alt="Distance to TSS" src= "/images/<%= imagelocation%>" width="404" height="500"/></a></td>
							   </tr>
					 		  </table>						
			        </div>		
			</div>
		</div>
	
		
</div>
</center>
</div>


</center>	
</body>
</html>