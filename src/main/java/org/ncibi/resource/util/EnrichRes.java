package org.ncibi.resource.util;


/*	filepath= ../encode_data/GM12878/ATF3_spp_GM12878.narrowPeak.gz
 *  num_peaks 137
 * 	filename=ATF3_spp_GM12878.narrowPeak.gz
	TF=	ATF3
	peak_caller	=spp
	broad_narrow=narrowPeak
	*/


public class EnrichRes {
	private String filename;
	private String tf;
    private String peak_caller;
    private String broad_narrow;
    private String genome;
    private String ld;
    private String method;
    private String database;
	private String mappa;
	private String filetype;
	private String peakno;        
	        String strLine;
	        String locusDef;
	        String npeak_bin;
	        
	       
	        	
			
	        public EnrichRes(String filename,String tf, String peak_caller, String broad_narrow, String genome, String ld, String method, String database,
	    	 String mappa, String filetype, String peakno){
	        	
	        	this.filename = filename;
	        	this.tf = tf;
	            this.peak_caller = peak_caller;
	            this.broad_narrow = broad_narrow;
	            this.genome = genome;
	            this.ld= ld;
	            this.method = method;
	            this.database = database;
	        	this.mappa = mappa;
	        	this.filetype = filetype;
	        	this.peakno = peakno;
	        	
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
			
			public String getGenome() {
				return genome;
			}

			public void setGenome(String genome) {
				this.genome = genome;
			}

			public String getLd() {
				return ld;
			}

			public void setLd(String ld) {
				this.ld = ld;
			}

			public String getMethod() {
				return method;
			}

			public void setMethod(String method) {
				this.method = method;
			}

			public String getDatabase() {
				return database;
			}

			public void setDatabase(String database) {
				this.database = database;
			}

			public String getMappa() {
				return mappa;
			}

			public void setMappa(String mappa) {
				this.mappa = mappa;
			}

			public String getFiletype() {
				return filetype;
			}

			public void setFiletype(String filetype) {
				this.filetype = filetype;
			}

			public String getPeakno() {
				return peakno;
			}

			public void setPeakno(String peakno) {
				this.peakno = peakno;
			}

			
	}



