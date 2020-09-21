<%@include file="header.jsp" %>
  <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
    <h3><i class="fas fa-cart-plus fa-fw"></i> Meu Carrinho</h3>
   </div>
   
   <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
   

	<div class="col-md-8 detail-grid-col">
		<div class="col-md-12">
			<div class="row mb-4" style="border-bottom: 1px solid;" >
			     <div class="col-md-4">
			    	 Produto
			     </div>
			      <div class="col-md-2">
			    	 Qtd
			     </div>
			       <div class="col-md-2">
			    	 X
			     </div>
			      <div class="col-md-4">
			    	 Preço
			     </div>
			  </div>
	     </div>
	     
	     <div class="col-md-12" id="produtos">
		
			  
	     </div>
	</div>
    <div class="col-md-4 detail-grid-col" style="background-color: Gainsboro;">
    
    <h3>Resumo do Pedido</h3>
    <div class="row mb-4" style="margin: 20px; border-bottom: 1px solid;" >
	     <div class="col-md-8">
	    	 Subtotal
	     </div>
	      <div class="col-md-4" style="text-align: right;">
	    	 <div id="valor"> R$ 999,99</div>
	     </div>
	       <div class="col-md-8">
	    	 Frete
	     </div>
	      <div class="col-md-4" style="text-align: right;">
	    	 R$ 0,0
	     </div>
     </div>
     
     
   
    <div class="row mb-4" style="margin-left: 20px; margin-right: 20px; margin-top: 0px" >
	     <div class="col-md-8">
	    	 <h5>Total</h5>
	     </div>
	      <div class="col-md-4" style="text-align: right;">
	    	 <h5> <span id="total"> R$ 999,99 </span></h5>
	     </div>
	      
     </div>
     
		 
		    <button type="button" class="btn btn-danger btn-lg" style="width: 80%; margin-left: 10%; margin-right: auto; "> <i class="fas fa-cart-plus fa-fw"></i> Continuar </button>
		    <p style="margin-left: 20px; margin-right: 20px; margin-top: 20px; text-align: center;"><i class="fas fa-info-circle" style="color: RoyalBlue"></i> Se você possuir cupom ou vale poderá usar na proxima etapa</p>    
		    
		 
	  
	  </div>

	  
  </div>

  <script type="text/javascript">

	fetch("SessionServlet").then(function(response) {
	  var contentType = response.headers.get("content-type");
	  if(contentType && contentType.indexOf("application/json") !== -1) {
	    return response.json().then(function(json) {
	      // process your JSON further
	    	//console.log(json.Produtos);
	    	orderAddRow(json.Carrinho)
	    });
	  } else {
	    console.log("Oops, we haven't got JSON!");
	  }
	});
	
	function orderAddRow($data) {
		var valor = 0;
	    $.each($data,function(index,value) {
	    	
	    	valor += value.Preco;
	        
	            
	            
	        var row = 	"<div class=\"row mb-4\" style=\"border-bottom: 1px solid;\" >"
		     + "<div class=\"col-md-4\">"
		     
				
		    +	"<img src=\"ImagensServlet?id=" + value.ID + "\" alt=\"imagem do produto\" class=\"img-thumbnail\" style=\"width: 75px;height: autopx;  float: left; margin-right: 10px\"/>"
		    	
			+   "<h6>" + value.Descricao + "</h6>"
		   // +	"<p>descricao</p>"
		    + "</div>"
		    +  "<div class=\"col-md-2\">"
		    +	 "<input name=\"qtd\" type=\"number\" class=\"form-control\" value=\"" + value.qtd + "\" style=\"width: 50px\" />"
		    + "</div>"
		    +   "<div class=\"col-md-2\">"
		    +	"<i class=\"far fa-trash-alt fa-2x\"></i>"
		    + "</div>"
		    +  "<div class=\"col-md-4\">"
		    +	 "R$ " + value.Preco + ""
		    + "</div>"
		  +   "</div>";
  	            
	        		$('#produtos').append(row);
  	          
	    });
	    
	    $('#valor').empty();
		$('#valor').append(("R$ " + valor.toFixed(2)).replace(".",","));
		
		$('#total').empty();
		$('#total').append(("R$ " + valor.toFixed(2)).replace(".",","));
	
	    
	}
  </script>
  
  
<%@include file="footer.jsp" %>