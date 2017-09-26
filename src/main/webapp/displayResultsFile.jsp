<%@ page language="java" import="java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.chipenrich.*,org.ncibi.resource.util.*" %>

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
    
	cursor = Integer.parseInt(request.getParameter("c"));
	outname = request.getParameter("outname");
	method = request.getParameter("method");
	
}
catch (NullPointerException e){}
StringBuffer html = new StringBuffer();
System.out.println("method is resultfile  "+method);
//Get the arrylist of peaks from peaks.tab
String peaksTabLink = "displayPeakFile.jsp?outname="+outname+"&c=0&method="+method;
String resultsTabLink = "displayResultsFile.jsp?outname="+outname+"&c=0&method="+method;
String imageLink = "displayImages.jsp?outname="+outname+"&method="+method;
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
String outpath = url.getString("uploadDirectory");
String resultPath = outpath+outname+"/"+outname+"_results.tab";

//outpath+outname+"/"+outname+"_results.tab";
String resultLink = "Variable/" +outname+"/"+outname+"_results.tab";
String mainPage = url.getString("webRoot")+"tabs.jsp?outname="+outname+"&method="+method;
ConvertToDouble cd = new ConvertToDouble();
org.ncibi.chipenrich.ReadResultFile resout = new org.ncibi.chipenrich.ReadResultFile();
ArrayList<ChipEnrichResults> results = new ArrayList<ChipEnrichResults>();

results = resout.readRes(resultPath,method);
resultSize = results.size();
int count = 0;
int navsize = 100;
int setsize = navsize + cursor;
count = setsize;
if (count > resultSize )
{
	System.out.println("inside count loop");
	setsize = resultSize;
	
}

		
for(int i = cursor; i<setsize;i++)
{ 
	html.append(
	"<tr>"
	+"<td bgcolor=\"#eeeeee\">"+(i+1)+"</td>"
	+"<td>"+results.get(i).getGtype()+"</td>"
	+"<td>"+results.get(i).getGid()+ "</td>"
    +"<td>"+results.get(i).getDesc()+ "</td>"
    +"<td>"+cd.doubleFormatter(results.get(i).getPvalue())+"</td>"
	+"<td>"+cd.doubleFormatter(results.get(i).getFdr())+ "</td>"
	+"<td>"+cd.doubleFormatter(results.get(i).getEffect())+ "</td>"
    +"<td>"+cd.doubleFormatter(results.get(i).getOratio())+"</td>"
    +"<td>"+results.get(i).getStatus()+ "</td>"
	+"<td>"+results.get(i).getNgg()+ "</td>"
		//	+"<td>"+results.get(i).getNgpg()+"</td>"
	
   +
    "<td>"    
    +"<a href='http://www.ncbi.nlm.nih.gov/gene?term="+results.get(i).getGpg()+"'>"+results.get(i).getNgpg()+"</a></td>"
    //+"<td><a href=\'http://www.ncbi.nlm.nih.gov/gene?term=945, 7097, 3592, 3593'>Geneset.Peak.Genes</a></td>"
	+"</tr>");
//	System.out.println(results.get(i).getNgpg());
}

				
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<title>ChipEnrich Results</title>

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

<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->			
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
	<span class="contentTitle">Gene set enrichment test results</span>
	<br/><br/>
	<span class="textMediumBold"> Results <%= cursor + 1 %> - <%= count - 1 %> of about <%= resultSize %>  | 
				 <% System.out.println("cursor = "+cursor+"count = "+ count+ "resultSize =="+resultSize + "setsize== "+setsize  + "substrct =="+(cursor - navsize) );
				 if((cursor - navsize) > -1)
					 { 
					 %>
					 <a href="displayResultsFile.jsp?outname=<%=outname %>&c=<%= (cursor - navsize) %>&method=<%= method %>&s=<%= resultSize %>">&#60;Previous</a> <% }
				 if(count < resultSize) 
					 { 
					 %> 
					 <a href="displayResultsFile.jsp?outname=<%=outname %>&c=<%= setsize %>&method=<%= method %>&s=<%= resultSize %>">Next&#62</a> <%
					 }
				 %>
				 <br/><br/></span>
				 <a href="/images/<%= resultLink%>">Download all results :</a>
	</div>				
				
				
				
<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
	<div id="contentPanel">
			<table id="result">
			<thead>
			<tr class="tableHeader">
							<td bgcolor="#eeeeee">
				    	<span class="text"><b>Index</b></span>
				    </td>
						     <td>
                                                      <span class="text"><b>Annotation Databases</b></span>
                                                    </td>
		
                                                    
                                                        <td>
                                                           <span class="text"><b>Gene Set ID</b></span>
                                                    </td>

                                                    <td>
                                                        <span class="text"><b>Gene Set Description</b></span>
                                                    </td>
                                                    <td>
                                                        <span class="text"><b>P value</b></span>
                                                    </td>
                                                    <td>
                                                        <span class="text"><b>FDR</b></span>
                                                    </td>
                                                    <td>
                                                        <span class="text"><b>Effect</b></span>
                                                    </td>
                                                    <td>
                                                        <span class="text"><b>Odds Ratio</b></span>
                                                    </td>
                                                    <td>
                                                        <span class="text"><b>Status</b></span>
                                                    </td>
                                                    <td>
                                                        <span class="text"><b># in geneset</b></span>
                                                    </td>
                                                  
                                                     <td>
                                                        <span class="text"><b>Links to geneset<br /> with peak</b></span>
                                                    </td>

                                         <tr>

	
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
