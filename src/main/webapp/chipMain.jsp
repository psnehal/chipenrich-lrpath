<%@ page language="java" 
	import="javazoom.upload.*,java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.chipenrich.*,org.ncibi.resource.util.*"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" >
<jsp:setProperty name="optionBean" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</title>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script type=“text/javascript” src="http://api.recaptcha.net/challenge?k=&lt;your_public_key&gt;"&gt;></script>
</head>

<body>
<center>
<div id="mainPanel">
	
<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->
		<div id="logoPanel">
			<a href="chipMain.jsp">
			<img height="50%" width="50%" alt="ChipEnrich" src="logos/chipLogo.jpg"></a> <br /> <br /> 
			<span class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data and other sets of genomic regions</span>
			<hr>
		</div>
		
		
<!--  OVERVIEW PANEL ---------------------------------------------------------------------------------------------------------------------->		
<div id="contentPanel2">
				
				
				<span class="contentTitle">Overview</span>
				
				<div id="textPanel">
					<span class="text">ChIP-Enrich tests ChIP-seq peak data for enrichment 
					of biological pathways, Gene Ontology terms, and other types of gene sets.  
					The pre-defined gene sets are the same as used in  <a href="http://lrpath.ncibi.org/">LRpath</a>, 
					and can be browsed  <a href="http://lrpath.ncibi.org/browse.jsp">here</a>.
					Using an input .BED file, ChIP-Enrich assigns peaks to genes based on a chosen 
					"locus definition".  The "locus" of a gene is the region from which the gene is 
					predicted to be regulated. ChIP-Enrich uses a logistic regression model to test 
					for association between the presence of at least one peak in a gene and gene set 
					membership. It empirically adjusts for the relationship between the length of the 
					loci (and optionally mappability) and the presence of least one peak in a gene 
					using a binomial cubic smoothing spline term within the logistic model. Detailed 
					methods are provided <a href="data/ChipenrichMethods.pdf">here</a>. Output includes summary plots, 
					peak to gene assignments,and enrichment (and depletion) results including odds ratio, 
					p-value, and FDR for each gene set.	
					<br/>
					<a href="http://broad-enrich.med.umich.edu/" target="_blank"><img height="12%" width="12%" alt="Broad-Enrich" src="logos/broadLogo.png"></a>
					<span style="font-size:14px"> <a href="http://broad-enrich.med.umich.edu/" target="_blank">Broad-Enrich:</a>  
					If your data set consists of broad genomic regions or covers a significant portion of the total genome, 
					we recommend using <a href="http://broad-enrich.med.umich.edu/" target="_blank">Broad-Enrich</a> instead. </span> 
					<br/> <br/>
					
				
				</span>	<div id="more">
				<a href = "#" onclick="expandAdvancedOptions()">more</a>
	</div>
					
				</div>
				
				<hr>
				<center>
				<span class="contentTitle">ENCODE enrichment testing results can be accessed <a href = "summaryReport.jsp">here</a></span>
				</center>
				<hr>
			</div>
			
			
		
