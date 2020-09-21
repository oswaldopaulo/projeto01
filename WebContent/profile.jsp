<%@include file="header.jsp" %>
<%@include file="check.jsp" %>
  <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
    <h3><i class="fas fa-cart-plus fa-fw"></i> Meu Carrinho</h3>
   </div>
   
   <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
   


	</div>
    <div class="col-md-6 detail-grid-col" style="background-color: Gainsboro; margin: 20px">
    
    <h3>Não é cadastrado? Registre-se</h3>
    <div class="row mb-4" style="margin: 20px; border-bottom: 1px solid;" >
	     <div class="col-md-12">
	      <% if (session.getAttribute("status")!=null) { %>
	     <span class="text-danger"> <%= session.getAttribute("status") %> </span>
	    	 
	   <%  } %> 
	    	 	<form role="form" action="LoginServlet" class="form" method="post">
	    	 	
	    	 	<input type="hidden" name="id" value ="1" >
			
			 <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Nome</label>
                    <div class="col-sm-10">
                       <%= session.getAttribute("username") %>
                    </div>
              </div>   
			 
			 <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                       <%= session.getAttribute("email") %>
                    </div>
              </div>   
			 
    			 <div class="form-group row">
                        <label for="senha" class="col-sm-2 col-form-label">Senha</label>
                        <div class="col-sm-10">
        			      <input type="password" name="senha" id="senha" class="form-control" required>
                    	</div>
                    
            	</div>
            	
            	 <div class="form-group row">
                        <label for="confirma" class="col-sm-2 col-form-label">Confirma</label>
                        <div class="col-sm-10">
        			      <input type="password" name="confirma" id="confirma" class="form-control" required>
                    	</div>
                    
            	</div>
            	
				
             	
                 
             
             	
        
               
					
					
					<button type="submit" class="btn btn-primary btn-lg">Alterar a senha</button>
				
            </form>
	     </div>
	   
     
     
   
		 
	  
	  </div>

	  
  </div>


  
  
<%@include file="footer.jsp" %>