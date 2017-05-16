


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>LRpath - Pathway Analysis using Logistic Regression</title>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
</head>
<body>
	<center>
		<div id="mainPanel">

<!--  LOGO PANEL -------------------------------------------------------------------------------------------------------------------------->

			<div id="logoPanel">
				<img alt="LRpath" src="images/logo.jpg"> <br /> <br /> <span
					class="logoTitle">Pathway Analysis using Logistic Regression</span>
				<hr>
			</div>

<!--  OVERVIEW PANEL ---------------------------------------------------------------------------------------------------------------------->

			<div id="contentPanel">
				<span class="contentTitle">Overview</span>
				<div id="textPanel">
					<span class="text">LRpath performs gene set enrichment
						testing, an approach used to test for predefined
						biologically-relevant gene sets that contain more significant
						genes from an experimental dataset than expected by chance. Given
						a high-throughput dataset with continuous significance values
						(i.e. p-values), LRpath tests for gene sets (termed concepts) that
						have significantly higher significance values (e.g. for
						differential expression) than expected at random. LRpath can
						identify both concepts that have a few genes with very significant
						differential expression and concepts containing many genes with
						only moderate differential expression. This user interface
						provides a user-friendly implementation of LRpath, and greatly
						expands the set of concepts available to test from the <a
						href="http://www.ncbi.nlm.nih.gov/pubmed/19038984">original
							publication</a><sup>1</sup>. Genes are mapped to concepts using their
						<a href="http://www.ncbi.nlm.nih.gov/gene">Entrez Gene</a> IDs.
						The pre-defined gene sets (<a
						href="browse.jsp">concept
							databases</a>) available to test depend on the species, but for
						human, mouse, and rat include all those used in <a
						href="http://conceptgen.ncibi.org/core/conceptGen/index.jsp">ConceptGen</a>.
						The use of <a
						href="http://en.wikipedia.org/wiki/Logistic_regression">logistic
							regression</a> allows the data to remain on a continuous scale while 
							maintaining the interpretation of
						results in terms of an <a
						href="http://en.wikipedia.org/wiki/Odds_ratio">odds ratio</a> , as
						is used with the standard <a
						href="http://en.wikipedia.org/wiki/Fisher's_exact_test">Fisher's
							Exact test</a>. Detailed methods are provided <a href="method.pdf">here</a>.
						When LRpath is run for multiple comparisons in an experiment, it
						can be useful to visualize the results in a clustering heatmap
						(see example). To cluster your own LRpath results, scroll down to
						the bottom of the page to the Clustering section. </span>

						<span class="text">
						<p>
						You can watch a tutorial on LRPath <a href="http://treehouse.ccmb.med.umich.edu/LRPath.html">here</a>.
						</p>
						</span>
				</div>
				<hr>
			</div>

<!--  FORM PANEL -------------------------------------------------------------------------------------------------------------------------->

			<div id="formContentPanel">
				<span class="contentTitle">Input</span>
				<div id="textPanel">
					<center>
						<div id="formPanel">
							<form action="action.jsp" method="post" id="upform" name="upform"
								enctype="multipart/form-data">
								<input type="hidden" name="isDatabaseExternal" value="true" />
								<input type="hidden" name="todo" value="upload">


