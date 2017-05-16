package org.ncibi.resource.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ResourceBundle;

public class CheckOutputName {

	
	public static void main(String[] args) {
		CheckOutputName cho = new CheckOutputName();
		//System.out.println("******************"+cho.check(null));

	}
	
	public String check(String checkName)
	{
		String chk = "";
		int count = 1;
		ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
		String filePath = url.getString("uploadDirectory");
		File folder = new File(filePath);
		FileWriter fstream;
		File[] listOfFiles = folder.listFiles();  
		for (int i = 0; i < listOfFiles.length; i++) 
		 {
			
		   String names = listOfFiles[i].getName();
		    
		    if(names.startsWith(checkName)||names.equals(checkName))
		    {
		    	//System.out.println(names);
		     count++;  
		    }
		  			    
		 }
		
		if (count != 1)
		{
			checkName= checkName+"_"+count;
		}
		return checkName; 
	}
	
	 

}
