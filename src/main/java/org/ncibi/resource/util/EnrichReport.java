package org.ncibi.resource.util;


/*	filepath= ../encode_data/GM12878/ATF3_spp_GM12878.narrowPeak.gz
 *  num_peaks 137
 * 	filename=ATF3_spp_GM12878.narrowPeak.gz
	TF=	ATF3
	peak_caller	=spp
	broad_narrow=narrowPeak
	*/


public class EnrichReport {
	        private String filepath;
	        private String num_peaks;
	        private String filename;
	        private String tf;
	        private String peak_caller;
	        private String broad_narrow;
	        String strLine;
	        String locusDef;
	        String npeak_bin;
	        
	        public EnrichReport(String filepath, String filename,String num_peaks,
					String tf, String peak_caller, String broad_narrow,String npeak_bin, String locusDef) {
				
	        	this.filepath = filepath;
	        	this.num_peaks = num_peaks;
	        	this.filename=filename;
	        	this.tf=tf;
	        	this.peak_caller=peak_caller;
	        	this.broad_narrow=broad_narrow;
	        	this.locusDef=locusDef;
	        	this.npeak_bin = npeak_bin;
	        	
			}
	        public EnrichReport(){
	        	
	        }

	        public String getLocusdef()
	        {
	        	return locusDef;
	        }

	        public void setLocusDef(String locusDef)
	        {
	        	this.locusDef = locusDef;
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




			public String getFilename() {
				return filename;
			}




			public void setFilename(String filename) {
				this.filename = filename;
			}




			public String getTf() {
				return tf;
			}




			public void setTf(String tf) {
				this.tf = tf;
			}




			public String getPeak_caller() {
				return peak_caller;
			}




			public void setPeak_caller(String peak_caller) {
				this.peak_caller = peak_caller;
			}




			public String getBroad_narrow() {
				return broad_narrow;
			}




			public void setBroad_narrow(String broad_narrow) {
				this.broad_narrow = broad_narrow;
			}
	}



