package org.ncibi.resource.util;


import java.util.ArrayList;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class CreateZip{

public static void main(String[] args)  throws Exception  {
	CreateZip cz = new CreateZip ();
	cz.createZip("/usr/share/chipFileStore/Variable/mar8test1_2/", "mar8test1_2");
	

}
public void createZip(String folderPath, String outname){
	
	File folder = new File(folderPath);	
	File[] listOfFiles = folder.listFiles();
	String folName = outname+ ".zip";
	String zipFol = folderPath+folName;
	
	boolean check = false;
		ArrayList<String> files = new ArrayList<String>();
		
		for ( int i=0 ;i<listOfFiles.length;i++ ) {
			
			if(listOfFiles[i].getName().equals(folName))
			{
				
				check = true;
			}
			else{
				if(listOfFiles[i].isFile())
				{
				files.add(listOfFiles[i].getAbsolutePath());
				}
			}	
		}
		
		if(!check)
		{
		try
		{
             String zipFile = zipFol;
             //create byte buffer
             byte[] buffer = new byte[1024];
             FileOutputStream fout = new FileOutputStream(zipFile);
             ZipOutputStream zout = new ZipOutputStream(fout);
	          for(int i=0; i < files.size(); i++)
	          {
	        	  	
	                //create object of FileInputStream for source file
	                FileInputStream fin = new FileInputStream(files.get(i));
	                zout.putNextEntry(new ZipEntry(listOfFiles[i].getName()));
	                int length;
	                while((length = fin.read(buffer)) > 0)
	                {
	                   zout.write(buffer, 0, length);
	                }
	                 zout.closeEntry();
	                 fin.close();
	                 }
	                  //close the ZipOutputStream
	                  zout.close();
	                  System.out.println("Zip file has been created!");
		           
		            }
		            catch(IOException ioe)
		            {
		                    System.out.println("IOException :" + ioe);
		            }
	
	}
	else{
	System.out.println("skipped");
	}
}
}
    
