package org.ncibi.resource.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.ncibi.lrpath.LRPathRServer;
import org.rosuda.REngine.REXPMismatchException;

public final class LRPathHCluster
{
	private final LRPathRServer rserver;

	public LRPathHCluster(LRPathRServer rserver)
	{
		this.rserver = rserver;
	}

	public void run(String sigvals, double cutoff, int numExpans, String columnNames, int columnSize, String rowNames, String data,
			int rowSize, String method, String link, String outputFilePath) throws REXPMismatchException, IOException
	{

		System.out.println("numExpans  " + numExpans);
		System.out.println("cutoff  " + cutoff);
		System.out.println("sigvals " + sigvals);

		System.out.println("method " + method);
		System.out.println("link " + link);
		System.out.println("data " + data);

		System.out.println("rowSize " + rowSize);
		System.out.println("columnSize " + columnSize);

		System.out.println("rowNames " + rowNames);
		System.out.println("columnNames " + columnNames);

		System.out.println("outputFilePath " + outputFilePath);
		
		File file =new File("log.txt");
		FileWriter fileWritter = new FileWriter("log.txt",true);
        BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
      
  

        bufferWritter.write("Done");
		
    bufferWritter.write("sigvals2<- matrix(c(" + sigvals + "),nrow=" + rowSize + ",ncol=" + columnSize
				+ ",byrow=TRUE, dimnames = list(c(" + rowNames + "), c(" + columnNames + ")))");
    bufferWritter.write("********************************************************************************");
		rserver.voidEvalRCommand("library(ctc)");
		rserver.voidEvalRCommand("sigvals2<- matrix(c(" + sigvals + "),nrow=" + rowSize + ",ncol=" + columnSize
				+ ",byrow=TRUE, dimnames = list(c(" + rowNames + "), c(" + columnNames + ")))");
		
	//	bufferWritter.write("satisfy<- which(sigvals2 < " + cutoff + ")");
	//	bufferWritter.write("********************************************************************************");
		rserver.voidEvalRCommand("satisfy<- which(sigvals2 < " + cutoff + ")");
		
	//	bufferWritter.write("criteria<-matrix(0, nrow=" + rowSize + ", ncol=" + columnSize + ", byrow=T)");
	//	bufferWritter.write("********************************************************************************");
		rserver.voidEvalRCommand("criteria<-matrix(0, nrow=" + rowSize + ", ncol=" + columnSize + ", byrow=T)");
		
	//	bufferWritter.write("criteria[satisfy] <- 1");
	//	bufferWritter.write("********************************************************************************");
		rserver.voidEvalRCommand("criteria[satisfy] <- 1");
		
	//	bufferWritter.write("mdat <- matrix(c(" + data + "), nrow = " + rowSize + ", ncol=" + columnSize
			//	+ ", byrow=TRUE,  dimnames = list(c(" + rowNames + "), c(" + columnNames + ")))");
	//	bufferWritter.write("********************************************************************************");
		rserver.voidEvalRCommand("mdat <- matrix(c(" + data + "), nrow = " + rowSize + ", ncol=" + columnSize
				+ ", byrow=TRUE,  dimnames = list(c(" + rowNames + "), c(" + columnNames + ")))");
		
	//	bufferWritter.write("mdat2 <- mdat[rowSums(criteria) >= " + numExpans + ", ]");
	//	bufferWritter.write("********************************************************************************");
		rserver.voidEvalRCommand("mdat2 <- mdat[rowSums(criteria) >= " + numExpans + ", ]");
		
		//bufferWritter.write("hclust2treeview(mdat2, file=\"" + outputFilePath + "\" , method=\"" + method + "\" , link=\"" + link
		//		+ "\")");
	//	bufferWritter.write("********************************************************************************");
		rserver.voidEvalRCommand("hclust2treeview(mdat2, file=\"" + outputFilePath + "\" , method=\"" + method + "\" , link=\"" + link
				+ "\")");
	      bufferWritter.close();
	}
}
