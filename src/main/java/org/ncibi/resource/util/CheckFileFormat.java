package org.ncibi.resource.util;
import org.mozilla.universalchardet.UniversalDetector;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
//http://code.google.com/p/juniversalchardet/


public class CheckFileFormat {

public static void main(String[] args) {
	CheckFileFormat cff = new CheckFileFormat();
	cff.correctFileFormat("/home/snehal/DataFiles/ChipEnrich/E2A.txt" );
			//"/usr/share/chipFileStore/Variable/checkBadFormat/tal1ery.bed");
	//System.out.println("******************"+cho.check(null));

}

public String correctFileFormat(String filename)
{
	String new_name = "";
	try {
		    // Open the file that is the first
		    // command line parameter
		//"/home/snehal/DataFiles/ChipEnrich/erroredFIles/tal.bed"
		///home/snehal/DataFiles/ChipEnrich/erroredFIles/output.bed
			
		System.out.println("indide correctFileFormat === " + filename);
		    FileInputStream fstream = new FileInputStream(filename);
		    String encoding = detectCharset(filename);
		    
		    if(encoding.contains("UTF-16"))
		    {
		    	
		    	File file = new File(filename);
				System.out.println("Path"+filename.substring(0,file.getPath().lastIndexOf(".")));
				new_name = filename.substring(0,file.getPath().lastIndexOf(".")) + "_mod.bed";
				System.out.println(new_name);
		        DataInputStream in = new DataInputStream(fstream);
			    BufferedReader br = new BufferedReader(new InputStreamReader(in,"UTF-16LE"));
			    String strLine; 
			    
			    while ((strLine = br.readLine()) != null) {
			    	String lineF = strLine+ "\n";
			              writeToFile(lineF,new_name);
			    }			    
			    // Close the input stream
			    in.close();			
			System.out.println("done.");
		    }
		    else{
		    	
		    	new_name = filename;
		    	System.out.println("File Format is :" + encoding );
		    	
		    }
		    
		} catch (Exception e) {// Catch exception if any
		    System.err.println("Error: " + e.getMessage());
		}
	
	System.out.println("File Name is :" + new_name);
	return new_name;
		    	
 }
		 
		    
	
		

		
    public static void writeToFile(String str,String filename) {
		try {
		    OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(filename, true), "UTF-8");
		    BufferedWriter fbw = new BufferedWriter(writer);
		    fbw.write(str);
		    fbw.close();
		} catch (Exception e) {// Catch exception if any
		    System.err.println("Error: " + e.getMessage());
		}
	}		
			
			
	public static String detectCharset(String filename) throws IOException
	{
		byte[] buf = new byte[4096];

		String fileName = filename;
	    java.io.FileInputStream fis = null;
		try {
			fis = new java.io.FileInputStream(fileName);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    // (1)
	    UniversalDetector detector = new UniversalDetector(null);

	    // (2)
	    int nread;
	    while ((nread = fis.read(buf)) > 0 && !detector.isDone()) {
	      detector.handleData(buf, 0, nread);
	    }
	    // (3)
	    detector.dataEnd();

	    // (4)
	    String encoding = detector.getDetectedCharset();
	    if (encoding != null) {
	      System.out.println("Detected encoding = " + encoding);
	    } else {
	    	encoding = "noencoding";
	      System.out.println("No encoding detected.");
	    }

	    // (5)
	    detector.reset();

		
		return encoding;
		
	}
			
			}