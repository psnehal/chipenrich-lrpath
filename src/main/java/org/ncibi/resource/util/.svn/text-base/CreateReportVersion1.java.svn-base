package org.ncibi.resource.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import au.com.bytecode.opencsv.CSVWriter;

public class CreateReportVersion1 {
	
	static ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		
		/*String test = "ZNF274_MACS_narrowPeak_hg19_nearest_tss_fet_GOBP-GOCC-GOMF_mappa-36_qcplots.pdf";
		System.out.println(test.substring(0, test.lastIndexOf("_")));
		String test3 =test.substring(0, test.lastIndexOf("_"));
		String test2 = "ZNF274_MACS_narrowPeak_hg19_nearest_tss_fet_GOBP-GOCC-GOMF_mappa-36_qcplots.pdf";
		System.out.println(test2.replace("fet", "chipenrich"));
		System.out.println(cr.createLink(test3, "peaks.tab")); 
		Collections.sort(peaks,new SortArrayList());
		for (int i =0 ; i < peaks.size(); i++)
		{
			System.out.println(peaks.get(i).getLd() + peaks.get(i).getTf() + peaks.get(i).getPeakno());
		}
		*/
		
		 //System.out.println(getPeakNo("ATF3_SPP_narrowPeak_hg19"));
		 ArrayList<EnrichRes> peaks = new ArrayList<EnrichRes>();
		 CreateReportVersion1 cr = new CreateReportVersion1();
		 peaks = cr.combineObj();
		
	}
	
	
	//Read peak info file to create obj
	
	////peak = readSummaryStat("C:/Users/snehal/Desktop/work/enrichmentRes/peakSummary.txt");
	
	
	public void runCreateReport()
	{
		
		
	}
	
	
	public String createLink(String filename, String ext)
	{
		String url = null;
		url = filename+"_"+ext;
		return url;
		 
	}
public static ArrayList<PeakData> readSummaryStat(String filename){
        
        ArrayList<PeakData> d = new ArrayList<PeakData>();
        FileInputStream fstream;
			try {
	//			System.out.println("3");
				fstream = new FileInputStream(filename);
				DataInputStream in = new DataInputStream(fstream);
				BufferedReader br = new BufferedReader(new InputStreamReader(in));
			   	String strLine;
			   	int i=0;
			   //	while ((strLine = br.readLine()) != null)
				//{
			   		while ((strLine = br.readLine()) != null)
				          {
			   			String tokens[] = strLine.split("\t");
				       // System.out.println(strLine);
		        		d.add(new PeakData(tokens[0],tokens[1]));		        				
		        		   			    
				          }
				    	 
				}//outer
				
			// }
             catch (FileNotFoundException e1) {
            		e1.printStackTrace();
            		} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			 }
			 return d;
			
       
        }

