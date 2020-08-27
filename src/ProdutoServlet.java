

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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.stream.Collectors;
import java.util.ArrayList;

import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		session = request.getSession();
		int id=0;
		  try{
				PreparedStatement stmt = conn.prepareStatement("INSERT INTO `produtos`(`descricao`, `preco`, `ficha`, `ativo`) values (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
				
				
				  
				Float preco = Float.parseFloat(request.getParameter("preco").replace(",", "."));
				  
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
	                
	                
	            
				
				   
		          GridFS fs = new ConexaoMongo().getTable("produto_imagens") ;                    // GridFS for storing images
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
        
        	 
        	 session.setAttribute("status", "Produto Cadastrado com sucesso");

        	conn.close();
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
