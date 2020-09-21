 <%@ page session="true" %>
<%

if (session.getAttribute("admin")==null ) {
		

		session.setAttribute("username", null);
		session.setAttribute("email", null);
		session.setAttribute("autenticado", null);
		session.setAttribute("admin", null);
		
		session.setAttribute("erro", "Não autenticado");
		
		String redirectURL = "login.jsp";
	    response.sendRedirect(redirectURL);
		
	
} else 	if (session.getAttribute("admin").equals("0") ) {
	session.setAttribute("username", null);
	session.setAttribute("email", null);
	session.setAttribute("autenticado", null);
	session.setAttribute("admin", null);
	
	session.setAttribute("erro", "Não autenticado");
	
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
%>