public static String getPeakNo(String check)
{
	ArrayList<PeakData> peak = new ArrayList<PeakData>();
	///usr/share/chipEnrichData/SummaryReport/*.*
	//C:/Users/snehal/Desktop/work/enrichmentRes/peakSummary2.txt
	String filepath = url.getString("summaryDirectory")+"peakSummary.txt";
	peak = readSummaryStat(filepath);
	String peakno = "NA" ;
	for (int i =0 ; i< peak.size(); i++)
	{
		//System.out.println(peak.get(i).getFilepath());
		if(peak.get(i).getFilepath().contains(check))
		{
			//System.out.println("inside contain"+ check);
			
			peakno = peak.get(i).getNum_peaks();
		}
	}
	
	return peakno;
	
}
	
	
	
	
	public ArrayList<EnrichRes> combineObj() throws IOException
	{
		
            String fileP = url.getString("summaryDirectory")+"Data"; 		
			File folder = new File(fileP);
			FileWriter fstream;
			
			ArrayList<EnrichRes> d = new ArrayList<EnrichRes>();
			//FileWriter fstream2;
			//fstream2 = new FileWriter("chipFiles.txt");
			// BufferedWriter out = new BufferedWriter(fstream2);
			
			
			File[] listOfFiles = folder.listFiles(); 		 
			for (int i = 0; i < listOfFiles.length; i++) 
			  {
			    String name = listOfFiles[i].getName();
			   // System.out.println(name);
			    String filename = name.substring(0, name.lastIndexOf("_"));
			    //System.out.println(filename);
			    String [] tokens = name.split("_");
			    //System.out.println(name + "\n"+tokens.length +tokens[4] );
			    String filepath2  = tokens[0];
			    String peakno;
			   
			    
			    if(name.contains("chipenrich")&& name.contains("peaks.tab"))
			    {
			    /*out.write(name + "\n");
			     * 
			    System.out.println(name);
			    ATF3_SPP_narrowPeak_hg19_1kb_chipenrich_GOBP-GOCC-GOMF_mappa-36
			    filename ZNF143_MACS_narrowPeak_hg19_1kb_chipenrich_GOBP-GOCC-GOMF_mappa-36_peaks.tab no
			    0		 1		2		3		4	5			6				7		8			9
			    String filename,String tf, String peak_caller, String broad_narrow, String genome, String ld, String method, String database,
		    	String mappa, String filetype, String peakno)
			    "0 " +tokens[0] +"  1 " + tokens[1]+" 2  "+ tokens[2]+"  3 "+tokens[3]+" 4  "+tokens[4]+"   "+tokens[5]+"   "+tokens[6]+"   "+tokens[7]+"   "+tokens[8]+"   "+ peakV  + "peak caller" + peakV + "\n"
			    */
			    	
					    if(!name.contains("nearest") && !name.contains("rep"))
					    {
					    	if (name.contains("BCL3"))
					    	{
					    		if(tokens[1].startsWith("rep")&& !tokens[4].equals("nearest")  ){
					    	System.out.println("Above all loop" +  tokens[4]+"_"+tokens[1] + "     "+name);
					    		}
					    	}
					    	String check = tokens[0]+"_"+tokens[1]+ "_"+tokens[2]+"_"+tokens[3];
					    	String peakV= getPeakNo(check); 
					    	//out.write(filename  + "check is  " + check + "\n");
					    	d.add(new EnrichRes(filename,tokens[0],tokens[1],tokens[2],tokens[3],tokens[4],tokens[5],tokens[6],tokens[7],tokens[8], peakV));
					    }
					    
					    else 
					    {
					    	
					    	//BCL3_rep1_MACS_broadPeak_hg19_5kb_chipenrich_GOBP-GOCC-GOMF_mappa-36_qcplots
					    	if(name.contains("rep")&& !name.contains("nearest")  ){
					    		System.out.println("only rep loop" +  tokens[0]+"_"+tokens[1]);
					    		String tf = tokens[0]+"_"+tokens[1];
					    		String check = tf+"_"+tokens[2]+ "_"+tokens[3]+"_"+tokens[4];
						    	String peakV= getPeakNo(check); 
						    	System.out.println(peakV +  "check = "+check);
						    	
						    	d.add(new EnrichRes(filename,tf,tokens[2],tokens[3],tokens[4],tokens[5],tokens[6],tokens[7],tokens[8],tokens[9], peakV));
					    		
					    	}
					    	//TCF12_SPP_narrowPeak_hg19_nearest_tss_chipenrich_GOBP-GOCC-GOMF_mappa-36_opts
					    	if(!name.contains("rep")&& name.contains("nearest")   ){
					    		//System.out.println("only nearest loop" +  tokens[4]+"_"+tokens[5]);
					    		String ld = tokens[4]+"_"+tokens[5];
					    		String check = tokens[0]+"_"+tokens[1]+ "_"+tokens[2]+"_"+tokens[3];
						    	String peakV= getPeakNo(check); 
						    	d.add(new EnrichRes(filename,tokens[0],tokens[1],tokens[2],tokens[3],ld,tokens[6],tokens[7],tokens[8],tokens[9],peakV));
					    		
					    	}
					    	
					    	
					    	//BCL3_rep1_MACS_broadPeak_hg19_nearest_tss_chipenrich_GOBP-GOCC-GOMF_mappa-36_results
					    	if(name.contains("rep") && name.contains("nearest")  ){
					    		
					    			
					    		System.out.println("both loops" +  tokens[0]+"_"+tokens[1]);
						    	String ld = tokens[5]+"_"+tokens[6];
						    	String tf = tokens[0]+"_"+tokens[1];
						    	String check = tf+"_"+tokens[2]+ "_"+tokens[3]+"_"+tokens[4];
						    	String peakV= getPeakNo(check); 
						    	System.out.println(peakV +  "check = "+check);
						    	
						    	d.add(new EnrichRes(filename,tf,tokens[2],tokens[3],tokens[4],ld,tokens[7],tokens[8],tokens[9],tokens[10],peakV));
					    		
					    	}
					    	
					    	
					    }
			    }  
			    
			     
			  }
			  System.out.println("File created successfully.");
			 // out.close();
			return d;
					 
		}
		//ATF3_spp_GM12878.narrowPeak_hg19_1kb_fet_GOBP-GOCC-GOMF_nomappa_qcplots
		
		

		
	public static int getLines(File aFile) throws IOException {
	    LineNumberReader reader = null;
	    try {
	        reader = new LineNumberReader(new FileReader(aFile));
	        while ((reader.readLine()) != null);
	        return reader.getLineNumber();
	    } catch (Exception ex) {
	        return -1;
	    } finally { 
	        if(reader != null) 
	            reader.close();
	    }
	}
}