<!--  FORM PANEL -------------------------------------------------------------------------------------------------------------------------->
	<div id="formContentPanel">
		
		<div id="textPanel">
		<center>
		<div id="formPanel">
			<form action="setName.jsp" method="post" id="upform" name="upform" 
			 enctype="multipart/form-data">
			<input type="hidden" name="isDatabaseExternal" value="true" />
			<input type="hidden" name="todo" value="upload">
			
	
			<table id="basic">
				<tr>
				<td align="right" valign="top"><span class="formText"><b>Select input file</b></span>
				</td>
				<td><input id="uploadfile" type="file" name="uploadfile" size="30" class="formObject" > <br /> <br /> 
				   <span class="footnote">
				   The following formats are fully supported via their file extensions: .bed, .broadPeak, .narrowPeak, .gff3, .gff2, .gff, and .bedGraph or .bdg. 
				   BED3 through BED6 files are supported under the .bed extension. Files without these extensions are supported under the conditions that 
				   the first 3 columns correspond to 'chr', 'start', and 'end' and that there is either no header column, or it is commented out.
				   </span>
				   <br/> <br/>
				</td>
				</tr>
				
				<tr>
				<td align="right" valign="top"><span class="formText"><b>Analysis Name</b></span>
				</td>
				<td><input id="outname" type="text" name="outname" size="30" class="formObject" onChange="validate(this);"> <br />
					<span class="footnote">
					Please provide a meaningful name for this analysis (used to name output files).
					</span>
					<br/> <br/>
				</td>
			    </tr>
			
			    <tr>
				<td align="right" valign="top"><span class="formText"><b>Email</b></span>
				</td>
				<td><input id="email" type="text" name="email" size="30" class="formObject"> <br />
					<span class="footnote">Please provide your email address if you wish to be notified when the analysis has been completed.</span>
					<br/> <br/>
				</td>
			    </tr>
			    
			    <tr>
			    <td align="right" valign="top" width="140"><span class="formText"><b>Supported Genomes</b></span></td>
				<td><select name="sglist" id="sglist" size="1" class="formObject" onChange="selectMappaOption();">
								<option value="">Select Genome</option>
								<option value="hg19">Human (hg19)</option>
								<option value="hg38">Human (hg38)</option>
								<option value="mm9">Mouse (mm9)</option>
								<option value="mm10">Mouse (mm10)</option>
								<option value="rn4">Rat (rn4)</option>
								<option value="rn5">Rat (rn5)</option>
								<option value="rn6">Rat (rn6)</option>
								<option value="dm3">D. melanogaster (dm3) </option>	
								<option value="dm6">D. melanogaster (dm6) </option>	
								<option value="dre">D. Zebrafish (danRer10) </option>								
								</select>
								<br/> <br/><br/> <br/>
				</td>
				</tr>    
				
				
				
				<tr>
				<td align="right" valign="top"><span class="formText"><b>Annotation Databases</b></span>
				</td>
				<td>
					<div id="databaseList">		
					
						<ul class="checklist">
							<li><label>Functional Annotations</label>
								<ul>
									<li><label><input name="slist" value="biocarta_pathway" type="checkbox"/><a href="http://www.biocarta.com/">Biocarta Pathway</a>
									</label>
									</li>
									<li><label><input name="slist" value="ehmn_pathway_gene" type="checkbox"/><a href="http://www.ehmn.bioinformatics.ed.ac.uk">EHMN
												metabolic pathways</a>
									</label>
									</li>
		
									<li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">GO</a>
									</label>
										<ul>
											<li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/><a href="http://www.geneontology.org/">GO Biological
														Process</a>
											</label>
											</li>
											<li><label><input name="slist" value="GOCC" id="gocell" type="checkbox"/><a href="http://www.geneontology.org/">GO Cellular
														Component</a>
											</label>
											</li>
											<li><label><input name="slist" value="GOMF" id="gomol" type="checkbox"/><a href="http://www.geneontology.org/">GO Molecular
														Function</a>
											</label>
											</li>
										</ul></li>
									<li><label><input name="slist" value="kegg_pathway" type="checkbox"/><a href="http://www.genome.jp/kegg/">KEGG Pathway</a>
									</label>
									</li>
									<li><label><input name="slist" value="panther_pathway" type="checkbox"/><a href="http://www.pantherdb.org/pathway/">Panther
												Pathway</a>
									</label>
									</li>
									<li><label><input name="slist" value="pfam" type="checkbox"/><a href="http://pfam.sanger.ac.uk/">pFAM</a>
									</label>
									</li>
									<li><label><input name="slist" value="reactome" type="checkbox"/><a href="http://www.reactome.org/">Reactome</a>
									</label>
									</li>
								</ul></li>
							<li><label>Literature Derived</label>
								<ul>
									<li><label><input name="slist" value="mesh" type="checkbox"/><a href="http://gene2mesh.ncibi.org/">MeSH</a>
									</label>
									</li>
									
									
								</ul></li>
							<li><label>Targets</label>
								<ul>
									<li><label><input name="slist" value="drug_bank" type="checkbox"/><a href="http://www.drugbank.ca/">Drug Bank</a>
									</label>
									</li>
									<li><label><input name="slist" value="mirbase" type="checkbox"/><a href="http://www.mirbase.org/">miRBase</a>
									</label>
									</li>
									<li><label><input name="slist" value="transcription_factors" type="checkbox"/><a href="http://biobase-international.com/index.php?id=transfac">Transcription
												Factors</a>
									</label>
									</li>
								</ul></li>
							<li><label>Interaction</label>
								<ul>
									<li><label><input name="slist" value="protein_interaction_mimi" type="checkbox"/><a href="http://mimi.ncibi.org/MimiWeb/main-page.jsp">Protein
												Interaction (MiMI)</a>
									</label>
									</li>
								</ul></li>
							<li><label>Other</label>
								<ul>
									<li><label><input name="slist" value="metabolite" type="checkbox"/><a href="http://www.ncibi.org">Metabolite</a>
									</label>
									</li>
									<li><label><input name="slist" value="cytoband" type="checkbox"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">Cytoband</a>
									</label>
									</li>						
									
								</ul>
								<br/>
								
								<li><label>Custom</label>
								<ul>
								<li><label><input name="slist" value="custom" type="checkbox"/><a href="">Custom</a></label>
								<input id="uploadCustomfile" type="file" name="uploadcustomfile" size="30" class="formObject" onchange="uploadFile()"></li>
								</ul>
							    <br/>
							    
							    
							    		
								<li><label>Select All Datatbases</label>
								<ul>
								<li><label><input name="slist2"   value="selectall" type="checkbox"  onclick="selectAllDb(this)"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">SelectAll</a>
								</label>
								</li>
								</ul>
								
							
						</ul>
						</div>
					 <span class="footnote">Selecting multiple, or a
						large, annotation database may require several minutes of
						computation time.</span> 
						<span class="footnote">For approximate Chip-Enrich
						running times against different databases view 
						<a href="data/ChipenrichTestTimes.pdf" target="_blank">this</a> table.</span>
						<br/> <br/></td>
				</tr>
				<tr>
				
					<td align="right" valign="top"><span class="formText"><b>Enrichment Method</b></span></td>
					<td>
						<div id="methods">
						 <ul>  
						<li><input type="radio" name="method" class="formObject" value="chipenrich" checked="checked" onClick="selectMethod(this)"/><span class="formText">Chip-Enrich</span><br />
				<span class="footnote"> (usually best for 1000's to 10,000's of genomics regions)</span></li>
						<li><input type="radio" name="method" class="formObject" value="polyenrich"  onClick="selectMethod(this)" /><span class="formText">Poly-Enrich </span><br />
				<span class="footnote">(usually best for >40,000 of genomic regions) </span></li>
						<li><input type="radio" name="method" class="formObject" value="hybrid"  onClick="selectMethod(this)" /><span class="formText">Hybrid Test</span><br />
				<span class="footnote"> (get the best of both! ...but longer runtime)</span></li>
						<li><input type="radio" name="method"class="formObject" value="fet"  onClick="selectMethod(this)" /><span class="formText">Fisher's exact test</span></li>
						<span class="footnote">
						We recommend using Fisher's Exact test only with the 1kb or 5kb locus definition.
						 Using it with any of the other locus definitions may result in biased enrichment results.
						 </span>
						</ul>  
						 
						 <input id ="checkme"  value="weightinh" type="checkbox"/><span class="formText">"weight peaks by peak strength?"</span><br/>
						 <span class="footnote">Uses signalValue from .narrowpeak, or the 4th column from other file types, such as numeric column of bedGraph</span>
						</div>
						
					</td>
				</tr> 
						
			
				<tr>
				<td align="right" valign="top"><span class="formText"><b>Locus Definition</b></span></td>
				<td>
				<div id="locusdefinations">
				<ul class= "b">
				<li><input type="radio" name="ld" value="1kb" /><span class="formText"> < 1kb</span><br />
				<span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>
				<li><input type="radio" name="ld" value="5kb"  /><span class="formText"> < 5kb</span><br />
				<span class="footnote">(only use peaks within 5kb of a transcription start site)</span></li>
				<li><input type="radio" name="ld" value="10kb"  /><span class="formText"> < 10kb</span><br />
				<span class="footnote">(only use peaks within 10kb of a transcription start site)</span></li>
				<li><input type="radio" name="ld" value="10kb"  /><span class="formText"> < 10kb and more upstream</span><br />
				<span class="footnote">(only use peaks within 10kb and more upstream of a transcription start site)</span></li>
				<li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText">Exon</span><br />
				<span class="footnote">(only use peaks that fall within an annotated exon)</span></li>
				<li><input type="radio" name="ld" value="intron" onClick="warnForFet(this)"/><span class="formText">Intron</span><br />
				<span class="footnote">(only use peaks that fall within an annotated itron)</span></li>
				<li><input type="radio" name="ld" value="nearest_gene" onClick="warnForFet(this)"  /><span class="formText">Nearest Gene</span><br />
				<span class="footnote">(use all peaks; assign peaks to the nearest gene defined by transcription start and end sites)</span></li>
				<li><input type="radio" name="ld" value="nearest_tss" checked="checked" onClick="warnForFet(this)"/><span class="formText">Nearest TSS</span><br />
				<span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span></li>
				<li><input type="radio" name="ld" value="user" onClick="UploadLdFile(this)"/><span class="formText">User Defined</span><br />
				<span class="footnote">(user can input their own locus definition)</span></li>
				</ul> 
				</div>
				</td>
				</tr> 
				
				<tr>
				<td align="right" valign="top"><span class="formText"><b>Filter</b></span>
				</td>
				 <td><span class="formText">Only test gene sets with less than the following number of genes: </span>
                                <input id="filter" type="text" name="filter" size="10" value= "2000" class="formObject" >
                                <span class="formText"></span>
                                        <br/> <span class="footnote">
                                                Filter value should be numeric and greater than 30.It can be used to remove large, vague gene sets such as "binding".
                                                 </span>
                                                 <br/> <br/>

			    </tr>				
				<tr>
				<td align="right" valign="top"><span class="formText"><b> Adjust for the mappability of the gene locus regions</b> </span> </td>
				<td>
				<div id="mapp">
				<ul>
				<li><input type="radio" name="ismappable" value="T" onClick="selectRangeCheck(this)"/> <span class="formText">True</span></li>
				<li><input type="radio" name="ismappable" value="F" onClick="selectRangeCheck(this)" /><span class="formText">False</span></li>
				</ul>  
				</div>
				</td>
				</tr> 
				
				  <tr>
				<td align="right" valign="top"><span class="formText"><b>Peak Threshold Number</b></span>
				</td>
				<td>
				<input id="peakthr" type="text" name="peakthr" size="10" value= "1" class="formObject" onClick="checkPeakThr(this)" > 
				
					<br/> <span class="footnote">
						Number of peaks a gene must have assigned to it before getting coded as 1 (having a peak) in the test. Typically, this should be set to 1.
						 </span>
						 <br/> <br/>
				</td>
			    </tr>
				
				
				    
				<tr>
				<td align="right" valign="top"><span class="formText"></span></td>
				<td>
				<div id="rangeCheck">
				 <ul>
				    
				     
				 </ul>
				</div>
				</td>
				</tr>
								
				
				
				
				<tr>
			    <td>&nbsp;</td>
			    <td>
			   
			   </td> 
			    </tr>
						
				</table>
				 <center>
			   
			   <input type="button"  style="color: #0F226E; padding: 5px; font-family: Georgia, ..., serif; font-size: 12px;" id="submit_fm" value='Submit' onclick="validateForm()" />
			   </center>
			   </br>
			   </br>
	    
	    </form>
	    <!--  Form Panel-->
	</div>
	</center>
	 <!--  textPanel -->
	</div>
	 <!--  formContentPanel -->
	</div>
	<div id="loadingPanel" style="display: none;">
                                <center>
                                        <img src="logos/loading.gif" id="preloader" />
                                </center>
                                <hr>
    </div>
	
		<div id="contentPanel">
				<hr>
				<span class="formTitle" >Reference</span>
				<div id="textPanel">
					<span class="text">Please reference the following
						publication when citing Chip-Enrich: <br /> <br /> <sup>1</sup>
						R.P. Welch, C. Lee, R.A. Smith,S. Patil, T. Weymouth, P. Imbriano, L.J. Scott, M.A. Sartor. "ChIP-Enrich: Gene set enrichment testing for ChIP-seq data." NAR. 2014.</span>
				</div>
				<hr />
				<div id="textPanel">
                         <span class="text">Change log for this page can be accessed <a href = "chipMainChangeLog.jsp">here</a> </span>
                         <br />
                         <span class="text">For support and questions email: snehal@med.umich.edu  <br /> </span>
                 </div>
                 <div id="textPanel">
                         
                 </div>
				
			</div>


			<!--  FOOTER PANEL ------------------------------------------------------------------------------------------------------------------------>


			<div id="contentPanel">
				<div id="textPanel">	
				<center>		
					<img src="logos/dcmb.jpg" /><br />	<br />
					<span class="text">
						Copyright 2013 The University of Michigan 
						<br />
						Developed under the support of the NIH/NCI 
						<br />
						Grant # R01-CA158286-01A1 
						<br />
						<a href="http://portal.ncibi.org/gateway/pdf/Terms%20of%20use-web.pdf" >
                		Terms of Use</a>
					</span>
					</center>
				</div>
			</div>	
	 <!--  mainPanel -->
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