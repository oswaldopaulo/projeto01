

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.stream.Collectors;
import java.util.ArrayList;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.gridfs.model.GridFSFile;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.nio.file.Paths;

/**
 * Servlet implementation class ImagensServlet
 */
@WebServlet("/ImagensServlet")
public class ImagensServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImagensServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		try {
			int idc = Integer.parseInt(request.getParameter("idc"));
			
			if(  idc > 0)  {
				DB db = new ConexaoMongo().getConn();
				JSONArray array = new JSONArray();
				  // get a single collection
				DBCollection collection = db.getCollection("produto_imagens.files");
				
			
				
				BasicDBObject whereQuery = new BasicDBObject();
				  whereQuery.put("_id_produto", idc);
				  
				  BasicDBObject fields = new BasicDBObject("_id_produto", idc);
				  DBCursor cursor = collection.find(fields);
				  JSONObject jsonObject = new JSONObject();
				
				 // System.out.println(cursor);
				
				while (cursor.hasNext()) {
					
					 JSONObject record = new JSONObject();
					 record.put("ID", cursor.next().get("_id").toString());
				
					  array.add(record);
					
				}
				 jsonObject.put("imagens", array);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");

				  PrintWriter saida = response.getWriter();
					
					
					 saida.println( jsonObject.toJSONString());

				        saida.flush();
				        saida.close();
			}
		} catch(Exception e) {
			
		}
		
		
		try {
		int id = Integer.parseInt(request.getParameter("id"));
		if(  id > 0)  {
			  try {
				  GridFS fs = new ConexaoMongo().getTable("produto_imagens") ;
	
		                           // GridFS for storing images
				  
				  BasicDBObject fields = new BasicDBObject("_id_produto", id);
	
		            GridFSDBFile file = fs.findOne(fields);
		            
		            
	
	
		            FileOutputStream out = new FileOutputStream(file.getFilename());
		            file.writeTo(out);
		            
		            //URL url = new URL(requestedUrl);
		            //HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();
		            response.setContentType("image/jpg");
		            //httpConnection.connect();

		            //int responseCode = httpConnection.getResponseCode();

		            //if (responseCode == HttpURLConnection.HTTP_OK) {
		                // TODO: set correct content type to response

		                OutputStream outputStream = response.getOutputStream();

		                try (InputStream imageStream = file.getInputStream()) {
		                    IOUtils.copy(imageStream, outputStream );
		                }
		            out.close();
	
		           // mongoClient.close();                                   // close all resources
		        } catch (Exception e) {
	
		        }
		  	}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		try {
			String idm = request.getParameter("idm");
			if(  idm.length() > 0)  {
				  try {
					  GridFS fs = new ConexaoMongo().getTable("produto_imagens") ;
		
			                           // GridFS for storing images
			
					  	
			            GridFSDBFile file = fs.findOne(new ObjectId(idm));
			            
			            
			            
		
			            FileOutputStream out = new FileOutputStream(file.getFilename());
			            file.writeTo(out);
			            
			            //URL url = new URL(requestedUrl);
			            //HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();
			            response.setContentType("image/jpg");
			            //httpConnection.connect();

			            //int responseCode = httpConnection.getResponseCode();

			            //if (responseCode == HttpURLConnection.HTTP_OK) {
			                // TODO: set correct content type to response

			                OutputStream outputStream = response.getOutputStream();

			                try (InputStream imageStream = file.getInputStream()) {
			                    IOUtils.copy(imageStream, outputStream );
			                }
			            out.close();
		
			           // mongoClient.close();                                   // close all resources
			        } catch (Exception e) {
		
			        }
			  	}
			} catch (Exception e) {
				// TODO: handle exception
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
