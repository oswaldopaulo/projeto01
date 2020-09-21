

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mongodb.BasicDBObject;
import com.mongodb.gridfs.GridFS;

/**
 * Servlet implementation class SessionServlet
 */
@WebServlet("/SessionServlet")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Connection conn = new ConexaoBanco().getConnection();
	private String destino=null;
     
	 HttpSession session = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionServlet() {
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
			int count =0;
			Double valor=0.0;
			
			
			
			if(  id != null) {
			
				query = "Select * from produtos where id = " + request.getParameter("id") ;
			
			
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			JSONObject jsonObject = new JSONObject();
			
			JSONArray array = new JSONArray();
			
			ArrayList prd2= new ArrayList();
			
			if(session.getAttribute("prd2") != null) {
				
				
				prd2 = (ArrayList) session.getAttribute("prd2");
	
				 
			}
			
		
			boolean existe=false;
			
			 int n= prd2.size();
			 for (int i=0; i<n; i++) {
			     // System.out.printf("Posição %d- %s\n", i, prd2.get(i));
			      JSONObject record = (JSONObject) prd2.get(i);
			      
			      
			      count++;
		    	  valor = valor + Double.parseDouble( record.get("ID").toString());	
			     
			     
			      if(id.equals(record.get("ID").toString())) {
			    	existe = true;  
			    	//System.out.println(record.get("ID"));
			      } else {
			    	
			      }
			    }
		
			if(existe==false) {
			while(rs.next()) {
				   JSONObject record = new JSONObject();
				  
				   record.put("ID", rs.getInt("id"));
				   record.put("Descricao", rs.getString("descricao"));
				   record.put("Preco", rs.getDouble("preco"));
				   record.put("Ficha", rs.getString("ficha"));
				   record.put("Ativo", rs.getString("ativo"));
				   record.put("qtd", 1);
				   count++;
				   valor+=  rs.getDouble("preco");
				   
				prd2.add(record);
				 array.add(record);
				}
				session.setAttribute("prd2", prd2);
			}

			
			
			
			jsonObject.put("conta", count);
			jsonObject.put("valor", valor);
			
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

		    PrintWriter saida = response.getWriter();
		
			
			 saida.println( jsonObject.toJSONString());

		        saida.flush();
		        saida.close();
		        
			}
			
			
			ArrayList prd2= new ArrayList();
			
			
			if(session.getAttribute("prd2") != null) {
				
				JSONObject jsonObject = new JSONObject();
				
				JSONArray array = new JSONArray();
				prd2 = (ArrayList) session.getAttribute("prd2");
				
				 int n= prd2.size();
				 for (int i=0; i<n; i++) {
				     // System.out.printf("Posição %d- %s\n", i, prd2.get(i));
				      JSONObject record = (JSONObject) prd2.get(i);
				        
				     
			    	  array.add(record);
				 
				    }
					jsonObject.put("Carrinho", array);
					
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");

				    PrintWriter saida = response.getWriter();
				
					
					 saida.println( jsonObject.toJSONString());

				        saida.flush();
				        saida.close();
				
	
				 
			}
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
		doGet(request, response);
	}

}
