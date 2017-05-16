<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />
<jsp:setProperty name="optionBean" property="*" /> 
<jsp:setProperty name="optionBean" property="outname" value = '<%= request.getParameter("outname") %>' /> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>ChIP-Enrich: Gene set enrichment testing for ChIP-seq data</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
</head>
<body>
<center>
<div id="mainPanel">

<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->

<div id="logoPanel">
<img alt="LRpath" src="images/.jpg"> <br /> <br /> <span
class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data</span>
<hr>
</div>

<!--  OVERVIEW PANEL ---------------------------------------------------------------------------------------------------------------------->

<!--  FORM PANEL -------------------------------------------------------------------------------------------------------------------------->

<div id="formContentPanel">
<span class="contentTitle">Input</span>
<div id="textPanel">
<center>
<div id="formPanel">
			<form action="UserData.jsp" method="post" 
			enctype="multipart/form-data">
					
			
			<!--  BASIC FORM -------------------------------------------------------------------------------------------------------------------------->
			
			<span class="formTitle">ChIP-Enrich(Basic Options)</span>
			<hr>
			<table id="basic">
			
					<tr>
					<td align="right" valign="top"><span class="formText">Select
					input file</span>
					</td>
					<td><input id="uploadfile" type="file" name="uploadfile"
					size="30" class="formObject"> <br /> <br /> <span
					class="footnote"> File containing peaks. The data frame should have 3 columns: chrom, start,and end. </br>
					Chrom should follow UCSC convention, e.g. "chrX".The file should be tab-delimited </br>
					and contain a header with at least the columns chrom, start, and end.</span>
					</td>
					</tr>
					
					
					<tr>
					<td align="right" valign="top"><span class="formText">Out Name</span>
					</td>
					<td><input id="outname" type="text" name="outname" size="30"
					class="formObject"> <br /> <br /> <span
					class="footnote">Please provide your output name you would like to provide
					</span>
					</td>
					</tr>
					
					
					<tr>
					<td align="right" valign="top"><span class="formText">Supported Genomes</span>
					</td>
					<td>
					<div id="supportedGenomes">
					<ul>
					 <li><input name="sglist" value="fet" type="checkbox" />
					      <span class="formText">hg19</span>
					     </li>
					         <li><input name="sglist" value="Chip_Enrich test" type="checkbox" />
					              <span class="formText">mm9</span>
					 </li>
					    </ul>  
					</div>
					   </td>
					</tr>   
					        
					   
					   <tr>
					<td align="right" valign="top" width="140"><span
					class="formText">Supported Gensets</span></td>
					<td><select name="species" id="species" size="1" class="formObject"
					onChange="SelectSubCat();">
					<option value="GOBP">GOBP</option>
					<option value="GOCC">GOCC</option>
					<option value="GOMF">GOMF</option>
					<option value="BP">Biocarta Pathway</option>
					<option value="CT">Cytoband</option>
					<option value="DB">Drug Bank</option>
					<option value="EPG">Ehmn Pathway Gene</option>
					<option value="GE">Gene Expression</option>
					<option value="KP">Kegg Pathway</option>
					<option value="MESH">Mesh</option>
					<option value="METAB">Metabolite</option>
					<option value="MB">Mirbase</option>
					<option value="OMIM">Omim</option>
					<option value="PP">Panther Pathway</option>
					</select>
					</td>
					</tr>
					
					
					<tr>
					<td align="right" valign="top"><span class="formText">Locus Defination</span>
					</td>
					<td>
					<div id="locdef">
					<ul>
					 <li><input name="ld" value="1" type="checkbox" />
					      <span class="formText">1 kb</span>
					     </li>
					         <li><input name="ld" value="5" type="checkbox" />
					              <span class="formText">5 kb</span>
					 </li>
					 <li><input name="ld" value="exon" type="checkbox" />
					      <span class="formText">Exon</span>
					     </li>
					         <li><input name="ld" value="loc_mid" type="checkbox" />
					              <span class="formText">Locus Midpoint</span>
					              <li><input name="ld" value="tss_mid" type="checkbox" />
					      <span class="formText">TSS Midpoint</span>
					     </li>
					         
					    </ul>  
					</div>
					   </td>
					</tr>   
					 
					 
					 
					<tr>
					<td align="right" valign="top"><span class="formText">Statistical tests</span>
					</td>
					<td>
					<div id="st">
					    <ul class="checklist">
					<li><input name="slist"
					value="fet" type="checkbox" /><span
					                       class="formText">Fisher's Exact Test</span>
					</li>
					<li><input name="slist"
					value="Chip_Enrich test" type="checkbox" />
					<span class="formText">Chip-Enrich Test</span>
					</li>
					<li><input name="slist"
					value="bionom" type="checkbox" />
					<span class="formText">Bionomial Test</span>
					</li>
					</ul>
					</div>
					</td>
					 </tr>
					   
					   
					<tr>
					<td align="right" valign="top"><span class="formText">Mappability Test?</span>
					</td>
					<td><input type="radio" name="isMappable"
					class="formObject" value="true" /><span class="formText">True</span>
					<input type="radio" name="isMappable" class="formObject"
					value="false" checked="checked" /><span class="formText">False</span>
					</tr>
					
					<tr>
					<td align="right" valign="top"><span class="formText">qc Plots</span>
					</td>
					<td><input type="radio" name="qc"
					class="formObject" value="true" /><span class="formText">True</span>
					<input type="radio" name="qc" class="formObject"
					value="false" checked="checked" /><span class="formText">False</span>
					</tr>
					 
			   
			   
			 
			</table>
			
			<!--  ADVANCED FORM ----------------------------------------------------------------------------------------------------------------------->
			<!--  SUBMIT FORM ------------------------------------------------------------------------------------------------------------------------->
			
			<center>
			<input type=SUBMIT  />
			</center>
			</form>
			
			
			
</div>
</center>
</div>
</div>

<FORM METHOD=POST ACTION="setName.jsp">Whats your name? <INPUT TYPE=TEXT NAME=username SIZE=20>
<BR>What's your e-mail address? <INPUT TYPE=TEXT NAME=email SIZE=20><BR>
What's your age? <INPUT TYPE=TEXT NAME=age SIZE=4>
<p><INPUT TYPE=SUBMIT>




<!--  LOADING ANIMATION PANEL ------------------------------------------------------------------------------------------------------------->

<div id="loadingPanel" style="display: none;">
<center>
<img src="images/loading.gif" id="preloader" />
</center>
<hr>
</div>

<!--  REFERENCE PANEL --------------------------------------------------------------------------------------------------------------------->

<div id="contentPanel">
<hr>
<span class="contentTitle">Reference</span>
<div id="textPanel">
<span class="text">Please reference the following
publication when citing LRpath: <br /> <br /> <sup>1</sup>
Sartor MA, Leikauf GD, Medvedovic M. LRpath: A logistic regression
approach for identifying enriched biological groups in gene
expression data. Bioinformatics. 2009; 25(2): 211-7. </span>
</div>
<hr />
</div>


<!--  FOOTER PANEL ------------------------------------------------------------------------------------------------------------------------>


<div id="contentPanel">
<div id="textPanel">
<center>
<img src="images/ncibiLogo.gif" /> <br /> <br /> <span
class="text"> Copyright 2010 The University of Michigan <br />
Developed under the support of the NIH/National Library of
Medicine <br /> Grant # R01 LM008106 ("Representing and
Acquiring Knowledge of Genome <br /> Regulation") and the
National Center for Integrative Biomedical <br /> Informatics
(NCIBI), NIH Grant # U54 DA021519 01A1 <br /> Terms of Use </span>
</center>
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