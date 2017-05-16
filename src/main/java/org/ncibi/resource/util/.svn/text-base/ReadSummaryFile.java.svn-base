package org.ncibi.resource.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collections;
import java.util.regex.*;    

import au.com.bytecode.opencsv.CSVWriter;

public class ReadSummaryFile {
	 

	private BufferedReader br;
	private CSVWriter writer;
	private int i;


	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		/*
		String c  ="C:/Users/snehal/Desktop/work/enrichmentRes/src/main/webapp/data/test.tab";
		//System.out.println(c.substring(0, c.length()-4));
		
		//read.readFolderContent("/usr/share/chipFileStore/summaryReport/data/","chipenrich");
		//System.out.println("+++++++++++++++++++"+read.createLink("P300_spp_GM12878.narrowPeaks.gz", "1kb","fet","qcplot","tab"));
		
		//read.parseData("P300_spp_GM12878.narrowPeaks.gz", "1kb","fet","results","tab");
		ArrayList<EnrichReport> peaks = new ArrayList<EnrichReport>();
		String [] locusDef={"1kb","5kb" ,"nearest_tss","nearest_gene"};
		//peaks = read.readSummaryStat("C:/Users/snehal/Desktop/work/Project2/newSummary.txt",locusDef);
		peaks = read.readSummaryStat("/usr/share/chipFileStore/summaryReport/newSummary.txt",locusDef);
		
		//System.out.println(peaks.size());
		//
		*/
		ReadSummaryFile read = new ReadSummaryFile();
		//read.createCsvFile("C:/Users/snehal/Desktop/work/enrichmentRes/src/main/webapp/data/test.tab");
		System.out.println(read.getSize("/usr/share/chipFileStore/Constant/SummaryReport/Data/GM12878"));
	}
	public ArrayList<EnrichReport> sortList(String filename, String [] locusDef){
		ArrayList<EnrichReport> peaks = new ArrayList<EnrichReport>();
		peaks = readSummaryStat(filename,locusDef);

		return peaks;
		
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
	
	
	public ArrayList<EnrichReport> readSummaryStat(String filename, String [] locusDef){
        
        //File fileName= new File("C:/Users/snehal/Desktop/work/Project2/encode_GM12878_summary-stats.tab");
        //System.out.println("2");
        ArrayList<EnrichReport> d = new ArrayList<EnrichReport>();
        FileInputStream fstream;
			try {
	//			System.out.println("3");
				fstream = new FileInputStream(filename);
				DataInputStream in = new DataInputStream(fstream);
				BufferedReader br = new BufferedReader(new InputStreamReader(in));
			   	String strLine;
			   	int i=0;
			   	while ((strLine = br.readLine()) != null)
				{
			   		while ((strLine = br.readLine()) != null)
				          {
			   			   String tokens[] = strLine.split("\t");
				          
			     		 System.out.println(strLine);
			     			    
		        			    /*
		        			    for (int j =0; j<tokens.length;j++)
			        			{
			        				
			        				//System.out.println(tokens[j]);
			        				if(tokens[j]==null)
			        				{
			        					//System.out.println("******************"+strLine+"******************");
			        				}
			        			}*/
		        			    for(int j =0;j<locusDef.length;j++)
		        			    {
		        				System.out.println(locusDef[j]);
		        				
		        				d.add(new EnrichReport(tokens[0],tokens[1],tokens[2],tokens[3],tokens[4],tokens[5],tokens[6],locusDef[j]));
		        				
		        				i++;
		        			    }
				          }
				    	 
				}//outer
				
			 }
             catch (FileNotFoundException e1) {
            		e1.printStackTrace();
            		} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			 }
			 return d;
			
       
        }
    

	/*
	public void parseData(String filename, String ld,String method, String colname,String ext) throws IOException
	{
		String fname = createLink( filename,  ld, method,  colname, ext);
		System.out.println(fname);
		createCsvFile("/home/snehal/workspace2/LRPathBranch/src/main/webapp/data/"+fname);
	}
	
	public void createCsvFile(String filename) throws IOException
	{
			FileInputStream  fstream = new FileInputStream(filename);
			DataInputStream in = new DataInputStream(fstream);
			br = new BufferedReader(new InputStreamReader(in));
			String fname = filename.substring(0, filename.length()-4)+".csv";
			 BufferedWriter out = new BufferedWriter(new FileWriter(fname));
			  writer = new CSVWriter(out);
			  
			  
		   	String strLine;
		   	i = 1;
		   	while ((strLine = br.readLine()) != null)
			{
		   		String labels[] = strLine.split("\t");
		   	    writer.writeNext(labels);
			    	while((strLine = br.readLine()) != null)
				      {
		 			System.out.println("4"+strLine);
			    	String tokens[] = strLine.split("\t");
			    	 writer.writeNext(tokens);
				      }
			    	
			}
		   	
		    out.close();
	}
	*/
	
	public String createLink(String filename, String ld,String method, String colname,String ext)
	{
		String url = null;
		Pattern pat = Pattern.compile(".gz");   
		Matcher mat = pat.matcher(filename);  
		String fname = mat.replaceAll("");
		mat.reset(); 
		url = fname+"_hg19_"+ld+"_"+method+"_GOBP-GOCC-GOMF_nomappa_"+colname+"."+ext;
		return url;
		 
	}
	
	public void readFolderContent(String filepath, String check) throws IOException
	{
		File folder = new File(filepath);
		FileWriter fstream;
		//ArrayList <String> checkFl = readSummaryFile("");
		ArrayList<String> d = new ArrayList<String>();
		File[] listOfFiles = folder.listFiles(); 		 
		for (int i = 0; i < listOfFiles.length; i++) 
		  {
		    String name = listOfFiles[i].getName();
		    if(name.contains(check))
		    		{
		    	d.add(listOfFiles[i].getName());
		    	
		    		}
		  
		     
		    
		  }
		  
		  System.out.println(d.get(0));
				 
	}
	//ATF3_spp_GM12878.narrowPeak_hg19_1kb_fet_GOBP-GOCC-GOMF_nomappa_qcplots
	
	public ArrayList<String> readSummaryFile(String filename)
	{
		 File fileName= new File(filename);
		 ArrayList<String> fileNm = new ArrayList<String>();
         //System.out.println("2");
        // ArrayList<EnrichRes> d = new ArrayList<EnrichRes>();
        
 			try {
 	//			System.out.println("3");
 				FileInputStream fstream = new FileInputStream(fileName);
 				DataInputStream in = new DataInputStream(fstream);
 				BufferedReader br = new BufferedReader(new InputStreamReader(in));
 			   	String strLine;
 			   	int i=0;
 			  	while ((strLine = br.readLine()) != null)
 				{
 			   
			        			    String tokens[] = strLine.split("\t");
			        			    for (int j =0; j<tokens.length;j++)
				        			{
				        				
				        				//System.out.println(tokens[j]);
				        				if(tokens[j]==null)
				        				{
				        					System.out.println("******************"+strLine+"******************");
				        				}
				        			}
			        				String uniqueName = tokens[1]+"_hg19";
			        				fileNm.add(uniqueName);
			        				
 					 
 				    	 
 				}//outer
 				
 			 }
	             catch (FileNotFoundException e1) {
	            		e1.printStackTrace();
	            		} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				 }
		
		
		
		
		return fileNm;
		
		
	}

}
