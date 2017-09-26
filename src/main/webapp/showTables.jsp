<%@ page language="java" import="java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*" %>
<%

//*******************TO read summary File*****************************************************************************************************

String cellLine = request.getParameter("cline");
ArrayList<EnrichRes> peaks = new ArrayList<EnrichRes>();
CreateReport cr = new CreateReport();
peaks = cr.combineObj(cellLine);
///usr/share/chipEnrichData/SummaryReport/Data/");
Collections.sort(peaks, new SortArrayList());

//peaks = read.readSummaryStat("C:/Users/snehal/Desktop/Data Files/encode_histone_results_GM12878_2013-01-30/encode_GM12878_summary-stats.tab",locusDef);
//peaks = read.sortList(sumFilLoc,locusDef);

System.out.println("Size : "+peaks.size());
ArrayList<EnrichRes> peaks2 = new ArrayList<EnrichRes>();

for (EnrichRes x : peaks)
{
    if (!peaks2.contains(x))
    	peaks2.add(x);}
//out.println("size peaks2:   "+peaks2.size());
final Set<EnrichRes> set = new HashSet<EnrichRes>(peaks);

System.out.println("size set   "+set.size());

%> 
 
<%
%> 

  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
			<link rel="stylesheet" type="text/css" href="css/style1.css">
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</title>
</head>
<body>
<center>
<span class="contentTitle"><%=cellLine %></span>        <br/><br/>	 

	<div id="contentPanel">	
	   	 
		<table id="result">	
			<thead>
				<tr class="tableHeader">
						<td bgcolor="#eeeeee">
					    	<span class="text"><b>Index</b></span>
					    </td>
						<td>
					    	<span class="text"><b>TRF</b></span>
					    </td>
					    		     
					    <td>
					    	<span class="text"><b>Peak Caller</b></span>
					    </td>
					    <td>
					    	<span class="text"><b>Broad/Narrow</b></span>
					    </td>
					    <td>
					    	<span class="text"><b># of Peaks</b></span>
					    </td>   
					    <td>
						    <span class="text"><b>Locus Definition</b></span>
					    </td>
					     <td>
						    <span class="text"><b>Mappability</b></span>
					    </td>
					    
					<!--  ChipEnrich -------------------------------------------------------------------------------------------------------------------------->
				     			<td>
						       <span class="text"><b> Peaks to gene assignment</b></span>
						       </td>
						       <td >
						       <span class="text"><b> Summary Plots</b></span>
						       </td>
						       <td bgcolor="#dcdcdc">
						       <span class="text"><b>Chip-Enrich Results</b></span>
						       </td>
						      
					   	      <% if(!cellLine.equals("K562"))
							{	
							%>
							<td>
							<span class="text"><b>Peaks Per Gene</b></span>
							
							<% } %>
							</td>
				<!-- Fet -------------------------------------------------------------------------------------------------------------------------->   
					    <td>
							<span class="text"><b>Fisher's Exact Test Result</b></span>
						</td>
						
				 </tr>
			</thead>
			<tbody>
			<%
				  for(int i = 0; i<peaks.size();i++)
					{
					int count = i+1;
			%>
					<tr>
							<td bgcolor="#eeeeee">
							<span class="text"><%=count%></span>
							</td>
							<td>
							<span class="text"><%=peaks.get(i).getTf()%></span>
							</td>
							<td>
							<span class="text"><%=peaks.get(i).getPeak_caller()%></span>
							</td>
							<td>
							<span class="text"><%=peaks.get(i).getBroad_narrow()%></span>
							</td>
							<td>
							<span class="text"><%=peaks.get(i).getPeakno() %></span>
							</td>
							<td>
							<span class="text"><%=peaks.get(i).getLd()%></span>
				     		</td>
				     		<td>
							<span class="text"><%=peaks.get(i).getMappa()%></span>
				     		</td>
				     	<!-- ChipEnrich -------------------------------------------------------------------------------------------------------------------------->   	
							
							<td><a href="/images/Constant/SummaryReport/Data/<%=cellLine %>/<%=cr.createLink(peaks.get(i).getFilename(),"peaks.tab")%>" target="_blank">peaks</a>
							<span class="text"></span>
							</td>
					
							<td>
							<a href="/images/Constant/SummaryReport/Data/<%=cellLine %>/<%=cr.createLink(peaks.get(i).getFilename(),"qcplots.pdf")%>" target="_blank">plots</a>
							</td>
							<td bgcolor="#dcdcdc">
							<a href="/images/Constant/SummaryReport/Data/<%=cellLine %>/<%=cr.createLink(peaks.get(i).getFilename(),"results.tab")%>"target="_blank">results</a>
							</td>
							<% if(!cellLine.equals("K562"))
							{	
							%>
							<td>
							<a href="/images/Constant/SummaryReport/Data/<%=cellLine %>/<%=cr.createLink(peaks.get(i).getFilename(),"peaks-per-gene.tab")%>" target="_blank">peaks/gene</a>
							
							<% } %>
							</td>
							
							
						<!-- Fet -------------------------------------------------------------------------------------------------------------------------->   
							
							<% if(peaks.get(i).getFilename().contains("no-mappa"))
							{	
							%>
							<td>
							<a href="/images/Constant/SummaryReport/Data/<%=cellLine %><%=cr.createLink(peaks.get(i).getFilename().replace("chipenrich","fet"),"results.tab")%>" target="_blank">results</a>
							
							<% } %>
							</td>
						</tr>	
					<%				
							}
						
					%>
			 </tbody> 
       		</table>  
      
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

				
				