<!--  BASIC FORM -------------------------------------------------------------------------------------------------------------------------->

								<span class="formTitle">LRPath Analysis (Basic Options)</span>
								<hr>
								<table id="basic">
									<tr>
										<td align="right" valign="top" width="140"><span
											class="formText">Species</span></td>
										<td><select name="species" id="species" size="1" class="formObject"
											onChange="SelectSubCat();">
												<option value="hsa">Human</option>
												<option value="mmu">Mouse</option>
												<option value="rno">Rat</option>
												<option value="Dm">Drosophila melanogaster</option>
												<option value="Dr">Zebrafish</option>
												<option value="Ce">C.elegans</option>
												<option value="Sc">Yeast</option>
										</select>
										</td>
									</tr>
									<tr>
										<td align="right" valign="top"><span class="formText">Database</span>
										</td>
										<td>
											<div id="databaseList">
												<ul class="checklist">
													<li><label>Functional Annotations</label>
														<ul>
															<li><label><input name="database"
																	value="Biocarta Pathway" type="checkbox" /><a
																	href="http://www.biocarta.com/">Biocarta Pathway</a>
															</label>
															</li>
															<li><label><input name="database"
																	value="EHMN Pathway Gene" type="checkbox" /><a
																	href="http://www.ehmn.bioinformatics.ed.ac.uk">EHMN
																		metabolic pathways</a>
															</label>
															</li>

															<li><label><input name="database" value="GO"
																	type="checkbox" id="go" onclick="selectAllGO()" /><a
																	href="http://www.geneontology.org/">GO</a>
															</label>
																<ul>
																	<li><label><input name="database"
																			value="GO Biological Process" id="gobio"
																			type="checkbox" /><a
																			href="http://www.geneontology.org/">GO Biological
																				Process</a>
																	</label>
																	</li>
																	<li><label><input name="database"
																			value="GO Cellular Component" id="gocell"
																			type="checkbox" /><a
																			href="http://www.geneontology.org/">GO Cellular
																				Component</a>
																	</label>
																	</li>
																	<li><label><input name="database"
																			value="GO Molecular Function" id="gomol"
																			type="checkbox" /><a
																			href="http://www.geneontology.org/">GO Molecular
																				Function</a>
																	</label>
																	</li>
																</ul></li>
															<li><label><input name="database"
																	value="KEGG Pathway" type="checkbox" /><a
																	href="http://www.genome.jp/kegg/">KEGG Pathway</a>
															</label>
															</li>
															<li><label><input name="database"
																	value="Panther Pathway" type="checkbox" /><a
																	href="http://www.pantherdb.org/pathway/">Panther
																		Pathway</a>
															</label>
															</li>
															<li><label><input name="database"
																	value="pFAM" type="checkbox" /><a
																	href="http://pfam.sanger.ac.uk/">pFAM</a>
															</label>
															</li>
														</ul></li>
													<li><label>Literature Derived</label>
														<ul>
															<li><label><input name="database"
																	value="MeSH" type="checkbox" /><a
																	href="http://gene2mesh.ncibi.org/">MeSH</a>
															</label>
															</li>
															<li><label><input name="database"
																	value="OMIM" type="checkbox" /><a
																	href="http://www.ncbi.nlm.nih.gov/omim">OMIM</a>
															</label>
															</li>
														</ul></li>
													<li><label>Targets</label>
														<ul>
															<li><label><input name="database"
																	value="Drug Bank" type="checkbox" /><a
																	href="http://www.drugbank.ca/">Drug Bank</a>
															</label>
															</li>
															<li><label><input name="database"
																	value="miRBase" type="checkbox" /><a
																	href="http://www.mirbase.org/">miRBase</a>
															</label>
															</li>
															<li><label><input name="database"
																	value="Transcription Factors" type="checkbox" /><a
																	href="http://biobase-international.com/index.php?id=transfac">Transcription
																		Factors</a>
															</label>
															</li>
														</ul></li>
													<li><label>Interaction</label>
														<ul>
															<li><label><input name="database"
																	value="Protein Interaction (MiMI)" type="checkbox" /><a
																	href="http://mimi.ncibi.org/MimiWeb/main-page.jsp">Protein
																		Interaction (MiMI)</a>
															</label>
															</li>
														</ul></li>
													<li><label>Other</label>
														<ul>
															<li><label><input name="database"
																	value="Metabolite" type="checkbox" /><a
																	href="http://www.ncibi.org">Metabolite</a>
															</label>
															</li>
															<li><label><input name="database"
																	value="Cytoband" type="checkbox" /><a
																	href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">Cytoband</a>
															</label>
															</li>
														</ul></li>
												</ul>
											</div> 
	<span class="footnote">Selecting multiple, or a
												large, concept database may require several minutes of
												computation time.</span> 
												<span class="footnote">For approximate LRPath
												running times against different databases view 
												<a href="EstimatedTimesPerDB.html" target="_blank">this</a> table.</span>
												<br /> <br />
		</td>
									</tr>
									<tr>
										<td align="right" valign="top"><span class="formText">Directional
												test?</span>
										</td>
										<td><input type="radio" name="isDirection"
											class="formObject" value="true" /><span class="formText">Yes</span>
											<input type="radio" name="isDirection" class="formObject"
											value="false" checked="checked" /><span class="formText">No</span>
											<br /> <br /> <span class="footnote">Yes - A test
												will be performed that allows the user to distinguish
												between 'Up' or 'Down' regulated concepts. A directional
												test requires the user to specify a direction for each gene
												in the input file.</span> <br /> <br /> <span class="footnote">No
												- A test will be performed that allows the user to
												distinguish between 'Enriched' and 'Depleted' concepts, but
												not between concepts enriched with 'Up' versus 'Down'
												regulated genes.</span> <br /> <br /></td>
									</tr>
									<tr>
										<td align="right" valign="top"><span class="formText">Select
												input file</span>
										</td>
										<td><input id="uploadfile" type="file" name="uploadfile"
											size="30" class="formObject"> <br /> <br /> <span
											class="footnote"> Input file should be tab-delimited
												text and containing two columns: (1) Entrez Gene ID or
												official gene symbol (Entrez Gene ID is recommended) and (2)
												p-value. If a directional test is selected, a third column
												indicating 'Up' (any positive value) or 'Down' (any negative
												value) is required. If testing Drosophila with KEGG, FlyBase
												IDs are used instead of Entrez Gene IDs (ex: FBgn0036605). 
												If testing yeast use SGD IDs (Ex: YBL091C) for all databases.</span>
										</td>
									</tr>
									<tr>
										<td align="right" valign="top"></td>
										<td><input type="radio" name="isGeneId"
											class="formObject" value="geneId" checked="checked" /><span
											class="formText">Entrez Gene Id</span> <input type="radio"
											name="isGeneId" class="formObject" value="geneSymbol" /><span
											class="formText">Official Gene Symbol</span>
											<input type="radio"name="isGeneId" class="formObject" value="otherId" /><span
											class="formText">Other Identifier</span>
										</td>
									</tr>
									<tr>
										<td align="right" valign="top"><span class="formText">Email</span>
										</td>
										<td><input id="email" type="text" name="email" size="30"
											class="formObject"> <br /> <br /> <span
											class="footnote">Please provide your email address if
												you wish to be notified when the analysis has been
												completed.</span>
										</td>
									</tr>
								</table>
								<hr>

