package org.ncibi.resource.util;

import java.io.File;
import java.io.IOException;
//import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class LogFileCheck {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		LogFileCheck lc = new LogFileCheck();
		lc.runtask();

	}
	
	public void runtask () throws IOException
	{
		String logPath = "/usr/share/ncibi/logs/";
		String chipPath = "/usr/share/chipFileStore/Variable";
		executorFileCheck(logPath);
		chipFileStoreCheck(chipPath);
		//checkLogFile(chipPath)
		
	}
	
  public long getSize(String filePath)
	{
		long size =0;
		File dir = new File(filePath);	
		for (File file : dir.listFiles()) {
	        if (file.isFile()) {
	            System.out.println(file.getName() + " " + file.length());
	            size += file.length();
	        	}   
		}
	return size;
	}
	
	public long getFileSize(File folder) {
		int totalFolder=0;
		int totalFile=0;
		totalFolder++; 
		System.out.println("Folder: " + folder.getName());
		long foldersize = 0;
    	 File[] filelist = folder.listFiles();
		 // DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");		  
		 // Calendar cal = Calendar.getInstance();
		  //System.out.println("Current SYstem time "+dateFormat.format(cal.getTime()));
		  for (int i = 0; i < filelist.length; i++) {
		  if (filelist[i].isDirectory()) {
			
			  //System.out.println("For"+ filelist[i]+" data modified is : "+dateFormat.format(new Date(filelist[i].lastModified())));
		  foldersize += getFileSize(filelist[i]);
		  } else {
		  totalFile++;
		  foldersize += filelist[i].length();
		  }
		  }
		  return foldersize;
		  }
	
	public String sendNotification (long size)
	{
		String status = "ok";
		//94235441 10737418240L-10gb
		if(size > 84235441 )
		{
		System.out.println("alert");
		JavaMailer mail = new JavaMailer();
		String emailMessage = "Hello,\nYour file is increased above 10gb please delete data.";
		//mail.sendMail("inspiresnehal@gmail.com", "snehal@umich.edu", "Warning for File Size", emailMessage);
		//mail.sendMail("chipenrich@umich.edu", "chipenrich-requests@umich.edu", "Warning for File Size", emailMessage);
		
		status = "error";	
		
		}
		System.out.println(status);
		return status;
	}
	
	protected Date folderCreatedDate(String folderName) {  
        long date = 0;  
        File fl = new File(folderName);  
        if (fl.isDirectory())  
          if (fl.exists())  
             date = fl.lastModified();  
        return new Date(date);  
 }  
	
	public void executorFileCheck(String FilePath)
	{
		long fileSizeByte=getFileSize(new File(FilePath));
		//long size = getSize(logPath);
		System.out.println("Size:   "+fileSizeByte);
		String status= sendNotification(fileSizeByte);
		if(status.equals("error"))
		{
			System.out.println("Inside error loop");
			File dir = new File(FilePath);	
			File[] filelist = dir.listFiles();
			for(int i= 0;i < filelist.length;i++)
			{
				filelist[i].delete();
			}
			
		}
		
		
	}
	
	
	public void chipFileStoreCheck(String Filepath) throws IOException
	{
		
		long fileSizeByte=getFileSize(new File(Filepath));
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	
		//Current system date
		Date date2 = new Date();
		dateFormat.format(date2);
		System.out.println("current date is"+ date2.getTime()+ "in format"+dateFormat.format(date2));
		
		
		System.out.println(fileSizeByte);
		if (fileSizeByte > 6948144482L)
		{		
			File dir = new File(Filepath);	
		    File[] filelist = dir.listFiles();
			
				 for(int i= 0;i < filelist.length;i++)
					{
						Date folderD = new Date(filelist[i].lastModified());
						long diff =date2.getTime() - folderD.getTime();
						final int day = 1000 * 60 * 60 * 24;
						
						long d = diff / day;
				        diff %= day;
				        System.out.println(filelist[i].getName()+"=="+d);
				        if(d>30)
				        {
				        	System.out.println("inised delete loop with "+ filelist[i]);
				        	delete(filelist[i]);
				        }
						
					}
			 }
			
	
		
		
	}
	
	  public static void delete(File file)
		    	throws IOException{
		 
		    	if(file.isDirectory()){
		 
		    		//directory is empty, then delete it
		    		if(file.list().length==0){
		 
		    		   file.delete();
		    		   System.out.println("Directory is deleted : " 
		                                                 + file.getAbsolutePath());
		 
		    		}else{
		 
		    		   //list all the directory contents
		        	   String files[] = file.list();
		 
		        	   for (String temp : files) {
		        	      //construct the file structure
		        	      File fileDelete = new File(file, temp);
		 
		        	      //recursive delete
		        	     delete(fileDelete);
		        	   }
		 
		        	   //check the directory again, if empty then delete it
		        	   if(file.list().length==0){
		           	     file.delete();
		        	     System.out.println("Directory is deleted : " 
		                                                  + file.getAbsolutePath());
		        	   }
		    		}
		 
		    	}else{
		    		//if file, then delete it
		    		file.delete();
		    		System.out.println("File is deleted : " + file.getAbsolutePath());
		    	}
		    }
	
	
}
