
<%@include file="header.jsp" %>
<!-- Modal -->
<div class="modal fade" id="ModalRemover" tabindex="-1" role="dialog" aria-labelledby="ModalRemoverTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Confirmação</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Confirma exclusão do registro?
      </div>
      <div class="modal-footer">
      	<input type="hidden" name="RemoveId" id="RemoveId" value=""/>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Não</button>
        <button type="button" class="btn btn-primary" onclick="remove()">Sim</button>
      </div>
    </div>
  </div>
</div>
  
    <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
    <h3><i class="fas fa-archive fa-fw"></i> Produtos </h3>
   </div>
   
   <div class="row mb-4" style="margin-left: 100px; margin-top: 50px; margin-right: 100px">
   


    <div class="col-md-2 detail-grid-col" style="background-color: Gainsboro;">
    
    <h4>Alteração</h4>
		<ul style="border-bottom: 1px solid;">
			<li> Usuários </li>
			<li> Produtos </li>
			<li> Categoria </li>
		
		
		</ul>
		
	   <h4>Relatório</h4>
		<ul>
			<li> Relatório 1 </li>
			<li> Relatório 2 </li>
			<li> Relatório 3 </li>
		
		
		</ul>
		 
		 
	  
	  </div>
	  
	  	<div class="col-md-10 detail-grid-col">
	  
	  	
	  	<%  if(  request.getSession().getAttribute("status")!=null) {%>
		  	 <div class="card bg-success text-white mb-4 card mb-4" id="msg" style="padding: 5px">
	          	<div class="card-body">
	              	<strong>Sucesso! </strong>
	              	<%=   request.getSession().getAttribute("status") %>
	             </div>
	          </div>
		  	<% } %>
		  	
		  		<%  if(  request.getSession().getAttribute("erro")!=null) {%>
		  	 <div class="card bg-danger text-white mb-4 card mb-4" id="msg2" style="padding: 5px">
	          	<div class="card-body">
	              	<strong>Sucesso! </strong>
	              	<%=   request.getSession().getAttribute("erro") %>
	             </div>
	          </div>
		  	<% } %>
	  	    	
	  	
         <a href="produto_novo.jsp"><button type="button" class="btn btn-primary"> <i class="fa fa-edit"></i>    Novo Produto    </button></a>
               
	  	 <div class="table-responsive">
		  	<table class="table table-sm" id="produtos">
		  	<tr>
		  		<th> # </th>
		  		<th> Id </th>
		  		<th> Produto </th>
		  		<th> Estoque </th>
		  		<th> Preço </th>
		  		
		  	</tr>
		  	
		  	<!--  
		  	 <tr>
		  		<td style="width: 50px; white-space: nowrap;"> 
		  			<a href="produto_editar.jsp?id=1"  title="Editar"><i class="fas fa-edit fa-fw"></i></a>
		  			<a href="#" onclick="modal('produto_remover.jsp')"  title="Remover"><i class="fas fa-trash-alt mr-1 red"></i></a>
		  		</td>
		  		<td> Id </td>
		  		<td> Produto </td>
		  		<td> Estoque </td>
		  		<td> Preço </td>
		  		
		  	</tr>
		  		-->
		  		
		  		
		  	
		  	
		  	</table>
		  </div>
		
	</div>

	  
  </div>
<script type="text/javascript">

	fetch("ProdutoServlet").then(function(response) {
	  var contentType = response.headers.get("content-type");
	  if(contentType && contentType.indexOf("application/json") !== -1) {
	    return response.json().then(function(json) {
	      // process your JSON further
	    	//console.log(json.Produtos);
	    	orderAddRow(json.Produtos)
	    });
	  } else {
	    console.log("Oops, we haven't got JSON!");
	  }
	});
	
	function orderAddRow($data) {
	    $.each($data,function(index,value) {
	        var row = '<tr><td>' + value.ID + '</td>'
	            + '<td>' + value.name + '</td></tr>';
	            
	            
	        var row = "<tr>"
		  		+ "<td style='width: 50px; white-space: nowrap;'>" 
  				+  "<a href=\"produto_editar.jsp?id=" + value.ID +  "\"  title=\"Editar\"><i class=\"fas fa-edit fa-fw\"></i></a>"
  			    + "<a href=\"#\" onclick=\"modal('produto_remover.jsp?id=" + value.ID +  "')\"  title=\"Remover\"><i class=\"fas fa-trash-alt mr-1 red\"></i></a>"
 				+ "</td>"
  				+ "<td>" + value.ID + "</td>"
		  		+ "<td>" + value.Descricao + "</td>"
		  		+ "<td> 0 </td>"
		  		+ "<td>" + value.Preco +  "</td>";
  		
  	            +"</tr>"    
  	            
	        		$('#produtos').append(row);
  	          
	    });
	}


	function modal(id){

		
		  $('#RemoveId').val(id);
		  $("#ModalRemover").modal("show");
	}

	function remove (){
		//alert($('#RemoveId').val());
		
		window.location.href =  $('#RemoveId').val();
	}
	
	setInterval(function () {
   	 $('#msg').hide(); // show next div
   }, 5 * 1000); // do this every 10 seconds 
   
</script>
    



  
<%@include file="footer.jsp" %>