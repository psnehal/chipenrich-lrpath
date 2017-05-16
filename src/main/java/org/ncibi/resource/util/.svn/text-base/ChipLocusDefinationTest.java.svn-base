package org.ncibi.resource.util;

import java.io.IOException;
import java.util.ResourceBundle;

import org.ncibi.chipenrich.ChipEnrichRServer;
import org.ncibi.lrpath.config.RServerConfiguration;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;

public final class ChipLocusDefinationTest
{
	public static void main(String[] args) throws IOException, REXPMismatchException, REngineException
	{
		String ldfile= "/home/snehal/DataFiles/ChipEnrich/ldfile/knowngenes_hg19_10kb_locusdef.txt";
		String species = "mm9";
		ChipLocusDefinationTest ct = new  ChipLocusDefinationTest();
		ct.run(ldfile, species);
		
		
	}
	ChipEnrichRServer rserver = new ChipEnrichRServer(RServerConfiguration.rserverAddress(), RServerConfiguration.rserverPort());
	

	public void run(String filePath, String species) throws REXPMismatchException, REngineException
	{
	String rangeFile = null;
	String locDefFile = null;
	ResourceBundle url = ResourceBundle.getBundle("org.ncibi.resource.bundle.url");
	
	if(species.equals("hg19"))	
	{//get range file and load locaus definition
		rangeFile =url.getString("hg19Range");
		locDefFile= "locusdef.hg19.nearest_tss.RData";
	
	}
	if(species.equals("mm9"))	
	{//get range file and load locau definition
		rangeFile =url.getString("mm9Range");
		locDefFile= "locusdef.mm9.nearest_tss.RData";
		
	}
	if(species.equals("rn4"))	
	{//get range file and load locau definition
		rangeFile =url.getString("rn4Range");
		locDefFile= "locusdef.rn4.nearest_tss.RData";
	}
	
	System.out.println("Range FIle"+rangeFile);
	String library= url.getString("ldData")+locDefFile;
	System.out.println(library);
	
	//TO load the locus definition from chipenrich.data folder
	rserver.assignRVariable("lib", library);
	rserver.voidEvalRCommand("load(lib)");
	System.out.println("ld = "+locDefFile+"@dframe");
	//rserver.voidEvalRCommand("ld = "+locDefFile+"@dframe");
	
	//Read user defined file:
	rserver.assignRVariable("userDef", filePath);
	rserver.voidEvalRCommand("newld = read.table(userDef,sep=\"\t\",header=T,stringsAsFactor=F)");
	//rserver.parseAndEvalCommand("sum(newld$geneid %in% ld$geneid)");
	
	//Read range file
	rserver.assignRVariable("rangeFile", rangeFile);
	String [] colName = new String[] { "chrom","start","end" };
	rserver.assignRVariable("colName", colName);
	rserver.voidEvalRCommand("chr.ranges = read.table(rangeFile, header=F,sep=\"\t\",stringsAsFactor=F,col.names=colName)");
	//String r = rserver.evalRCommand("chr.ranges").asString();
	
	//turn chr.ranges and newld in GRanges objects
	rserver.voidEvalRCommand("chr.gr = GRanges(seqnames= Rle(chr.ranges$chrom),ranges = IRanges(start = chr.ranges$start, end = chr.ranges$end),"
		+"names = 1:nrow(chr.ranges))");
	rserver.voidEvalRCommand("newld.gr = GRanges(seqnames= Rle(newld$chrom),ranges = IRanges(start = newld$start, end = newld$end),"
			+"names = 1:nrow(newld))");
	
	String result = rserver.parseAndEvalCommand("newld$in.chr.range = newld.gr %in% chr.gr");
	System.out.println("result is"+result);
	
	}
}
