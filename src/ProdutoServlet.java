

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

/**
 * Servlet implementation class ProdutoServlet
 */
@WebServlet("/ProdutoServlet")
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
		  try{
				PreparedStatement stmt = conn.prepareStatement("INSERT INTO `produtos`(`descricao`, `preco`, `ficha`, `ativo`) values (?,?,?,?);");
				  
				  
				stmt.setString( 1, request.getParameter("descricao"));
				stmt.setDouble(2, Double.parseDouble(request.getParameter("preco")));
				stmt.setString(3, request.getParameter("ficha"));
				stmt.setString(4, request.getParameter("ativo")=="S" ? "S" : "N");
				
				
				
				
				
				
				stmt.execute();
				stmt.close();
        	
        	
        	

        	 destino="produtos.jsp";
        	 session.setAttribute("status", "Produto Cadastrado com sucesso");

        	conn.close();
		  } catch (SQLException e){
	           destino="erro.jsp";
	           session.setAttribute("erro", e.getMessage());
	        }
		
		RequestDispatcher rd = request.getRequestDispatcher("produtos.jsp");
		rd.forward(request, response);
	}

}
