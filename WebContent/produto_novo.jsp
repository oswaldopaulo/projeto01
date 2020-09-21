<%@include file="header.jsp" %>
<%@include file="checkadmin.jsp" %>

  
  <div class="container-fluid">
        <h1 class="mt-4">Novo Produtos</h1>
      
        <!-- 
        <div class="card mb-4">
        
            <div class="card-body">
         		
             
            </div>
        </div>
         -->
        <div class="card mb-4">
            <div class="card-header">
                 <i class="fas fa-table mr-1"></i>
                               Novo Cadastros 
            </div>
            
           
            <div class="card-body">
              
            
              
			<form role="form" action="ProdutoServlet" class="form" method="post" enctype="multipart/form-data">
			 <input type="hidden" name="_token" value="{{{ csrf_token() }}}" />
			 
			 <div class="form-group row">
                    <label for="descricao" class="col-sm-1 col-form-label">Descrição</label>
                    <div class="col-sm-11">
                      <input type="text" name="descricao" id="descricao" class="form-control"  required value="">
                    </div>
              </div>   
			 
    			 <div class="form-group row">
                        <label for="preco" class="col-sm-1 col-form-label">Preço</label>
                        <div class="col-sm-5">
        			      <input type="number" name="preco" id="preco" class="form-control"  step=".01" required value="">
                    	</div>
                    
            	</div>
            	
				
             	
             	<div class="form-group row">
             	 <label for="imagens" class="col-sm-1 col-form-label">Imagens</label>
                    <div class="col-sm-5">
                      <input type="file" name="imagens" id="imagens" class="form-control"    multiple="multiple"   accept="image/gif, image/jpeg, image/png, imagen/svg" required>
                    </div>
                            
             	</div>
               
            
             	
             	<div class="form-group row">
                    <label for="ficha" class="col-sm-1 col-form-label">Ficha</label>
                    <div class="col-sm-11">
                    
                    <textarea  class="form-control" name="ficha" id="ficha" rows="3" cols="" required></textarea>
                   
                 </div>
             
             	</div>    
        		 <div class="form-group">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="S" id="ativo" name="ativo"  checked>
                      <label class="form-check-label" for="ativo">
                       Ativo 
                      </label>
                    </div>
                  </div>
                 
                 
             
             	
        
               
					
					<a href="#">Cancelar</a>
					<button type="submit" class="btn btn-primary">Salvar</button>
				
            </form>
		 
                
                
                
                
            </div>
        </div>
    </div>
  
<%@include file="footer.jsp" %>