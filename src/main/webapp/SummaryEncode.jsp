<%@ page language="java" import="java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.resource.util.*" %>
<%

//*******************TO read summary File*****************************************************************************************************
ArrayList<EnrichRes> peaks = new ArrayList<EnrichRes>();
CreateReport cr = new CreateReport();
peaks = cr.combineObj("GM12878");
///usr/share/chipEnrichData/SummaryReport/Data/");
Collections.sort(peaks, new SortArrayList());

//peaks = read.readSummaryStat("C:/Users/snehal/Desktop/Data Files/encode_histone_results_GM12878_2013-01-30/encode_GM12878_summary-stats.tab",locusDef);
//peaks = read.sortList(sumFilLoc,locusDef);

out.println("Size : "+peaks.size());
ArrayList<EnrichRes> peaks2 = new ArrayList<EnrichRes>();

for (EnrichRes x : peaks)
{
    if (!peaks2.contains(x))
    	peaks2.add(x);}
out.println("size peaks2:   "+peaks2.size());
final Set<EnrichRes> set = new HashSet<EnrichRes>(peaks);

out.println("size set   "+set.size());

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
<div id ="mainPanel">
<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->			

	<div id="logoPanel">
		<a href="chipMain.jsp">
	<img height="100px" width="375px" alt="ChipEnrich" src="logos/chipLogo.jpg"></a> <br /> <br /> 
		<span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</span>
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
Here we provide ChIP-Enrich results, as well as supporting peak annotations and summary plots, for 110 ENCODE TRFs. For each dataset, we provide ChIP-Enrich and Fisher's exact test results using 4 different approaches to assigning peaks to genes.  Click "Download Zip File" to download the entire set of results, or click on any individual link to download the specified file.
<br/> <br/>
Citation: Welch RP*, Lee C*, Imbriano P, Patil S, Weymouth T, Smith RA, Scott LJ, and Sartor MA. ChIP-Enrich: Improved gene set enrichment testing for ChIP-seq data.NAR. 2014.
<br/> <br/>
Change log for this page can be accessed <a href="changeLog.jsp">here</a>. 
</div>
					
			
				
				<hr>
			</div>
<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
	<div id="ContentPanel">
		<center>
		 <a href="download.jsp"><span  class="text"> Download bulk files here</span></a>
		
		</center>
		<br /><br />
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
				    	<span class="text"><b>Cell Line</b></span>
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
				
				<td><a href="/images/Constant/SummaryReport/Data/<%=cr.createLink(peaks.get(i).getFilename(),"peaks.tab")%>">peaks</a>
				<span class="text"></span>
				</td>
		
				<td>
				<a href="/images/Constant/SummaryReport/Data/<%=cr.createLink(peaks.get(i).getFilename(),"qcplots.pdf")%>">plots</a>
				</td>
				<td bgcolor="#dcdcdc">
				<a href="/images/Constant/SummaryReport/Data/<%=cr.createLink(peaks.get(i).getFilename(),"results.tab")%>">results</a>
				</td>
			<!-- Fet -------------------------------------------------------------------------------------------------------------------------->   
				
				
				<td>
				<a href="/images/Constant/SummaryReport/Data/<%=cr.createLink(peaks.get(i).getFilename().replace("chipenrich","fet"),"results.tab")%>">results</a>
				</td>
				
				
				
			</tr>	
				
				
			
				
		<%				
				}
			
		%>
 		</tbody> 
       </table>  
       </div>
       </div>
</center>
  </body>
 </html>

				
				
