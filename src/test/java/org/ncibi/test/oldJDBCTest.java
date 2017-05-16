package org.ncibi.test;

import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;

import org.junit.Test;
import org.ncibi.commons.db.JDBCExecuter;

public class oldJDBCTest {


	public void testconnection()
	{	
		JDBCExecuter db = new JDBCExecuter(ResourceBundle.getBundle("org.ncibi.resource.bundle.database"));
		
		
		String query = "select distinct h.gene_id from dictionary_set ds, homologene_map h where ds.dictionary_id = 4 and h.element_id = ds.element_id and h.taxonid = 9606";
		try
		{
			List<String> list = db.selectSingleList(query);
			
			for(String a : list)
			{
				System.out.println(a);
			}
			
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		
		
	}
}
