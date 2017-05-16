
<%@ page language="java" import="javazoom.upload.*,java.io.*,java.util.*,java.text.*,java.math.*,org.ncibi.chipenrich.*,org.ncibi.resource.util.*" %>
<jsp:useBean id="optionBean" scope="session" class="org.ncibi.chipenrich.ChipEnrichInputArguments" />
<jsp:useBean id="upBean" scope="session" class="javazoom.upload.UploadBean" />

<%
	//Parameters:
	
String dirPath2= "";
String dirPathUpload = "";
String dirPathMappa = "";
String range = "novalue";

//******************************************************************************************************************************************
ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
upBean.setFolderstore(url.getString("uploadDirectory"));
String filePath = url.getString("uploadDirectory");
System.out.println(filePath);
//******************************************************************************************************************************************
//String filePath = "/home/snehal/workspace2/LRPathBranch/FileStore";

if (MultipartFormDataRequest.isMultipartFormData(request))
{
	System.out.println("1");
	MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
	String todo = null;
	String sgInput = null;
	String nameCheck = "chip";
	String dirName = "";
	
	sgInput = mrequest.getParameter("sglist");
	String[] slist = mrequest.getParameterValues("slist");
	int count = 0;
	System.out.println("From SetName");
	for(int i =0; i< slist.length; i++)
	{
		System.out.println(slist[i]);
	}
	
//******Setting parameters to InputArguments************************************************************************************************************************************	
	
	optionBean.setEmail(mrequest.getParameter("email"));
	optionBean.setSgList(sgInput);
	optionBean.setSgSetList(slist);
	optionBean.setMethod(mrequest.getParameter("method"));
	optionBean.setLd(mrequest.getParameter("ld"));
	optionBean.setIsMappable(mrequest.getParameter("ismappable"));
	
	optionBean.setQc(mrequest.getParameter("qc"));
	
	//Written as range.isEmpty or range.length doent work.
	
	range = mrequest.getParameter("rc");
	optionBean.setRc(range);
	System.out.println(range);
//******Check For Outname************************************************************************************************************************************	

	nameCheck = mrequest.getParameter("outname");
	if (nameCheck.isEmpty())
	{
		nameCheck = "chipenrich";
		System.out.println("*************************"+nameCheck);
	
	}
	System.out.println("*************************"+nameCheck);
	CheckOutputName chk = new CheckOutputName();
	dirName = chk.check(nameCheck);
    optionBean.setOutName(dirName);
        
//******Outpath Setting************************************************************************************************************************************	
	
	String dirPath = filePath+dirName+"/";
	System.out.println("dirPath is" + "[" + dirPath +" ]"); 
	optionBean.setOutPath(dirPath);
	

//******To create new directory in the filestore ************************************************************************************************************************************	

	File f = new File(dirPath);
	f.mkdir();
	f.setWritable(true);

	String folderStore = dirPath;
    upBean.setFolderstore(folderStore);
	upBean.setOverwrite(true);//If file has error and user is asked pload again.Then it should be able to save same name modified file.
	
	
	
    if (mrequest != null) todo = mrequest.getParameter("todo");
    
	if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	{
		//out.println("3");
		Hashtable files = mrequest.getFiles();
        if ( (files != null) && (!files.isEmpty()) )
        {
        	//to create path for file
        	UploadFile file = (UploadFile) files.get("uploadfile"); 
      		filePath += file.getFileName() ;
        	//Create path for uploaded file		
      		dirPathUpload = dirPath +file.getFileName() ;
        	System.out.println("Second dirpath is"+ dirPathUpload);
        	optionBean.setUploadFile(dirPathUpload);
        	upBean.store(mrequest, "uploadfile");
        	//Create path for mappa file
        	
        	//*************Check for RC******************************************************************************************************************************************************
	
        System.out.println("For Null");
		String token = "null";
		optionBean.setUploadMappaFile(null);
		
	
		System.out.println(range);
		if(range != null)
		{
	System.out.println("yeah i am null");
	if(range.equals("user"))
	{
	UploadFile mappa = (UploadFile) files.get("mappaFile"); 
		  	dirPathMappa= dirPath+mappa.getFileName() ;
		        	System.out.println("File path is  [ "+dirPathMappa+ " ] " );
		        	optionBean.setUploadMappaFile(dirPathMappa);
		        	upBean.store(mrequest, "mappaFile");
	}
		}
        	
		System.out.println("After user check");
        	
           
            //Test for input file
          //  rangeCheck rc=new rangeCheck();
            org.ncibi.chipenrich.FileParser fc = new org.ncibi.chipenrich.FileParser();
            System.out.println("below file parser"+sgInput);
            File file2 = new File(dirPathUpload);
            ArrayList <String> warnings = new ArrayList<String>();
          
            warnings=fc.fParser(file2 , sgInput);
            System.out.println("below warning with warnings"+ warnings.size());
            
            //Test for mappa file
            
             
            
            if(!(warnings.size()==0) )
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
								    		for(int i=0;i<warnings.size();i++)
								    		{
								    			%>
								    				<li><span class="textTitle"><%= warnings.get(i) %></span></li>
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


