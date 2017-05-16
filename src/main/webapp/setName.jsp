
<%@ page language="java" import="javazoom.upload.*,java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.chipenrich.*,org.ncibi.resource.util.*" %>
<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />
<jsp:useBean id="upBean" scope="session" class="javazoom.upload.UploadBean" />

<%
	//Parameters:
	
String dirPath2= "";
String dirPathUpload = "";
String dirPathCustom="";
String dirPathMappa = "";
String dirPathLd = "";
String range = "novalue";
CheckFileFormat cff = new CheckFileFormat();
//******************************************************************************************************************************************
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
upBean.setFolderstore(url.getString("uploadDirectory"));
String filePath = url.getString("uploadDirectory");
//System.out.println(filePath);
//******************************************************************************************************************************************
//String filePath = "/home/snehal/workspace2/LRPathBranch/FileStore";

if (MultipartFormDataRequest.isMultipartFormData(request))
{
	//System.out.println("1");
	MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
	String todo = null;
	String sgInput = null;
	String nameCheck = "chip";
	String dirName = "";
	
	sgInput = mrequest.getParameter("sglist");
	
	
//******Setting parameters to InputArguments************************************************************************************************************************************	
	
	optionBean.setEmail(mrequest.getParameter("email"));
	optionBean.setSgList(sgInput);	
	optionBean.setMethod(mrequest.getParameter("method"));
	optionBean.setIsMappable(mrequest.getParameter("ismappable"));
	optionBean.setFilter(mrequest.getParameter("filter"));
	optionBean.setPeakThr(mrequest.getParameter("peakthr"));
	optionBean.setQc("T");
	
//Written as range.isEmpty or range.length doent work.***************************************************************************************************************************	
	range = mrequest.getParameter("rc");
	optionBean.setRc(range);
	System.out.println("Range option is" +range);
	
//******Check For Outname************************************************************************************************************************************	

	nameCheck = mrequest.getParameter("outname").replaceAll("\\s+","_");
out.println(nameCheck);
	if (nameCheck.isEmpty())
	{
		nameCheck = "chipenrich";
		System.out.println("Outnamne is null so name is given"+nameCheck);
	
	}
	
	CheckOutputName chk = new CheckOutputName();
	dirName = chk.check(nameCheck);
    optionBean.setOutName(dirName);
    
        
//******Outpath Setting for bed file************************************************************************************************************************************	
	
	String dirPath = filePath+dirName+"/";
	System.out.println("dirPath is" + "[" + dirPath +" ]"); 
	optionBean.setOutPath(dirPath);
	File f = new File(dirPath);
	f.mkdir();
	f.setWritable(true);
	String folderStore = dirPath;
    upBean.setFolderstore(folderStore);
	upBean.setOverwrite(true);//If file has error and user is asked pload again.Then it should be able to save same name modified file.

//******To create new directory in the filestore ************************************************************************************************************************************	
    
	if (mrequest != null) todo = mrequest.getParameter("todo");
    
	if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	{
		System.out.println("3");
		Hashtable files = mrequest.getFiles();
        if ( (files != null) && (!files.isEmpty()) )
        {
        	//to create path for file
        	UploadFile file = (UploadFile) files.get("uploadfile"); 
      		String fileName = file.getFileName() ;
      		
        	//Create path for uploaded file		
        	String ext = fileName.substring(file.getFileName().lastIndexOf('.') + 1);
          	dirPathUpload = dirPath +fileName;
        	//System.out.println(ext);
        	System.out.println("Original File Name"+dirPathUpload);           	
        	upBean.store(mrequest, "uploadfile");   
        	//This is to check the file format
        	String fileUploadName = cff.correctFileFormat(dirPathUpload);
        	System.out.println("Finalname of the file"+ fileUploadName);
        	optionBean.setUploadFile(fileUploadName);
        	
        	
        	UploadFile custom = (UploadFile) files.get("uploadcustomfile"); 
        	System.out.println("File path is for custom file   [ "+  custom );
        	dirPathCustom= dirPath +custom.getFileName() ;
		  	System.out.println("File path is for custom file   [ "+dirPathCustom+ " ] " );
        	optionBean.setUploadCustomFile(dirPathCustom);
        	upBean.store(mrequest, "uploadcustomfile");
        	
        	
        	
        	
//Create path for mappa file
        	
//*************Check for MappaFile******************************************************************************************************************************************************
	
        System.out.println("For Null");
		String token = "null";
		optionBean.setUploadMappaFile(null);
		ArrayList <String> warningsFrMappa = new ArrayList<String>();
		ArrayList <String> warnings = new ArrayList<String>();
        ArrayList <String> warningsAll = new ArrayList<String>();
	
		System.out.println(range);
		if(range != null)
		{
			System.out.println("yeah i am null");
			if(range.equals("user"))
			{
			org.ncibi.chipenrich.MappaFileParser mappa2 =  new org.ncibi.chipenrich.MappaFileParser();
			UploadFile mappa = (UploadFile) files.get("mappaFile"); 
				  	dirPathMappa= dirPath+mappa.getFileName() ;
				  	File fileM = new File(dirPathMappa);
		        	System.out.println("File path is for mappa file   [ "+dirPathMappa+ " ] " );
		        	optionBean.setUploadMappaFile(dirPathMappa);
		        	upBean.store(mrequest, "mappaFile");
		        	warningsFrMappa= mappa2.fmParser(fileM);
		        	warningsAll.addAll(warningsFrMappa);
		            System.out.println("beliw warning with warningFor Mappa files"+ warningsFrMappa.size());
          	}
		}
        	
		System.out.println("After user check");
		
		String [] slist = mrequest.getParameterValues("slist");
		
		for(int i =0; i< slist.length; i++)
		{
			
			if(slist[i].equals("custom"))
			{
				
			  			
			  			
				slist[i]= dirPathCustom;
					
			}
			
			
		}
		String[] slistNew = null;
		int count = 0;
		//******Setting parameters for Slist************************************************************************************************************************************	
		//[GO, GOBP, GOCC, GOMF]
				boolean check = false;
		for(int i =0; i< slist.length; i++)
		{
			if(slist[i].equals("GO"))
			{
				
				check = true;
			}
			
		}
		
		if(check)
		{
			List<String> result = new ArrayList<String>();

		    for(String item : slist)
		    {
		        if(!"GO".equals(item))
		        {
		            result.add(item);
		        }
		    }
		    slistNew =result.toArray(new String[result.size()]);
			System.out.println(slistNew.length);
			
			optionBean.setSgSetList(slistNew);
		}
		else
		{
			optionBean.setSgSetList(slist);
		}
		
		for(int j=0;j<slist.length;j++)
		{
			
			System.out.println("Datasase are"+ slist[j]);
		}
        	
		//*************Check for BedFIle******************************************************************************************************************************************************          
            org.ncibi.chipenrich.FileParser fc = new org.ncibi.chipenrich.FileParser();
            System.out.println("below file parser"+sgInput);
            File file2 = new File(dirPathUpload);
           
          
            warnings=fc.fParser(file2 , sgInput);
            System.out.println("below warning with warnings"+ warnings.size());
            
            //Test for mappa file
              if(!(warnings.size()==0))
			{
					warningsAll.add("Warnings from bed file are");
			        warningsAll.addAll(warnings);
			 }
		        
            
       //******Setting parameters for ld************************************************************************************************************************************
          	if(mrequest.getParameter("ld").equals("user"))
          	{
          	
          		UploadFile ldFile = (UploadFile) files.get("ldFile"); 
			  	dirPathLd= dirPath+ldFile.getFileName() ;
			  	File fileM = new File(dirPathLd);
	        	System.out.println("File path is for lD is  [ "+dirPathLd+ " ] " );
	        	optionBean.setLd(dirPathLd);
	        	upBean.store(mrequest, "ldFile");
          		
          	}
          	else
          	{
          		optionBean.setLd(mrequest.getParameter("ld"));
          	}
          			
       //******Display Errors: ************************************************************************************************************************************   		
            if(!(warningsAll.size()==0) )
            {
%>
			  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
			  <html>
				<head>
					<title>ChipEnrich</title>
					<link rel="stylesheet" type="text/css" href="css/style.css">
					<script type="text/javascript" src="js/action.js"></script>
					<script type="text/javascript" src="js/main.js"></script>
				</head>
				<body>
					<center>
						<div id="mainPanel">
				
			       	
		      	<!--  RESULTS PANEL ---------------------------------------------------------------------------------------------------------------------->	
		
								<div id="contentPanel">
								    <center>
								    <table border="0">
								    	<tr>
								    		<td>	 			
								    		<span class="textTitle">Reasons for genes not matching:</span>
								    		<ul>
								    		    		
						    				<% 
								    		for(int i=0;i<warningsAll.size();i++)
								    		{
								    			%>
								    				<li><span class="textTitle"><%= warningsAll.get(i) %></span></li>
								    			<% 
								    		}
								    		%>
				    		 
						    							    		
								    		</ul>
								    		
								    		<br></br>
								    		<input type="button" value="Back" onclick="goBack()">
						                    <input type="button" value="Continue" onclick="continueAnalysis()">
								    		</td>
								    	</tr>
								   </table>
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
            	            	
              <%                	
            //	out.println(warning);
            }//warning null
    	 else
            {
    		//To store upload file on the server
             
            %>
                
                
        		<jsp:forward page="UserData.jsp" />
        	<%
            }
          }//files null
         else
         {
         	System.out.println("<li>No uploaded files");
         }
	}//todo null
//todo null
    else
    { 
    	out.println("<BR> todo="+todo);
	}
}
  %>


