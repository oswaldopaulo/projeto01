<%@include file="header.jsp" %>
<!-- Modal -->
<div class="modal fade" id="ModalRemover" tabindex="-1" role="dialog" aria-labelledby="ModalRemoverTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Confirma��o</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Confirma exclus�o do registro?
      </div>
      <div class="modal-footer">
      	<input type="hidden" name="RemoveId" id="RemoveId" value=""/>
        <button type="button" class="btn btn-primary" data-dismiss="modal">N�o</button>
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
    
    <h4>Altera��o</h4>
		<ul style="border-bottom: 1px solid;">
			<li> Usu�rios </li>
			<li> Produtos </li>
			<li> Categoria </li>
		
		
		</ul>
		
	   <h4>Relat�rio</h4>
		<ul>
			<li> Relat�rio 1 </li>
			<li> Relat�rio 2 </li>
			<li> Relat�rio 3 </li>
		
		
		</ul>
		 
		 
	  
	  </div>
	  
	  	<div class="col-md-10 detail-grid-col">
	  	
	  	
	  	 <div class="table-responsive">
		  	<table class="table table-sm">
		  	<tr>
		  		<th> # </th>
		  		<th> Id </th>
		  		<th> Produto </th>
		  		<th> Estoque </th>
		  		<th> Pre�o </th>
		  		
		  	</tr>
		  	
		  	 <tr>
		  		<td style="width: 50px; white-space: nowrap;"> 
		  			<a href="produto_editar.jsp"  title="Editar"><i class="fas fa-edit fa-fw"></i></a>
		  			<a href="#" onclick="modal('produto_remover.jsp')"  title="Remover"><i class="fas fa-trash-alt mr-1 red"></i></a>
		  		</td>
		  		<td> Id </td>
		  		<td> Produto </td>
		  		<td> Estoque </td>
		  		<td> Pre�o </td>
		  		
		  	</tr>
		  		
		  		
		  		
		  	
		  	
		  	</table>
		  </div>
		
	</div>

	  
  </div>
<script type="text/javascript">


	function modal(id){

		
		  $('#RemoveId').val(id);
		  $("#ModalRemover").modal("show");
	}

	function remove (){
		//alert($('#RemoveId').val());
		
		window.location.href =  $('#RemoveId').val();
	}
</script>
  
  
<%@include file="footer.jsp" %>