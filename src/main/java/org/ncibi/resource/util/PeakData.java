package org.ncibi.resource.util;

public class PeakData {
	 private String filepath;
     private String num_peaks;
     
     public PeakData(String filepath, String num_peaks)
     {
    	 this.filepath = filepath;
    	 this.num_peaks = num_peaks;
    	 
     }
     
     public String getFilepath() {
 		return filepath;
 	}

 	public void setFilepath(String filepath) {
 		this.filepath = filepath;
 	}

 	public String getNum_peaks() {
 		return num_peaks;
 	}

 	public void setNum_peaks(String num_peaks) {
 		this.num_peaks = num_peaks;
 	}

}
