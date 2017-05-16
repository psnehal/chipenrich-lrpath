package org.ncibi.test;

import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.Test;
import org.ncibi.commons.db.JDBCExecuter;

public class JDBCTest {

 @test
	public void testconnection()
	{	
		JDBCExecuter db = new JDBCExecuter(ResourceBundle.getBundle("org.ncibi.resource.bundle.database"));
		
		
		String query = "Select uuid from serverapps.dbo.ChipEnrichUrlLinkName where name = 'TestNov15'";
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
