<%@include file="header.jsp" %>


  
  <div class="container-fluid">
        <h1 class="mt-4">Editar Produtos</h1>
      
        <!-- 
        <div class="card mb-4">
        
            <div class="card-body">
         		
             
            </div>
        </div>
         -->
        <div class="card mb-4">
            <div class="card-header">
                 <i class="fas fa-table mr-1"></i>
                               Editar Cadastros 
            </div>
            
           
            <div class="card-body">
              
            
              
			<form role="form" action="ProdutoServlet" class="form" method="post" enctype="multipart/form-data">
			 <input type="hidden" id="id" name="id" />
			 
			 
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
                      <input type="file" name="imagens" id="imagens" class="form-control"    multiple="multiple"   accept="image/gif, image/jpeg, image/png, imagen/svg">
                    </div>
                    
                      <div class="form-check">
                                <input id="apaga" name="apaga" type="checkbox"  class="form-check-input" value="1">
    							<label class="form-check-label" for="apaga" >Apagar imagens existentes?</label>
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
<script type="text/javascript">

fetch("ProdutoServlet?id=<%= request.getParameter("id") %>" ).then(function(response) {
	  var contentType = response.headers.get("content-type");
	  if(contentType && contentType.indexOf("application/json") !== -1) {
	    return response.json().then(function(json) {
	      // process your JSON further
	      
	      
	     
	    	p = json.Produtos;
	    	 console.log(p);
	    	 $("#id").val(p[0].ID);
	    	 $("#descricao").val(p[0].Descricao);
	    	 $("#preco").val(p[0].Preco);
	    	 $("#ficha").val(p[0].Ficha);
	    });
	  } else {
	    console.log("Oops, we haven't got JSON!");
	  }
	});

</script>
  
<%@include file="footer.jsp" %>