 <%@ page session="true" %>
<%

if (session.getAttribute("username")==null ) {
		

		session.setAttribute("username", null);
		session.setAttribute("email", null);
		session.setAttribute("autenticado", null);
		session.setAttribute("admin", null);
		
		session.setAttribute("erro", "Não autenticado");
		
		String redirectURL = "login.jsp";
	    response.sendRedirect(redirectURL);
		
	
} 
%>