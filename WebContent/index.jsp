<%@include file="header.jsp" %>
<!-- Aqui começa o banner carrocel -->

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>Example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>One more for good measure.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <!-- Aqui termina o banner carrocel -->
  
   <!--  Produtos começa aqui -->
   <div class="row mb-4" id="produtos" style="margin-left: 10px; margin-top: 0; margin-right: 10px">
   
		<!-- loop -->   
	    
	  
	  <!-- fim do loop -->
	  
	  

	  
  </div>
  <!-- Produtos termina aqui -->
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
	            
	        var row = "<div class=\"col-md-3 themed-grid-col\">"
					    + "<a href=\"details.jsp?id=" + value.ID + "\">"
						+	"<img src=\"img/img.jpg\" alt=\"figura produto\"></a>"
					    + "<div>"
					
						+	"<h3><a href=\"details.jsp?id=" + value.ID + "\">" + value.Descricao + "</a></h3>"
					
						+	"<span>R$ " + value.Preco +  "</span>"
					
						+ "</div></div>";
	   
  	            
	        		$('#produtos').append(row);
  	          
	    });
	}
	</script>
  
  
<%@include file="footer.jsp" %>