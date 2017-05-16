package org.ncibi.resource.util;

import java.util.Comparator;

import com.sun.org.apache.commons.collections.comparators.ComparatorChain;


public class CompareChain { 
	 
	public static void main(String[] args) {  
	Comparator<EnrichRes> SortArrayListByTf = new Comparator<EnrichRes>() {  
	    @Override  
	    public int compare(EnrichRes o1, EnrichRes o2) {
			 return o1.getTf().toUpperCase().compareTo(o2.getTf().toUpperCase());
		}
	};  



		Comparator<EnrichRes> SortArrayListByLD = new Comparator<EnrichRes>() {  
		    @Override  
		    public int compare(EnrichRes o1, EnrichRes o2) {
				 return o1.getLd().toUpperCase().compareTo(o2.getLd().toUpperCase());
			} 
		};  
		
		ComparatorChain chain = new ComparatorChain();
		
		
		chain.addComparator(SortArrayListByTf);
		chain.addComparator(SortArrayListByLD);
		
		

	}
}