<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*,java.text.*,java.math.*,org.ncibi.lrpath.*,org.ncibi.resource.util.*" %>
<%
//******************************************************************************************************************************************
// Variable Declaration

//String database = request.getParameter("db");
//String directionField = request.getParameter("r");

String db = "";
String outFileNum = "";
String database = "external";
String directionField = "";


NumberFormat formatter = new DecimalFormat();
formatter = new DecimalFormat("0.####E0");
			
		
//******************************************************************************************************************************************				
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>LRpath - Pathway Analysis using Logistic Regression</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css">
		<script type="text/javascript" src="../js/validation.js"></script>
		<script type="text/javascript" src="../js/jquery.js"></script>
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
					<img alt="LRpath" src="images/chipLogo.jpg">
					<br />
					<br />
					<span class="logoTitle">Pathway Analysis using Logistic Regression</span>
					<hr>
				</div>
				
<!--  TOOLBAR PANEL ----------------------------------------------------------------------------------------------------------------------->			
				
				<div id="toolbarPanel">
				 <span class="textMediumBold">Top 100 LRpath results sorted by p-value</span><br/>
				 <a href="javascript:mypopwin();"> How do I interpret these results?</a> | Download all results :
				 <a href="download<%= outFileNum %>.txt">Text</a> or <a href="download.jsp?db=<%= db %>&r=<%= directionField %>&g=<%= outFileNum %>">Excel</a>
				</div>
				
				
<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
				
				<div id="contentPanel">
					<table id="result" border="1">
					 <thead>
						<tr class="tableHeader">
							<td>Name</td>
							<td>ConceptType</td>
							<td>#Genes</td>
							<td>Coeff</td>
							<td>OddsRatio</td>
							<td>P-Value</td>
							<td>FDR</td>
							<td><%= directionField %></td>
							<td>SigGenes</td>
						</tr>
					</thead>
				<%
				try
				{
					String fileInput = ResourceUtil.getResultsDirectoryUrl() + "download.txt";
					BufferedReader input = new BufferedReader(new FileReader(fileInput));
					try
					{
						String line = null;
						int count = 0;
				
						while ((line = input.readLine()) != null)
						{
							if(count != 0 && count < 100)
							{
								String[] token = line.split("\t");
								%>
								   <tbody><tr>
								<%	
								for (int i = 0; i < token.length; i++)
								{
									if(i == 0){}
									else if(i == 1 && database.equals("external"))
									{
									%>
										<td><a href="http://conceptgen.ncibi.org/core/conceptGen/explorer.jsp?conceptid=<%= token[0] %>&queryType=concept&owner=Public"><%= token[i] %></a></td>
									<%	
									}
									else if(i == 4 || i == 5 || i == 6 || i == 7)
									{
									%>
										<td><%= formatter.format(Double.parseDouble(token[i])) %></td>
									<%
									}
									else
									{	
									%>
										<td><%= token[i] %></td>
									<%
									}
								}
								%>					
									 </tr></tbody> 
								<%
							}
							count++;
						}
					}
					finally
					{
						input.close();
						out.close();
					}
				}
				catch (IOException ex)
				{
					ex.printStackTrace();
				} %>
					</table>
					<br/><br />
				</div>
			</div>
		</center>
 	</body>
</html>	
