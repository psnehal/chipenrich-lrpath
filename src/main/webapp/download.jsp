<%@ page language="java" import="java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.chipenrich.*" %>
<%
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
String path  = "/images/Constant/SummaryReport/Data/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="css/style1.css">
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
			<img height="50%" width="50%" alt="ChipEnrich" src="logos/chipLogo.jpg"></a> <br /> <br /> 
			<span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</span>
			<hr>
		</div>
    
    


<!--  TOOLBAR PANEL ----------------------------------------------------------------------------------------------------------------------->					
						
	
				
				
<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
	<div id="contentPanel">
                        <table id="result" border = 2>
                                <thead>
                                <tr class="tableHeader">
                                <td bgcolor="#eeeeee">
                                 <span class="text"><b>Locus Definition</b></span>
                            </td>
                            <td bgcolor="#eeeeee">
                                 <span class="text"><b>Mappability Option</b></span>
                            </td>
                            <td>
                                    <span class="text"><b>ChIP-Enrich Result</b></span>
                            </td>

                            <td>
                                <span class="text"><b>ChIP-Enrich Qc-plots</b></span>
                            </td>
                            <td>
                                    <span class="text"><b>Fisher's exact test Result</b></span>
                            </td>
                            <td>
                                <span class="text"><b>Peaks-to-gene assignment</b></span>
                            </td>



                 </tr>
                 </thead>
		     <tr>
		    <td colspan="6" align ="center" bgcolor="#eeeeee"> <span class="text"><b>CellLine : GM12878 </b></span></td>
		  </tr>
			
		    <td colspan="6" align ="center" bgcolor="#eeeeee"> <span class="text"><b>CellLine : GM</b></span> </td>
		  </tr>
	 <tr>
                                 <td rowspan = "2" bgcolor="#eeeeee"><b> 1 <br> kb </b></td>
                                 <td valign ="top" bgcolor="#eeeeee"> No Mappability</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_1kb_chip_NO_results.zip"> Download</a></td>
                                 <td valign ="top"><a href="/images/Constant/SummaryReport/Zip/GM_1kb_chip_NO_qcplots.zip">Download</a> </td>
                                 <td rowspan = "2" ><a href="/images/Constant/SummaryReport/Zip/GM_1kb_fet_NO_results.zip">Download</a> </td>
                                 <td rowspan = "2"><a href="/images/Constant/SummaryReport/Zip/GM_1kb_chip_36_peaks.zip">Download</a></td>
                    </tr>
                    
                    <tr>

                                 <td valign ="top" bgcolor="#eeeeee"> 36 mers</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_1kb_chip_36_results.zip">Download</a></td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_1kb_chip_36_qcplots.zip">Download</a></td>

                   </tr>

                 <tr>
                       <td rowspan = "2" bgcolor="#eeeeee"><b>  5 <br> kb </b></td>
                                 <td valign ="top" bgcolor="#eeeeee"> No Mappability</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_5kb_chip_NO_results.zip"> Download</a></td>
                                 <td valign ="top"><a href="/images/Constant/SummaryReport/Zip/GM_5kb_chip_NO_qcplots.zip">Download</a> </td>
                                 <td rowspan = "2" ><a href="/images/Constant/SummaryReport/Zip/GM_5kb_fet_NO_results.zip">Download</a></td>
                                 <td rowspan = "2"><a href="/images/Constant/SummaryReport/Zip/GM_5kb_chip_36_peaks.zip">Download</a></td>
                    </tr>
                    <tr>

                                 <td valign ="top" bgcolor="#eeeeee"> 36 mers</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_5kb_chip_36_results.zip">Download</a></td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_5kb_chip_36_qcplots.zip">Download</a></td>

                   </tr>
			
		 <tr>
                                 <td rowspan = "2" bgcolor="#eeeeee"><b>  Nearest <br> TSS </b></td>
                                 <td valign ="top" bgcolor="#eeeeee"> No Mappability</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_NT_chip_NO_results.zip"> Download</a></td>
                                 <td valign ="top"><a href="/images/Constant/SummaryReport/Zip/GM_NT_chip_NO_qcplots.zip">Download</a> </td>
                                 <td rowspan = "2" ><a href="/images/Constant/SummaryReport/Zip/GM_NT_fet_NO_results.zip">Download</a> </td>
                                 <td rowspan = "2"><a href="/images/Constant/SummaryReport/Zip/GM_NT_chip_36_peaks.zip">Download</a></td>
                    </tr>
                    
                    <tr>

                                 <td valign ="top" bgcolor="#eeeeee"> 36 mers</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_NT_chip_36_results.zip">Download</a></td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_NT_chip_36_qcplots.zip">Download</a></td>

                   </tr>

                  <tr>
                       <td rowspan = "2" bgcolor="#eeeeee"><b>  Nearest <br> Gene </b></td>
                                 <td valign ="top" bgcolor="#eeeeee"> No Mappability</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_NG_chip_NO_results.zip"> Download</a></td>
                                 <td valign ="top"><a href="/images/Constant/SummaryReport/Zip/GM_NG_chip_NO_qcplots.zip">Download</a> </td>
                                 <td rowspan = "2" ><a href="/images/Constant/SummaryReport/Zip/GM_NG_fet_NO_results.zip">Download</a></td>
                                 <td rowspan = "2"><a href="/images/Constant/SummaryReport/Zip/GM_NG_chip_36_peaks.zip">Download</a></td>
                    </tr>
                    <tr>

                                 <td valign ="top" bgcolor="#eeeeee"> 36 mers</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_NG_chip_36_results.zip">Download</a></td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/GM_NG_chip_36_qcplots.zip">Download</a></td>

                   </tr>
		 
		 

 <tr>
		    <td colspan="6" align ="center" bgcolor="#eeeeee"> <span class="text"><b>CellLine : K562</b></span> </td>
		  </tr>
			
		 <tr>
                                 <td rowspan = "2" bgcolor="#eeeeee"><b>  Nearest <br> TSS </b></td>
                                 <td valign ="top" bgcolor="#eeeeee"> No Mappability</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/K562_NT_chip_NO_results.zip"> Download</a></td>
                                 <td valign ="top"><a href="/images/Constant/SummaryReport/Zip/K562_NT_chip_NO_qcplots.zip">Download</a> </td>
                                 <td rowspan = "2" ><a href="/images/Constant/SummaryReport/Zip/K562_NT_fet_NO_results.zip">Download</a> </td>
                                 <td rowspan = "2"><a href="/images/Constant/SummaryReport/Zip/K562_NT_chip_NO_peaks.zip">Download</a></td>
                    </tr>
                    
                    <tr>

                                 <td valign ="top" bgcolor="#eeeeee"> 36 mers</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/K562_NT_chip_36_results.zip">Download</a></td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/K562_NT_chip_36_qcplots.zip">Download</a></td>

                   </tr>

                  <tr>
                       <td rowspan = "2" bgcolor="#eeeeee"><b>  Nearest <br> Gene </b></td>
                                 <td valign ="top" bgcolor="#eeeeee"> No Mappability</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/K562_NG_chip_NO_results.zip"> Download</a></td>
                                 <td valign ="top"><a href="/images/Constant/SummaryReport/Zip/K562_NG_chip_NO_qcplots.zip">Download</a> </td>
                                 <td rowspan = "2" ><a href="/images/Constant/SummaryReport/Zip/K562_NG_fet_NO_results.zip">Download</a></td>
                                 <td rowspan = "2"><a href="/images/Constant/SummaryReport/Zip/K562_NG_chip_36_peaks.zip">Download</a></td>
                    </tr>
                    <tr>

                                 <td valign ="top" bgcolor="#eeeeee"> 36 mers</td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/K562_NG_chip_36_results.zip">Download</a></td>
                                 <td valign ="top"> <a href="/images/Constant/SummaryReport/Zip/K562_NG_chip_36_qcplots.zip">Download</a></td>

                   </tr>
		 
		  
		   
		</table>
	</div>
	</div>

	<div id = "contentPanel">
	        <center>
	       <button onclick="window.location='/images/Constant/SummaryReport/Zip/AllData.tar.gz';">Click here to downaload all files</button>
	        </center>
		</div>
	<br /> <br /> 
	
	
	

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