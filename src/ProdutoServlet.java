

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.bson.Document;
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
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
/**
 * Servlet implementation class ProdutoServlet
 */
@WebServlet("/ProdutoServlet")
@MultipartConfig
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Connection conn = new ConexaoBanco().getConnection();
	private String destino=null;
     
	 HttpSession session = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdutoServlet() {
        super();
        // TODO Auto-generated constructor stub
       
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		session = request.getSession();
		
		try {
			
			String query="";
			String id = request.getParameter("id");
			String rid = request.getParameter("rid");
			 if(  id != null && rid != null) {
				 
				 query = "Delete  from produtos where id = " + request.getParameter("id") ;
				 PreparedStatement stmt = conn.prepareStatement(query);
				 stmt.executeUpdate();
				 
				 GridFS fsf = new ConexaoMongo().getTable("produto_imagens") ;
				 fsf.remove(new BasicDBObject("_id_produto", id));
				
				 session.setAttribute("status", "Produto "+ id + " removido com sucesso");
				 
				 RequestDispatcher rd = request.getRequestDispatcher("produtos.jsp");
				 rd.forward(request, response);
		         
				 
			 }
			
			else if(  id != null) {
			
				query = "Select * from produtos where id = " + request.getParameter("id") ;
			} else {
				query = "Select * from produtos";
			}
			
			
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			JSONObject jsonObject = new JSONObject();
			JSONArray array = new JSONArray();
			
			while(rs.next()) {
				   JSONObject record = new JSONObject();
				  
				   record.put("ID", rs.getInt("id"));
				   record.put("Descricao", rs.getString("descricao"));
				   record.put("Preco", rs.getDouble("preco"));
				   record.put("Ficha", rs.getString("ficha"));
				   record.put("Ativo", rs.getString("ativo"));
				   
				   array.add(record);
				}
			
			jsonObject.put("Produtos", array);
			
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

		    PrintWriter saida = response.getWriter();
		
			
			 saida.println( jsonObject.toJSONString());

		        saida.flush();
		        saida.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		session = request.getSession();
		 
		  try{
			   
				int id;
				String query;
			  	id = Integer.parseInt(request.getParameter("id"));
			  	
			  	if(id>0) {
			  		
			  		query = "UPDATE produtos set `descricao`=?, `preco`=?, `ficha`=?, `ativo`=? where id=" + id;
			  		
			  		PreparedStatement stmt = conn.prepareStatement(query);
					  
					Double preco = Double.parseDouble(request.getParameter("preco").replace(",", "."));
					  
					stmt.setString( 1, request.getParameter("descricao"));
					stmt.setDouble(2, preco);
					stmt.setString(3, request.getParameter("ficha"));
					stmt.setString(4, request.getParameter("ativo").equals("S") ? "S" : "N");
					
					
					
					
					
					
					stmt.executeUpdate();
					
					   
			          String apaga = request.getParameter("apaga");
			          if(apaga != null) {
			        	  GridFS fsf = new ConexaoMongo().getTable("produto_imagens") ;
						  //GridFS fsc = new ConexaoMongo().getTable("produto_imagens.chunks") ;
						  	
						 // fsf.find(new BasicDBObject("_id_produto", id));
						  
						  
						  
				          fsf.remove(new BasicDBObject("_id_produto", id));
				          //fsc.remove(new BasicDBObject("files_id", id));
			          }
			          
			          session.setAttribute("status", "Produto Atualizado com sucesso");
					
			  		
			  	} else {
			  		query = "INSERT INTO `produtos`(`descricao`, `preco`, `ficha`, `ativo`) values (?,?,?,?)";
			  		
			  		PreparedStatement stmt = conn.prepareStatement(query,  Statement.RETURN_GENERATED_KEYS);
					  
					Double preco = Double.parseDouble(request.getParameter("preco").replace(",", "."));
					  
					stmt.setString( 1, request.getParameter("descricao"));
					stmt.setDouble(2, preco);
					stmt.setString(3, request.getParameter("ficha"));
					stmt.setString(4, request.getParameter("ativo").equals("S") ? "S" : "N");
					
					
					
					stmt.executeUpdate();
					
					 ResultSet rs = stmt.getGeneratedKeys();
		                if(rs.next())
		                {
		                    id = rs.getInt(1);
		                }
		                session.setAttribute("status", "Produto Cadastrado com sucesso");
					
			  	}
				
			  
	                
	                
	            
				
			  		GridFS fs = new ConexaoMongo().getTable("produto_imagens") ;
		                            // GridFS for storing images
		          PrintWriter writer = null;
		          
		          try {
		              writer = response.getWriter();
		          } catch (IOException ex) {
		             
		              return;
		          }
		          
		       
		         
		          
		          List<Part> fileParts = request.getParts().stream().filter(part -> "imagens".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
		          for (Part filePart : fileParts) {
		              String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
		              InputStream fileContent = filePart.getInputStream();
		              // ... (do your job here)
		              System.out.println(fileName);
						
		              
		              GridFSInputFile file = fs.createFile(fileContent, fileName);
		              file.put("_id_produto", id);
		              file.setContentType("image");
		              file.save();
		              writer.println(file.toString());
		          }
		          
        	
        	
		        //  stmt.close();
					

        	 destino="produtos.jsp";
        
        	 
        	

        	//conn.close();
		  } catch (Exception e){
	           destino="erro.jsp";
	           session.setAttribute("erro", e.getCause() );
	        } 
		  
		  
		             // get database
		
         
          

         
        
         // mongoClient.close();  
		
		RequestDispatcher rd = request.getRequestDispatcher("produtos.jsp");
		rd.forward(request, response);
	}

}