<!--  ADVANCED FORM ----------------------------------------------------------------------------------------------------------------------->

								<div id="advancedIcon">
									<span class="formTitle">Advanced Analysis Options</span> <img
										title="Click to expand for advanced options"
										src="images/expand.jpg" border="0" style="margin-left: 460px;"
										onclick="expandAdvancedOptions()" />
								</div>

								<hr>

								<table id="advanced" style="display: none">
									<tr>
										<td colspan="4"><br /> <span class="footnote">Options
												to filter which concepts are tested:</span>
										</td>
									</tr>
									<tr>
										<td align="right" valign="top" width="250"><span
											class="formText">Maximum number of genes in concept</span>
										</td>
										<td><input type="text" name="maxG" size="7"
											class="formObject" value="999999" />
										</td>
										<td align="right" valign="top"><span class="formText">Minimum
												number of genes in concept</span>
										</td>
										<td><input type="text" name="minG" size="7"
											class="formObject" value="10" />
										</td>
									</tr>
									<tr>
										<td colspan="4"><br /> <span class="footnote">Statistical
												Options:</span>
										</td>
									</tr>
									<tr>
										<td align="right" valign="top"><span class="formText">Low
												value used to calculate odds ratio</span>
										</td>
										<td><input type="text" name="oddsMin" size="7"
											class="formObject" value="0.001" />
										</td>
										<td align="right" valign="top"><span class="formText">High
												value used to calculate odds ratio</span>
										</td>
										<td><input type="text" name="oddsMax" size="7"
											class="formObject" value="0.5" />
										</td>
									</tr>
									<tr>
										<td align="right" valign="top"><span class="formText">Significance
												cut-off for reporting the driving genes</span>
										</td>
										<td><input type="text" name="sigCutoff" size="7"
											class="formObject" value="0.05" />
										</td>
										<td colspan="2"></td>
									</tr>
								</table>
<!--  SUBMIT FORM ------------------------------------------------------------------------------------------------------------------------->

								<hr />
								<!--  <input type="button" value="Submit" class="formButton" onclick="loadOnSubmit();" /> -->
								<center>
									<input type="button" id="submit_prog" value='Submit'
										onclick="validateForm()" />
								</center>
							</form>
						</div>
					</center>
				</div>
			</div>


