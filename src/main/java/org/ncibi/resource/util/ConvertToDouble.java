package org.ncibi.resource.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class ConvertToDouble {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public Double doubleFormatter(String pvalue)
	{
		Double d2 = 0.0;
		if(!(pvalue.isEmpty()))
    	{
    	Double pval = Double.parseDouble(pvalue);
    	NumberFormat formatter = new DecimalFormat("#0.0E0");
    	 d2= new Double(formatter.format(pval));
    	return d2;
    	}
		return d2;
	}

}
