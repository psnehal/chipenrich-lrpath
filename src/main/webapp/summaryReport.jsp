<%@ page language="java" import="java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*" %>
<%
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
String sumFilLoc = url.getString("summaryDirectory");

//*******************TO read summary File*****************************************************************************************************
%> 
 
<%
%> 

  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" type="text/css" href="css/style1.css">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>ChIP-Enrich: Gene set enrichment testing for ChIP-seq data</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script>
  $(function() {
	  $('#tabs').tabs({
	       
	    });

	    
  });
  </script>
</head>
<body>
<center>
<div id ="mainPanel">
<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->			

	<div id="logoPanel">
		<a href="chipMain.jsp">
		<img height="50%" width="50%" alt="ChipEnrich" src="logos/chipLogo.jpg"></a><br /> <br /> 
		<span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data</span>
		<hr>
		<span class="summaryTitle">ENCODE Results</span>
	</div>
	

<!--  OVERVIEW PANEL ---------------------------------------------------------------------------------------------------------------------->			
		<div id="contentPanel2">
				<span class="contentTitle">Overview</span>
				<div id="textPanel">
					<span class="text">
Linking the long lists of transcription related factor (TRF) binding sites from a ChIP-seq experiment to biological pathways and processes to facilitate biological discovery is not trivial.  ChIP-Enrich takes as input ChIP-seq data and tests for enrichment of Gene Ontology terms and other gene sets.   The Encyclopedia of DNA Elements (ENCODE) consortium, the goal of which is to identify all functional elements in the human genome, provides a large collection of ChIP-seq datasets from which we can learn. 
 <br/> <br/>
Here we provide ChIP-Enrich results, as well as supporting peak annotations and summary plots, for XXX ENCODE TRFs. For each dataset, we provide ChIP-Enrich and Fisher's exact test results using 4 different approaches to assigning peaks to genes (description here).  Click "Download Zip File" to download the entire set of results, or click on any individual link to download the specified file.
<br/> <br/>
Citation: Welch RP*, Lee C*, Imbriano P, Patil S, Weymouth T, Smith RA, Scott LJ, and Sartor MA. ChIP-Enrich: Improved gene set enrichment testing for ChIP-seq data. 2013.
<br/> <br/>
Change log for this page can be accessed <a href="changeLog.jsp">here</a>. 
</div>
				
					<hr>
					 <center><a href="download.jsp"><span  class="text"> Download bulk files here</span></a></center><br /> <br /> 
		</div>
<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
		
		<div id="tabs">
		<%
			String fileP = url.getString("summaryDirectory")+"Data";
			System.out.println(fileP);
			File folder = new File(fileP);
			ArrayList<String> d = new ArrayList<String>();
			File[] listOfFiles = folder.listFiles(); 		 
			for (int i = 0; i < listOfFiles.length; i++) 
				{
				if (listOfFiles[i].isDirectory())
				    {
					d.add(listOfFiles[i].getName());		
					}
				}
		%>	
		<ul>
		
		
		
								
							<%
						for(int i = 0; i < d.size();i++)
						{	
							String cline = "showTables.jsp?cline="+d.get(i);
						
							%>
								
							<li><a href="<%=cline %>"><span><%=d.get(i)%></span></a></li>
							<%
						}				
		%>	
				
	   </ul>  
				
				  			
	  </div>
	  <br/>
	  <br/>
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
	
				
				