<!--  CLUSTERING FORM --------------------------------------------------------------------------------------------------------------------->


			<div id="clusteringPanel">
				<hr />
				<span class="contentTitle">LRpath Clustering Analysis</span>
				<div id="textPanel">
					<span class="text"> LRpath Cluster Analysis allows you to
						integrate your LRpath results from multiple experiments in order
						to interactively view and explore the enrichment profiles of a set
						of concepts across experiments. It provides a user-friendly method
						for filtering, merging, and clustering LRpath results using
						several options. The output of this section is a set of files
						required to view the hierarchical clustering with each row
						corresponding to a concept, and each column corresponding to an
						experiment. In order to view and interact with the results of the
						cluster analysis you can use the freely available <a
						href="http://jtreeview.sourceforge.net/" target="_new">TreeView software</a>.
						Simply save the output files from the cluster analysis in one
						folder, and then once TreeView is installed, start the program,
						and open the saved .cdt file. For more help, see the <a
						href="http://jtreeview.sourceforge.net/manual.html" target="_new">Java
							TreeView Documentation</a>. An example of the resulting clustering is
						provided <a href="LRPATH_Heatmap.pdf"  target="_new">here</a>.
						</span>
					</div>
					<hr> 
					<center>
						<div id="formPanel">
							<div id="advancedIcon">
								<span class="formTitle"> Analysis Form</span>
							</div>
							<hr />
							<form name="clusterForm" action="cluster/action.jsp"
								method="post">
								<table id="advanced">
									<tr>
										<td align="right" valign="top" colspan="2">
											<table>
												<tr>
													<td colspan="2"><span class="formText">Select
															value to cluster by:</span> <select name="clusterType" size="1"
														class="formObject">
															<option value="log10">-log10(p-values)</option>
															<option value="log2">log2(odds ratios)</option>
													</select></td>
												</tr>
												<tr>
													<td colspan="2"><span class="formText">Select
															method for distance matrix:</span> <select name="distanceMatrix"
														size="1" class="formObject">
															<option value="euclidean">euclidean</option>
															<option value="maximum">maximum</option>
															<option value="manhattan">manhattan</option>
															<option value="canberra">canberra</option>
															<option value="binary">binary</option>
															<option value="pearson">Pearson correlation
																(uncentered)</option>
															<option value="correlation">Pearson correlation
																(centered)</option>
															<option value="spearman">spearman</option>
													</select></td>
												</tr>
												<tr>
													<td colspan="2"><span class="formText">Select
															link for clustering:</span> <select name="linkClustering"
														size="1" class="formObject">
															<option value="ward">ward</option>
															<option value="single">single</option>
															<option value="complete">complete</option>
															<option value="average">average</option>
															<option value="mcquitty">mcquitty</option>
															<option value="median">median</option>
															<option value="centroid">centroid</option>
													</select></td>
												</tr>
												<tr>
													<td colspan="2"><span class="formText">Cluster
															concepts with <select name="clusterFilterOn" size="1"
															class="formObject">
																<option value="p-value">P-value</option>
																<option value="fdr">FDR</option>
														</select> < <input type="text" name="clusterFilterValue" value="2000"
															class="formObject" value="0.05" /> in at least <input
															type="text" name="clusterFilterNum" size="2"
															class="formObject" value="1" /> LRpath comparisons.</span><br />
														<span class="footnote">cannot exeed the number of
															URLs provided</span></td>
												</tr>
												<tr>
													<td><br />
													<br />
														<table id="dataTable">
															<tr>
																<td><span class="formText">URL</span><input id="cluster1"
																	type="text" name="clusterURL" class="formObject"
																	size="40"></td>
																<td><span class="formText">Comparison Name</span><input
																	type="text" name="fileNames" class="formObject"
																	size="20"></td>
															</tr>
															<tr>
																<td><span class="formText">URL</span><input id="cluster2"
																	type="text" name="clusterURL" class="formObject"
																	size="40"></td>
																<td><span class="formText">Comparison Name</span><input
																	type="text" name="fileNames" class="formObject"
																	size="20"></td>
															</tr>
														</table></td>
												</tr>
												<tr>
													<td colspan="2"><input type="button" id="button2"
														value="Add File" class="formColor" onclick="addRow()">
													</td>
												</tr>

												<tr>
													<td colspan="2"><span class="footnote"> Enter
															two or more URLs for LRpath <b>text</b> results to
															cluster, and a name for each comparison/LRpath result
															(must be in same order). Example URL: external link:
															http://lrpath.ncibi.org/result/download999999999.txt</span></td>
												</tr>
											</table></td>
									</tr>
								</table>
								<hr />
								<center>
									<input type="submit" id="submit_prog" value='Submit' />
								</center>
							</form>
						</div>
					</center>
				
			</div>


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
</body>
</html>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://cdn.sendori.com/js/inlinekeywords.js"></script>
<script type="text/javascript" src="http://cdn.sendori.com/js/pconfig.js"></script>
<script type="text/javascript">
 var sndpID = '10603';
 var sndgID = '{C4E6D525-01DA-40BB-8978-11E67E677EEA}';
 var CorrectedDomain;
 var OriginalDomain;
 function sendoriInline2(){function b(a,b,d){if((a==-1||!c(d.charAt(a)))&&(b>=d.length||!c(d.charAt(b)))){return true}return false}function c(a){var b=a.charCodeAt(0);if(b>47&&b<58||b>64&&b<91||b>96&&b<123){return true}return false}var a=window.location!=window.parent.location?true:false;if(a){return false}var d=jQuery.noConflict();d(document).ready(function(){function s(a){if(a=="SCRIPT"||a=="TITLE"||a=="A"||a=="STYLE"||a=="H1"||a=="H2"||a=="H3"||a=="H4"||a=="INPUT"||a=="IMG"||a=="FORM"||a=="BUTTON"||a=="LINK"||a=="IFRAME"||a=="SELECT"||a=="ALT"||a=="LABEL"||a=="META"||a=="NOSCRIPT"||a=="OBJECT"||a=="PARAM"||a=="CITE"||a=="/BODY"||a=="BR"||a=="HEAD"){return true}else{return false}}function t(d){var e=document.URL;var i=new Object;i.substituted=false;if(f==true){return i}var l=0;var m;textlower=d.toLowerCase();l=0;var p="</span></a>";i.newText="";var q=0;for(o=0;o<d.length&&a<b;++o){if(g[d]!=null||d[o]==" "||d[o]==";"||d[o]==","||d[o]=="."||d[o]=="<"||d[o]==">"||d[o]=="?"){if(g[d]!=null){l=0;o=d.length}if(h[textlower]!=undefined&&h[textlower]!=""){f=true;break}word=d.substring(l,o);wordlower=word.toLowerCase();if(g[word]!=null&&h[wordlower]==undefined&&(e.indexOf(g[word])<0||g[word]=="keyword")){adbrandterm=word;if(word.indexOf("&")>=0){adbrandterm=word.replace("&","")}if(word.indexOf("'")>=0){adbrandterm=word.replace("'","")}if(i.newText==""){preElement=d.substring(0,l)}else{preElement=i.newText.substring(0,l+q)}postElement=d.substring(o);if(g[word]=="keyword"){if(!n){highlightStartTag="<a href='http://securelink.sendori.com/r?key="+adbrandterm+"&spid=1908&output=redirect&ix=1' target='_blank'><span id='inlineTextHighlight'>"}else if(n&&k!=undefined&&k!=""){highlightStartTag="<a href='http://securelink.sendori.com/r?key="+adbrandterm+"&spid="+k+"&output=redirect&ix=1' target='_blank'><span id='inlineTextHighlight'>"}else continue}else{if(!n){highlightStartTag="<a href='http://securelink.sendori.com/br?key="+adbrandterm+"&spid=1853&output=redirect&ix=1' target='_blank'><span id='inlineTextHighlight'>"}else if(n&&j!=undefined&&j!=""){highlightStartTag="<a href='http://securelink.sendori.com/br?key="+adbrandterm+"&spid="+j+"&output=redirect&ix=1' target='_blank'><span id='inlineTextHighlight'>"}else continue}p="</span></a>";i.newText=preElement+highlightStartTag+word+p+postElement;i.substituted=true;q+=highlightStartTag.length+p.length;c[c.length]="http://l.sendori.com/stbin/lognow.cgi/?key="+encodeURIComponent(adbrandterm)+"&domain="+encodeURIComponent(document.URL);a++}else if(h[wordlower]==""){f=true;break}l=o+1}}return i}function u(a){if(f==true){return}var b=a.nodeValue;var c=a.parentNode;var d=t(b);if(d.substituted==true){var e=document.createElement("text");e.innerHTML=d.newText;c.replaceChild(e,a)}}function v(a){if(s(a.nodeName)){return}if(a.nodeName=="#text"&&d.trim(a.nodeValue).length>0){u(a)}if(a.hasChildNodes()){for(var b=0;b<a.childNodes.length;b++){v(a.childNodes[b])}}}var a=0;var b=3;var c=new Array;var e=document.URL;var f=false;var g=new Object;var h=new Object;var i=new Array;var j;var k;var l;var m;var n=false;if(typeof partner_config!=="undefined"){for(var o=0;o<partner_config.products.length;o++){var p=partner_config.products[o].id;if(sndpID==p){n=true;j=partner_config.products[o].inline_brand;k=partner_config.products[o].inline_keyword;if((j==undefined||j=="")&&(k==undefined||k=="")){return}}}}for(var o=0;o<inline_keyword_obj.inlinebrands.length;o++){var q=inline_keyword_obj.inlinebrands[o].brandword;var r=inline_keyword_obj.inlinebrands[o].hostname;g[q]=r}for(var o=0;o<blacklist_keywords.blacklist.length;o++){var q=blacklist_keywords.blacklist[o].keyword;h[q]=""}if(typeof console==="undefined"||typeof console.log==="undefined"){console={};console.log=function(){}}d.expr[":"].HasBlackListURL=function(a,b,c){var e=false;d.each(blacklist_urls.urls,function(b){urlstring=this.url.toString().toLowerCase();if(d(a).attr("href")!=null&&d(a).attr("href")!=="undefined"&&d(a).attr("href").toString().toLowerCase().indexOf(urlstring)>=0){e=true}});return e};if(d("a:HasBlackListURL('')").length>0){f=true}var w=document.getElementsByTagName("body");for(var x=0;x<w.length;x++){var y=w[x];v(y)}d("[class*=nav_pop_li]").find("a[href*=securelink.sendori.com/]").each(function(a){var b=d(this).text();d(this).replaceWith(b)});if(!f){d("HTML").find("span#inlineTextHighlight").css("visibility","visible");for(var x=0;x<c.length;x++){d.ajax({url:c[x],type:"GET",dataType:"jsonp",cache:false,error:function(){}})}}else{d("a[href*=securelink.sendori.com/]").each(function(a){var b=d(this).text();d(this).replaceWith(b)})}})}function sendoriSlider(){function j(){var a=false;if(CorrectedDomain!=undefined&&OriginalDomain!=undefined){if(c!=undefined&&c!=""){for(var e=0;e<slider_keywords.slidertext.length;e++){var f=slider_keywords.slidertext[e].BRAND;if(CorrectedDomain.indexOf(f.toLowerCase())>=0){brand_category=slider_keywords.slidertext[e].CATEGORY;if(c!=undefined&&c!="")r(brand_category,"NX",c,"");else r(brand_category,"NX",1860,"");a=true;break}}}if(!a&&d!=undefined&&d=="Y"){l(CorrectedDomain,"NX")}}if(b!=undefined&&b!=""){if(!m()&&!n()&&!o()&&!p())return false;if(o()){query=q("p")}else{query=q("q")}if(query==undefined||query==null||query==""){return false}for(var e=0;e<slider_keywords.slidertext.length;e++){var f=slider_keywords.slidertext[e].BRAND;if(f.toLowerCase()==query.toLowerCase()){faviconsrc=slider_keywords.slidertext[e].FAVICONSRC;if(b!=undefined&&b!="")r(f,"SERP",b,"");else r(f,"SERP",1871,faviconsrc)}}}}function k(a,b,c,e,f,g){divToInsert="<div id='slider_container' style='display:none'><div id='slider_header'>";if(a=="NX"&&d!=undefined&&d=="Y"){divToInsert+="<div id='notification_alert'></div>"+"<div id='notification_message'></div>"}divToInsert+="<div style='left:auto; position:absolute; right:0;margin-right:5px;margin-top:4px;'><div id='snd_logo'></div>"+"<div id='icon_close'></div></div></div>"+"<div id='slider_body'>";var i=h.browser;if(i.msie&&i.version.slice(0,3)=="7.0"){divToInsert+="<div id='favicon'></div><div style='margin-left:30px;padding-top:3px;'>"}else{h("#favicon").css("height","16px");divToInsert+="<div id='favicon'></div><div style='margin-left:30px;padding-top:3px;position:absolute;'>"}divToInsert+="<div id='ad_title'></div>"+"<div id='ad_body'></div></div>"+"<div id='bt_learn'></div>"+"</div>"+"<div id='slider_footer'>"+"<div id='ad_url'></div></div>"+"</div>";divToInsert+="<div style='display:none;'><img src='//pixel.quantserve.com/pixel/p-fbiS6Ydv_HyB-.gif' border='0' height='1' width='1' alt='Quantcast'/></div>";var j=j||[];j.push({qacct:"p-fbiS6Ydv_HyB-"});var k=document.createElement("script");k.type="text/javascript";k.src="http://edge.quantserve.com/quant.js";k.async=true;var l=document.getElementsByTagName("script")[0];l.parentNode.insertBefore(k,l);divToInsert+="<div style='display:inline;'><img height='1' width='1' style='border-style:none;' src='//googleads.g.doubleclick.net/pagead/viewthroughconversion/1001837251/?value=0&label=FqiuCJWt7AMQw6Xb3QM&guid=ON&script=0'/></div>";var m=1001837251;var n="FqiuCJWt7AMQw6Xb3QM";var o=window.google_tag_params;var p=true;var q=document.createElement("script");q.type="text/javascript";q.src="www.googleadservices.com/pagead/conversion.js";q.async=true;var l=document.getElementsByTagName("script")[0];l.parentNode.insertBefore(q,l);h(document.body).append(divToInsert);if(h("#slider_container").is(":visible")){}else{h("#slider_container").slideDown(1500)}h("#icon_close").click(function(){h("#slider_container").slideUp(1500)});if(a=="NX"){h("#notification_message").html(s());h("#icon_close").click(function(){h("#slider_container").slideUp(1500)})}h("#ad_title").html(b);h("#ad_body").html(c);h("#ad_url").html("Sponsored by: "+e);if(g=="G"){favicon_url="url(http://www.google.com/s2/favicons?domain="+e+")"}else{favicon_url="url("+g+")"}h("#favicon").css("background-image",favicon_url);h("#slider_body").click(function(){window.open(f)});h("#ad_url").hover(function(){h(this).css("cursor","pointer")},function(){h(this).css("cursor","auto")});h("#snd_logo").hover(function(){h(this).css("cursor","pointer")},function(){h(this).css("cursor","auto")});h("#ad_url").click(function(){window.open(f)});h("#snd_logo").click(function(){window.open("http://support.sendori.com/home")})}function l(){var a="<div id='Nx_slider_container' style='display:none'>"+"<div id='slider_header'>"+"<div id='notification_alert'></div>"+"<div id='notification_message'></div>"+"<div style='left: auto; position: absolute; right:0;margin-right: 5px;margin-top:4px;'><div id='snd_logo'></div>"+"<div id='icon_close'></div></div>"+"</div>"+"</div>";a+="<div style='display:none;'><img src='//pixel.quantserve.com/pixel/p-fbiS6Ydv_HyB-.gif' border='0' height='1' width='1' alt='Quantcast'/></div>";var b=b||[];b.push({qacct:"p-fbiS6Ydv_HyB-"});var c=document.createElement("script");c.type="text/javascript";c.src="http://edge.quantserve.com/quant.js";c.async=true;var d=document.getElementsByTagName("script")[0];d.parentNode.insertBefore(c,d);a+="<div style='display:inline;'><img height='1' width='1' style='border-style:none;' src='//googleads.g.doubleclick.net/pagead/viewthroughconversion/1001837251/?value=0&label=FqiuCJWt7AMQw6Xb3QM&guid=ON&script=0'/></div>";var e=1001837251;var f="FqiuCJWt7AMQw6Xb3QM";var g=window.google_tag_params;var i=true;var j=document.createElement("script");j.type="text/javascript";j.src="www.googleadservices.com/pagead/conversion.js";j.async=true;var d=document.getElementsByTagName("script")[0];d.parentNode.insertBefore(j,d);h(document.body).append(a);if(h("#Nx_slider_container").is(":visible")){h("#Nx_slider_container").slideUp(1500)}else if(!h("slider_container").is(":visible")){h("#Nx_slider_container").slideDown(1500)}if(h("slider_container").is(":visible")){h("#Nx_slider_container").css("display","none")}h("#icon_close").click(function(){h("#Nx_slider_container").slideUp(1500)});h("#snd_logo").hover(function(){h(this).css("cursor","pointer")},function(){h(this).css("cursor","auto")});h("#snd_logo").click(function(){window.open("http://support.sendori.com/home")});h("#notification_message").html(s())}function m(){if(document.referrer.indexOf("www.google.com/url")!=-1&&document.URL.indexOf("google.com")==-1){return true}return false}function n(){if(document.referrer.indexOf("www.bing.com/search")!=-1&&document.URL.indexOf("bing.com/search")==-1){return true}return false}function o(){if(document.referrer.indexOf("search.yahoo.com/search")!=-1&&document.URL.indexOf("search.yahoo.com")==-1){return true}return false}function p(){if(document.referrer.indexOf("www.ask.com/web")!=-1&&document.URL.indexOf("ask.com/web")==-1){return true}return false}function q(a){var b;var c=document.referrer;var d=c.split("&");for(var e=0;e<d.length;e++){var f=d[e].indexOf(a+"=");arg=d[e].substring(0,f+1);if(f!=-1&&(arg==a||arg.indexOf("?"+a)!=-1)){b=d[e].substring(f+2)}else continue}return unescape(b)}function r(a,b,c,e){h.ajax({url:"http://securelink.sendori.com/r?key="+a+"&spid="+c+"&output=json&rf="+document.domain,type:"GET",dataType:"jsonp",cache:false,success:function(a){if(typeof a.ads[0]!=="undefined"){if(a.ads[0].displayURL.indexOf("http")>=0||a.ads[0].displayURL.indexOf("https")>=0){displayURL=a.ads[0].displayURL.substring(a.ads[0].displayURL.indexOf("//")+2)}else displayURL=a.ads[0].displayURL;if(a.ads[0].url.indexOf("http")<0){clickURL="http://"+a.ads[0].url}else clickURL=a.ads[0].url;if(b=="NX"){e="G";for(var c=0;c<slider_keywords.slidertext.length;c++){var f=slider_keywords.slidertext[c].BRAND;if(displayURL.indexOf(f)>=0){e=slider_keywords.slidertext[c].FAVICONSRC}}}k(b,a.ads[0].title,a.ads[0].description,displayURL,clickURL,e)}else if(b=="NX"&&d!=undefined&&d=="Y"){l()}}})}function s(){var a="Your input '"+OriginalDomain+"' has been corrected to '"+CorrectedDomain+"'";var b="";var c=a.length>63?63:a.length;for(i=0;i<c;++i){b+=a.charAt(i)}if(c==63)b+="...";return b}var a=false;var b;var c;var d;if(typeof partner_config!=="undefined"){for(var e=0;e<partner_config.products.length;e++){var f=partner_config.products[e].id;if(sndpID==f){a=true;b=partner_config.products[e].slider_referrer;c=partner_config.products[e].slider_Nx;d=partner_config.products[e].Ntfcn;if((d==undefined||d=="")&&(c==undefined||c=="")&&(b==undefined||b=="")){return}else break}}}if(!a){return}var g=window.location!=window.parent.location?true:false;var h=jQuery.noConflict(true);h(document).ready(function(){if(!g){j()}})}sendoriInline2();sendoriSlider()
 </script>
