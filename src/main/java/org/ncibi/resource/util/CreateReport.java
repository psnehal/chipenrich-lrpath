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

public class CreateReport {
	
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
		 CreateReport cr = new CreateReport();
		peaks = cr.combineObj("K562");
		//cr.getSize("/usr/share/chipFileStore/Constant/SummaryReport/Data/K562");
		 
		
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
		//System.out.println("link create is"+url);
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

public static String getPeakNo(String check,String celline)
{
	ArrayList<PeakData> peak = new ArrayList<PeakData>();
	///usr/share/chipEnrichData/SummaryReport/*.*
	//C:/Users/snehal/Desktop/work/enrichmentRes/peakSummary2.txt
	String filepath = url.getString("summaryDirectory")+"SummaryReportFor"+ celline+ ".txt";
	//System.out.println("Reading Peak No from"+ filepath);
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
	
	
/*Reads the folder content for given cellline and creates object for EnrichRes .
 *  EnrichRes is object which contains infor  filename, tf,  peak_caller,  broad_narrow,  genome,  ld,  method,  database,
 *	mappa,  filetype,  peakno
 *  Peakno is obtained by getPeakNo method above and its is passed with value  ATF3_spp_narrowPeak_hg19;
 *  Object is created by using only chipenrich peaks files. 
 */

	
	public ArrayList<EnrichRes> combineObj(String celline) throws IOException
	{
		
            String fileP = url.getString("summaryDirectory")+"Data/"+celline+"/"; 	
            System.out.println(fileP);
			File folder = new File(fileP);
			ArrayList<EnrichRes> d = new ArrayList<EnrichRes>();
			File[] listOfFiles = folder.listFiles(); 		 
			for (int i = 0; i < listOfFiles.length; i++) 
			  {
			    String name = listOfFiles[i].getName();
			   
			    String filename = name.substring(0, name.lastIndexOf("_"));
			  System.out.println("filename is"+filename);
			    String [] tokens = name.split("_");
			    //System.out.println(name + "\n"+tokens.length +tokens[4] );
			    String filepath2  = tokens[0];
			    String peakno;
			    if(name.contains("chipenrich")&& name.contains("peaks.tab"))
				    {
				    /*out.write(name + "\n");
				     * ZZZ3_  spp_          narrowPeak_    hg19_nearest-tss_chipenrich _GOBP-GOCC-GOMF_no-mappa_qcplots.pdf*/
	 //String filename,tf,   peak_caller, broad_narrow,  genome, ld,         method,       database,   mappa,   filetype,      peakno)
				    	String check = tokens[0]+"_"+tokens[1]+ "_"+tokens[2]+"_"+tokens[3];
				    	String peakV= getPeakNo(check,celline); 
				    	d.add(new EnrichRes(filename,tokens[0],tokens[1],tokens[2],tokens[3],tokens[4],tokens[5],tokens[6],tokens[7],tokens[8], peakV));					  
				    }
			    
			  }
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
	
	
	public void getSize(String filePath) throws IOException
	{
		File ps2 = new File("/usr/share/chipFileStore/Constant/SummaryReport/SummaryReportForK562.txt");
		FileWriter fw = new FileWriter(ps2.getAbsoluteFile());
		BufferedWriter bw = new BufferedWriter(fw);
			
		
		File dir = new File(filePath);	
		for (File file : dir.listFiles()) {
	        if (file.isFile()){
		        	if(file.getName().contains("mappa-36_peaks.tab")&& file.getName().contains("nearest-tss_chipenrich"))
		        	{
		            System.out.println(file.getName()+ "	"+ getLines(file));
		            bw.write(file.getName()+ "	"+ getLines(file)+"\n");
		        	}
	        	}   
		}
		bw.close();
		System.out.println("Done");
	}
}
