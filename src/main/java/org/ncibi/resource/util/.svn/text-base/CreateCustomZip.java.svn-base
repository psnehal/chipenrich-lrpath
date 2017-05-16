package org.ncibi.resource.util;


import java.util.ArrayList;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class CreateCustomZip{

public static void main(String[] args)  throws Exception  {
	CreateCustomZip cz = new CreateCustomZip ();
	cz.createZip("/usr/share/chipFileStore/Constant/SummaryReport/Data/K562/", "K562_NG_fet_NO_results");
	

}
public void createZip(String folderPath, String outname) throws IOException{
	
	File folder = new File(folderPath);	
	File[] listOfFiles = folder.listFiles();
	String folName = outname+ ".zip";
	String zipFol = "/usr/share/chipFileStore/Constant/SummaryReport/Data/"+folName;
	
	boolean check = false;
		ArrayList<String> files = new ArrayList<String>();
		String zipFile = zipFol;
        //create byte buffer
        byte[] buffer = new byte[1024];
        FileOutputStream fout = new FileOutputStream(zipFile);
        ZipOutputStream zout = new ZipOutputStream(fout);
		
		for ( int i=0 ;i<listOfFiles.length;i++ ) {
			
			if(listOfFiles[i].getName().equals(folName))
			{
				
				check = true;
			} 
			else{
				if(listOfFiles[i].isFile())
				{
					//nearest-tss_chipenrich_GOBP-GOCC-GOMF_mappa-36_peaks.tab
					//nearest-tss_chipenrich_GOBP-GOCC-GOMF_no-mappa_qcplots.pdf
					if(listOfFiles[i].getName().contains("nearest-gene_fet_GOBP-GOCC-GOMF_no-mappa_09-11-2013_results.tab"))
					{
						//System.out.println(listOfFiles[i].getName());
						files.add(listOfFiles[i].getAbsolutePath());
						
						try
						{
							FileInputStream fin = new FileInputStream(listOfFiles[i].getAbsolutePath());
					         zout.putNextEntry(new ZipEntry(listOfFiles[i].getName()));
					                int length;
				                while((length = fin.read(buffer)) > 0)
				                {
				                   zout.write(buffer, 0, length);
				                }
				                 zout.closeEntry();
				                 fin.close();  
					                  //close the ZipOutputStream
					                  
					                 
						           
						            }
						            catch(IOException ioe)
						            {
						                    System.out.println("IOException :" + ioe);
						            }
					}
				}
				
				
			}	
		}
		 System.out.println("Zip file has been created!");
		zout.close();
		
		
		if(!check)
		{
		
	
	}
	else{
	System.out.println("skipped");
	}
}
}
    
