package org.ncibi.resource.util;


import java.io.IOException;

import org.hibernate.Session;
import org.ncibi.db.EntityManagers;
import org.ncibi.db.PersistenceSession;
import org.ncibi.db.PersistenceUnit;
import org.ncibi.db.ws.ChipEnrichUrlLinkName;
import org.ncibi.hibernate.SessionProcedure;
import org.ncibi.hibernate.Sessions;

public class ChipEnrichLinkUrlTest
{
	public static void main(String[] args) throws IOException
	{
		ChipEnrichLinkUrlTest ct = new ChipEnrichLinkUrlTest();
		ct.testLogging();
	}
    
    public void testLogging()
    {
        PersistenceSession persistence = new PersistenceUnit(EntityManagers
                    .newEntityManagerFromProject("task"));
        
        String uuid ="123";
        String name = "test2";
        
        final ChipEnrichUrlLinkName linkname = new ChipEnrichUrlLinkName();
        linkname.setUuid(uuid);
        linkname.setName(name);
        Sessions.withSession(persistence.session(), new SessionProcedure()
        {
            @Override
            public void apply(Session session)
            {
                session.saveOrUpdate(linkname);
            }
        });
        
        
      
            final String hql = "from ws.ChipEnrichUrlLinkName where uuid = '" + uuid+ "'";
            ChipEnrichUrlLinkName  link = null;

            try
            {
                link = persistence.hqlQuery(hql).single();
            }
            catch (Exception e)
            {
                link = null;
            }
            System.out.println(link.getName());

             
       
        
        
    }

	

	
}
