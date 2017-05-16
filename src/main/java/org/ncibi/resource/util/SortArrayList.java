package org.ncibi.resource.util;

import java.util.Comparator;

import com.google.common.collect.ComparisonChain;

public class SortArrayList implements Comparator<EnrichRes>{
	 
    
	public int compare(EnrichRes o1, EnrichRes o2) {
		// return o1.getTf().toUpperCase().compareTo(o2.getTf().toUpperCase());
		 
		 return ComparisonChain.start()
			        .compare(o1.getTf().toUpperCase(), o2.getTf().toUpperCase())
			        .compare(o1.getLd().toUpperCase(), o2.getLd().toUpperCase())
			        
			        .result();
	}
}
