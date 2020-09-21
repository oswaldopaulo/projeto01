

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mongodb.BasicDBObject;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSInputFile;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Connection conn = new ConexaoBanco().getConnection();
	private String destino=null;
     
	 HttpSession session = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		session = request.getSession();
		 
		  try{
			  
			  
			   
				
				String query;
			  	String id = request.getParameter("id");
			  	String token  =  request.getParameter("token");
			  	String logout  =  request.getParameter("logout");
			  	
			 
			  	
			  	if(logout != null) {
			  		
			  		session.setAttribute("username", null);
					session.setAttribute("email", null);
					session.setAttribute("autenticado", null);
					
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
			  		
			  		
			  	}
			  	
			  	if(token != null) {
			  		
			  		
			  		
			  		
			  		query = "Select * from users where email = ? and password=md5(?)";
			  		PreparedStatement stmt = conn.prepareStatement(query);
			  		stmt.setString( 1, request.getParameter("email"));
					stmt.setString(2, request.getParameter("senha"));
					
					
					
					ResultSet rs = stmt.executeQuery();
					
					
					while(rs.next()) {
						session.setAttribute("username", rs.getString("name"));
						session.setAttribute("email", rs.getString("email"));
						session.setAttribute("autenticado", 1);
						
						RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						rd.forward(request, response);
						
						}
					stmt.close();
					session.setAttribute("erro", "Usuário ou senha invalida");
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
			  	}
			  	
			  	if(id != null) {
			  		
			  		query = "UPDATE produtos set `name`=?, `password`=md5(?) where id=" + id;
			  		
			  		PreparedStatement stmt = conn.prepareStatement(query);
					  
			  		stmt.setString( 1, request.getParameter("name"));
					stmt.setString(2, request.getParameter("password"));
					
					
					
					
					
					
					stmt.executeUpdate();
					
					   
			          
			          
			          session.setAttribute("status", "Usuário Atualizado com sucesso");
					
			  		
			  	} else {
			  		
			  		
			  		if(!request.getParameter("senha").equals(request.getParameter("confirma")) ) {
			  			
			  			session.setAttribute("status", "Confirmação Diferente");
			  			
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
			  			
			  		}
			  		
			  		
			  		query = "Select * from users where email=?";
			  		PreparedStatement stmt2 = conn.prepareStatement(query);
			  		stmt2.setString( 1, request.getParameter("email"));
			  		ResultSet rs = stmt2.executeQuery();
			  		
			  		
					while(rs.next()) {
						session.setAttribute("status", "Email ja cadastrado");
						 stmt2.close();
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
						
						}
					stmt2.close();
					
			  		query = "INSERT INTO `users`(`name`,  `email`, `password`) values (?,?,MD5(?))";
			  		
			  		PreparedStatement stmt = conn.prepareStatement(query,  Statement.RETURN_GENERATED_KEYS);
					  
				
					  
					stmt.setString( 1, request.getParameter("name"));
					stmt.setString(2, request.getParameter("email"));
					stmt.setString(3, request.getParameter("senha"));
				
					
					
					
					stmt.executeUpdate();
					
						session.setAttribute("username", request.getParameter("name"));
						session.setAttribute("email", request.getParameter("email"));
						session.setAttribute("autenticado", 1);
		                session.setAttribute("status", "Login Cadastrado com sucesso");
		                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						rd.forward(request, response);
					
			  	}
				
			  
	                
	                
	            
				
      	
      	
		        //  stmt.close();
					

      	 destino="index.jsp";
      
      	 
      	

      	//conn.close();
		  } catch (Exception e){
	           destino="erro.jsp";
	           session.setAttribute("erro", e.getMessage() + e.getCause());
	        } 
		  
		  
		             // get database
		
       
        

       
      
       // mongoClient.close();  
		
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

}
