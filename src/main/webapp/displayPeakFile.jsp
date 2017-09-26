<%@ page language="java" import="java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.chipenrich.*" %>

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
String method="";
try
{
    
	cursor = nullIntconvert(request.getParameter("c"));
	method = request.getParameter("method");
	
}
catch (NullPointerException e){}

StringBuffer html = new StringBuffer();
//Get the arrylist of peaks from peaks.tab
String outname = request.getParameter("outname");
String peaksTabLink = "displayPeakFile.jsp?outname="+outname+"&c=0&method="+method;
String resultsTabLink = "displayResultsFile.jsp?outname="+outname+"&c=0&method="+method;
String imageLink = "displayImages.jsp?outname="+outname;
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
String outpath = url.getString("uploadDirectory");
String peakPath = outpath+outname+"/"+outname+"_peaks.tab";
//String peakPath = outpath+outname+"/"+outname+"_peaks.tab";
String peakLink =  "Variable/" +outname+"/"+outname+"_peaks.tab";
String mainPage = url.getString("webRoot")+"tabs.jsp?outname="+outname;

System.out.println("method is "+method);

org.ncibi.chipenrich.ReadResultFile resout = new org.ncibi.chipenrich.ReadResultFile();
ArrayList<ChipEnrichPeaks> peaks = new ArrayList<ChipEnrichPeaks>();
peaks = resout.readPeaks(peakPath);
resultSize = peaks.size();
//out.println(resultSize);
int count = 0;
int navsize = 100;
int setsize = navsize + cursor;
count = setsize;
if (setsize > resultSize )
{
	System.out.println("inside count loop");
	setsize = resultSize;
	
}

		
	for(int i = cursor; i<setsize;i++)
			{ 
				html.append("<tr>"
				+"<td bgcolor=\"#eeeeee\">"+(i+1)+"</td>"
				+"<td>"+peaks.get(i).getChrom()+ "</td>"
			   +"<td>"+peaks.get(i).getPeakS()+ "</td>"
			 //  +"<td>"+peaks.get(i).getPeakE()+"</td>"
			 //  +"<td>"+peaks.get(i).getPmid()+ "</td>"
			   +"<td>"+peaks.get(i).getGeneid()+"</td>"
			   +"<td>"+peaks.get(i).getGeneSym()+"</td>"
				+"<td>"+peaks.get(i).getLstart()+ "</td>"
			   +"<td>"+peaks.get(i).getLend()+"</td>"
			   +"<td>"+peaks.get(i).getNtss()+ "</td>"
			  // +"<td>"+peaks.get(i).getDtss()+"</td>"
			 //  +"<td>"+peaks.get(i).getNtssgene()+ "</td>"
			 //  +"<td>"+peaks.get(i).getTssgs()+"</td>"
			 
			   +"</tr>");
			   
			}
	
	
	

				
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<title>ChipEnrich Peaks results</title>

<script type="text/javascript">
  		$(document) .ready(function() {    
  			$('tbody tr' ) .hover( 
		    function(){    
		      $(this) .find(' td' ). addClass(' hover' );    
		    },  
		    function(){    
		      $(this) .find(' td' ). removeClass(' hover' ) ; 
		    } 
		  ) ; 
		});
		</script>
  		
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
    </div>
    
    
<!--  TABS PANEL -------------------------------------------------------->		
<table id="result">
	<thead>
	<tr class="tableHeader">
	<div id="tabsF">
	    <ul>
			<li><a href="<%= mainPage%>"><span> &nbsp;Plots &nbsp;</span></a></li>
			<li><a href="<%=peaksTabLink %>"><span>&nbsp;Peaks &nbsp;</span></a></li>
			<li><a href="<%=resultsTabLink %>"><span>&nbsp;Results &nbsp;</span></a></li>
	     </ul>
	</div>
	</tr>
	</thead>
	</table>  
		


<!--  TOOLBAR PANEL ----------------------------------------------------------------------------------------------------------------------->					
						
	<div id="toolbarPanel">	
	<br/><br/>        
       <span class="contentTitle">Peak-to-gene assignments</span>      
    <br/><br/>	 	 
	<span class="textMediumBold"> Results <%= cursor + 1 %> - <%= count - 1 %> of about <%= resultSize %>  | 
		 <% System.out.println("cursor = "+cursor+"count = "+ count+ "resultSize =="+resultSize + "setsize== "+setsize  );
		 if((cursor - navsize) > -1)
		 { %> <a href="displayPeakFile.jsp?outname=<%=outname %>&c=<%= (cursor - navsize) %>&method=<%= method %>">&#60;Previous</a><%
		 }
		 if(count < resultSize)
		 { %><a href="displayPeakFile.jsp?outname=<%=outname %>&c=<%= setsize %>&s=<%= resultSize %>&method=<%= method %>">Next&#62</a><%
		 } %>
	</span><br/><br/>
	 <a href="/images/<%= peakLink%>">Download all results :</a>
	</div>				
				
				
				
<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
	<div id="contentPanel">
			<table id="result">
				<thead>
				<tr class="tableHeader">
				<td bgcolor="#eeeeee">
				     Index
			    </td>
			    <td>
				    <span class="text"><b>Chrom</b></span>
			    </td>
			   
			    <td>
			    	<span class="text"><b>Peak Midpoint</b></span>
			    </td>
			    <td>
				    <span class="text"><b>Gene Id</b></span>
			    </td>
			    <td>
			    	<span class="text"><b>Gene Symbol</b></span>
			    </td>
			    <td>
			    	<span class="text"><b>Locus Start</b></span>
			    </td>
			    <td>
			    	<span class="text"><b>Locus End</b></span>
			    </td>
			    <td>
			    	<span class="text"><b>Nearest tss</b></span>
			    </td>
			   
		
		 </tr>
		 </thead>
		 <%= html.toString() %>
		</table>
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
