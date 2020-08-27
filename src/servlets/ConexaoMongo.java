package servlets;
import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

public class ConexaoMongo {

	  MongoClient mongoClient = new MongoClient("localhost"); // connect to mongodb
      DB db = mongoClient.getDB("ifsp");    
}
