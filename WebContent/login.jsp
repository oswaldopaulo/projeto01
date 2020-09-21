<%@include file="header.jsp" %>
  <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
    <h3><i class="fas fa-cart-plus fa-fw"></i> Meu Carrinho</h3>
   </div>
   
   <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
   

	<div class="col-md-5 detail-grid-col" style="background-color: Gainsboro; margin: 10px">
		<h3>Logar no site</h3>
    <div class="row mb-4" style="margin: 20px;" >
	     <div class="col-md-12">
	    	<form role="form" action="ProdutoServlet" class="form" method="post" enctype="multipart/form-data">
			 <input type="hidden" name="_token" value="{{{ csrf_token() }}}" />
			 
			 <div class="form-group row">
                    <label for="login" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                      <input type="email" name="login" id="login" class="form-control"  required value="">
                    </div>
              </div>   
			 
    			 <div class="form-group row">
                        <label for="senha" class="col-sm-2 col-form-label">Senha</label>
                        <div class="col-sm-10">
        			      <input type="password" name="senha" id="senha" class="form-control" >
                    	</div>
                    
            	</div>
            	
				
             	
                 
             
             	
        
               
					
					<a href="#">Cancelar</a>
					<button type="submit" class="btn btn-primary">Entrar</button>
				
            </form>
	     </div>
	    
     </div>
     
     
   
		 
	</div>
    <div class="col-md-5 detail-grid-col" style="background-color: Gainsboro; margin: 10px">
    
    <h3>Não é cadastrado? Registre-se</h3>
    <div class="row mb-4" style="margin: 20px; border-bottom: 1px solid;" >
	     <div class="col-md-12">
	    	 	<form role="form" action="ProdutoServlet" class="form" method="post" enctype="multipart/form-data">
			 <input type="hidden" name="_token" value="{{{ csrf_token() }}}" />
			 <div class="form-group row">
                    <label for="nome" class="col-sm-2 col-form-label">Nome</label>
                    <div class="col-sm-10">
                      <input type="text" name="nome" id="nome" class="form-control"  required value="">
                    </div>
              </div>   
			 
			 <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                      <input type="email" name="email" id="email" class="form-control"  required value="">
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
            	
				
             	
                 
             
             	
        
               
					
					<a href="#">Cancelar</a>
					<button type="submit" class="btn btn-primary">Entrar</button>
				
            </form>
	     </div>
	   
     
     
   
		 
	  
	  </div>

	  
  </div>


  
  
<%@include file="footer.jsp" %>