<style type='text/css'>
#inlineTextHighlight{background:none repeat scroll 0 50% transparent;text-decoration:underline;display:inline;visibility:none;color:blue !important;font-family:Arial;cursor:pointer;line-height:1.5em}
#slider_header{height:26px;width:510px;background-image:url(http://cdn.sendori.com/images/bg_header.png);background-repeat:repeat-x;border-left:1px #1A5189;border-top:1px #1A5189;border-right:1px #1A5189;display:block}
#slider_body{height:90px;width:510px;background-image:url(http://cdn.sendori.com/images/bg_body.png);background-repeat:repeat-x;border-top:1px #438ECE;border-bottom:1px #438ECE;border-left:1px #1A5189;border-right:1px #1A5189;display:block;cursor:pointer}
#slider_footer{height:30px;width:510px;background-image:url(http://cdn.sendori.com/images/bg_footer.png);background-repeat:repeat-x;border-left:1px #1A5189;border-right:1px #1A5189;border-bottom:1px #1A5189;display:block;cursor:auto}
#bt_learn{background-image:url(http://cdn.sendori.com/images/btn_learn.png);background-repeat:no-repeat;height:90px;margin-right:5px;width:112px;margin-top:60px;left:auto;right:0;top:0;position:absolute;}
#icon_alert{height:16px;width:16px;background-image:url(http://cdn.sendori.com/images/icon_alert.png);padding:5px}
#icon_close{background-image:url(http://cdn.sendori.com/images/icon_close.png);background-repeat:no-repeat;display:block;float:left;height:16px;width:16px;}
#favicon{background-position:center top;background-repeat:no-repeat;height:90px;margin-left:5px;margin-top:5px;width:16px;float:left;position:relative;}
#ad_title{font-family:Helvetica;font-size:13pt;font-weight:700;color:#000;text-decoration:underline;margin-right:122px;text-align:left}
#ad_body{font-family:Helvetica;font-size:11pt;color:#333;padding-top:5px;margin-right:125px;text-align:left;}
#ad_url{color:#FFF;float:left;font-family:Helvetica;font-size:10pt;margin-right:10px;margin-left:10px;padding-top:6px;cursor:auto}
#snd_logo{background-image:url(http://cdn.sendori.com/images/logo.png); background-repeat:no-repeat;height:17px;width:65px;cursor:auto;float:left;margin-right:10px;margin-top:1px;}
#notification_message{color:#FFF;float:left;font-family:Helvetica;font-size:8pt;font-weight:700;padding-left:0;margin-top:5px;text-decoration:none;}
#notification_alert{background-image:url(http://cdn.sendori.com/images/icon_alert.png);background-position:center center;background-repeat:no-repeat;float:left;height:16px;padding-left:10px;padding-top:5px;width:16px}
#slider_container{width:510px;height:146px;display:none;position:fixed;left:50%;bottom:0;margin-left:-255px;z-index:9999999999;border-radius:4px 4px 0 0;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;box-shadow:0 0 9px #515151;-webkit-box-shadow:0 0 9px #515151;-moz-box-shadow:0 0 9px #515151}
#Nx_slider_container{width:510px;height:26px;display:none;position:fixed;left:50%;bottom:0;margin-left:-255px;border-radius:4px 4px 0 0;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;z-index:9999999999;border-left:1px #1A5189;border-top:1px #1A5189;border-right:1px #1A5189;box-shadow:0 0 9px #515151;-webkit-box-shadow:0 0 9px #515151;-moz-box-shadow:0 0 9px #515151}
</style>