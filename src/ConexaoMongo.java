


import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.gridfs.GridFS;


public class ConexaoMongo {

	     
	public DB  getConn() {
		
		
		 MongoClient mongoClient = new MongoClient("localhost");
         DB db = mongoClient.getDB("ifsp");
         
         return db;
		
	}
      
      public GridFS  getTable(String table) {
    	  
    	  try {
	    	  MongoClient mongoClient = new MongoClient("localhost");
	          DB db = mongoClient.getDB("ifsp");
	          
	          GridFS fs = new GridFS(db, table);   
	          
	          return fs;
    	  } catch(Exception e) {
    		  
    		  System.out.println(e.getMessage());
    		  
    		  return null;
    	  }
    	  
      }
      
      
      
      
      
}

