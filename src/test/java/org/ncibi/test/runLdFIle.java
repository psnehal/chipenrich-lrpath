package org.ncibi.test;

import java.io.IOException;

import org.ncibi.resource.util.ChipLocusDefinationTest;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;

public class runLdFIle {

	public static void main(String[] args) throws IOException, REXPMismatchException, REngineException
	{
		String ldfile= "/home/snehal/DataFiles/ChipEnrich/ldfile/knowngenes_hg19_10kb_locusdef.txt";
		String species = "hg19";
		ChipLocusDefinationTest ct = new  ChipLocusDefinationTest();
		ct.run(ldfile, species);
		
		
		
		
		
	}
	
	
}
