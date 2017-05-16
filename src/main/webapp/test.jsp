
<%@ page language="java" 
	import="javazoom.upload.*,java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.chipenrich.*,org.ncibi.resource.util.*"
    pageEncoding="ISO-8859-1"%>



<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" >

<jsp:setProperty name="optionBean" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
			<img alt="LRpath" src="images/chipenrich.jpg"> <br /> <br /> <span
			class="logoTitle">ChIP-Enrich: Gene set enrichment testing for ChIP-seq data</span>
			<hr>
		</div>
		
	<!--  FORM PANEL -------------------------------------------------------------------------------------------------------------------------->
	<div id="formContentPanel">
		<span class="contentTitle">Input</span>
		<div id="textPanel">
		<center>
		<div id="formPanel">
			<form action="setName.jsp" method="post" id="upform" name="upform" 
			 enctype="multipart/form-data">
			<input type="hidden" name="isDatabaseExternal" value="true" />
			<input type="hidden" name="todo" value="upload">
			
	
			<table>
				<tr>
				<td align="right" valign="top"><span class="formText">Select input file</span>
				</td>
				<td><input id="uploadfile" type="file" name="uploadfile" size="30" class="formObject"> <br /> <br /> 
				   <span class="footnote"> </span>
				</td>
				</tr>
				
				<tr>
				<td align="right" valign="top"><span class="formText">Out Name</span>
				</td>
				<td><input id="outname" type="text" name="outname" size="30" class="formObject"> <br />
					<span class="footnote">Please provide your output name if you wish to save files with personalized way..</span>
				</td>
			    </tr>
			
			    <tr>
				<td align="right" valign="top"><span class="formText">Email</span>
				</td>
				<td><input id="email" type="text" name="email" size="30" class="formObject"> <br />
					<span class="footnote">Please provide your email address if you wish to be notified when the analysis has been completed.</span>
				</td>
			    </tr>
			    
			    <tr>
			    <td align="right" valign="top" width="140"><span class="formText">Supported Genomes</span></td>
				<td><select name="sglist" id="sglist" size="1" class="formObject"
								onChange="SelectSubCat();">
								<option value="">Select Genome</option>
								<option value="hg19">Human(hg19)</option>
								<option value="mm9">Mouse(mm9)</option>
								
								
								</select>
				</td>
				</tr>    
				
				
				
				<tr>
				<td align="right" valign="top"><span class="formText">Supported Genesets</span>
				</td>
				<td>
					<div id="supgeneset">
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
		
									<li><label><input name="slist"  type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">GO</a>
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
								</ul></li>
						</ul>
					</div> <span class="footnote">Selecting multiple, or a
						large, concept database may require several minutes of
						computation time.</span> 
						<span class="footnote">For approximate LRPath
						running times against different databases view 
						<a href="EstimatedTimesPerDB.html" target="_blank">this</a> table.</span>
						<br/> <br/></td>
				</tr>
				
				<tr>
				
					<td align="right" valign="top"><span class="formText">Methods</span></td>
					<td>
						<div id="methods">
						 <ul>  
						<li><input type="radio" name="method" class="formObject" value="chipenrich" checked="checked"/><span class="formText">Chip-Enrich</span></li>
						<li><input type="radio" name="method"class="formObject" value="fet" /><span class="formText">Fisher's exact test</span></li>
						</ul>  
						</div>
					</td>
				</tr> 
						
			
				<tr>
				<td align="right" valign="top"><span class="formText">Locus Definitions</span></td>
				<td>
				<div id="locusdefinations">
				<ul>
				<li><input type="radio" name="ld" value="1kb"/><span class="formText">1kb</span></li>
				<li><input type="radio" name="ld" value="5kb"  /><span class="formText">5kb</span></li>
				<li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText">Exon</span></li>
				<li><input type="radio" name="ld" value="nearest_gene" onClick="warnForFet(this)"  /><span class="formText">Nearest Gene</span></li>
				<li><input type="radio" name="ld" value="nearest_tss" onClick="warnForFet(this)"/><span class="formText">Nearest TSS</span></li>
				
				</ul>  
				</div>
				</td>
				</tr> 
				
				
				<tr>
				<td align="right" valign="top"><span class="formText"> Mappability </span> </td>
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
				<td align="right" valign="top"><span class="formText"></span></td>
				<td>
				<div id="rangeCheck">
				 <ul>
				    
				     
				 </ul>
				</div>
				</td>
				
				</tr>
				
				
				<tr>
				<td align="right" valign="top"><span class="formText">Summary Plots</span></td>
				<td>
				<div id="plots">
				<ul>
				<li><input type="radio" name="qc" value="T" checked="checked"/><span class="formText">True</span></li>
				<li><input type="radio" name="qc" value="F"  /><span class="formText">False</span></li>
				</ul>  
				</div>
				</td>
				</tr> 
				
				<tr>
			    <td>&nbsp;</td>
			    <td>
			   <input type="button" id="submit_fm" value='Submit' onclick="validateForm()" /></td> 
			    </tr>
						
				</table>
	    
	    </form>
	    <!--  Form Panel-->
	</div>
	</center>
	 <!--  textPanel -->
	</div>
	 <!--  formContentPanel -->
	</div>
	 <!--  mainPanel -->
	</div>
	</center>
	</body>
</html>