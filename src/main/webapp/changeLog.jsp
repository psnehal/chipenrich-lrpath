<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="css/style1.css">
<head>
<title>ChangeLog</title>
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
    
<table id="result">
	<thead>
			<tr class="tableHeader">	
				<td> Date </td>
				<td> Changes 
		  </tr>
	 </thead>
	<tr>
	  <td> August 29,2013 </td>
	  <td> Removed ChIP-Enrich results for the 1kb and 5kb locus definitions.  <br/>(Please do not use the original results. We will be uploading new 1kb and 5kb results soon.)
	</td></tr>
	<tr>
	<td> September 18,2013 </td>
	<td> Added 1 kb abd 5 Kb locus definition for GM12878<br/>Added K562 results on the webpage </td></tr>
	
</table>  
<br/> <br/><br/> <br/>
</div>

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
