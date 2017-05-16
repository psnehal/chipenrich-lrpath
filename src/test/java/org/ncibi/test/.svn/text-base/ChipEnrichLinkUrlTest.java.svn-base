package org.ncibi.test;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.hibernate.Session;
import org.junit.Ignore;
import org.junit.Test;
import org.ncibi.commons.db.JDBCExecuter;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.ws.ChipEnrichUrlLinkName;
import org.ncibi.db.ws.TaskType;
import org.ncibi.db.ws.Task;
import org.ncibi.hibernate.SessionProcedure;
import org.ncibi.hibernate.Sessions;
import org.ncibi.resource.util.ChipEnrichDbConnection;
import org.ncibi.task.TaskStatus;
import org.ncibi.task.logger.PersistentTaskLogger;
import org.ncibi.task.logger.TaskLogger;

public class ChipEnrichLinkUrlTest
{
	public static void main(String[] args) throws IOException
	{
		ChipEnrichLinkUrlTest jt = new ChipEnrichLinkUrlTest();
		
		
	}

	public String testconnection(String name)
	{	
		JDBCExecuter db = new JDBCExecuter(ResourceBundle.getBundle("org.ncibi.resource.bundle.database"));
		String value = "";
		
		String query = "Select uuid from serverapps.dbo.ChipEnrichUrlLinkName where name = "+ "'"+name+ "'";
		try
		{
			
			value= db.selectSingleString(query);
		    System.out.println(value);
		
			
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return value;
		
		
	}       
       
        
        
    

	

	
}
