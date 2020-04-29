<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Eventos</title>
<spring:url value="/evento/deleta/" var="deleta"></spring:url>
<spring:url value="/evento/salva/" var="salva"></spring:url>
<spring:url value="/evento/alterar/" var="altera"></spring:url>
<spring:url value="/" var="home"></spring:url>
<spring:url value="./cliente/" var="cliente"></spring:url>
<spring:url value="./casadeshow/" var="casadeshow"></spring:url>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css"
	rel="stylesheet" />

<link href='<spring:url value="/resources/css/styles4.css" />'
	rel="stylesheet" />
<!-- FIM DO BOOTSTRAP ================================================================-->

</head>
<body>
	<header class="masthead">
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#page-top">EV3NT0S</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto my-2 my-lg-0">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${home}">Home</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${home}${cliente}">Clientes</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${home}${casadeshow}">Casas de Show</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="#">Eventos</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main>
		<div class="container">
			<form:form action="${salva}" enctype="multipart/form-data"
				modelAttribute="evento" cssClass="mb-2">

				<form:hidden path="codigo" />
				<form:hidden path="imagemProd" />


				<div class="form-group">
					<label>Nome</label>
					<form:input path="nome" cssClass="form-control" />
				</div>

				<div class="form-group">
					<label>Descricao</label>
					<form:input path="descricao" cssClass="form-control" />
				</div>

				<div class="form-=group">
					<label>Data e hora </label>
					<form:input path="data" type="datetime-local"
						cssClass="form-control" placeholder="Ex: XX/XX/XXXX XX:XX" />
				</div>

				<div class="form-=group">
					<label>Preço do Ingresso</label>
					<form:input path="preco" cssClass="form-control" />
				</div>

				<div class="form-=group">
					<label>Quantidade de ingresso disponível</label>
					<form:input path="quant_ingresso" cssClass="form-control" />
				</div>

				<div class="form-=group">
					<label>Imagem</label>
					<div class="custom-file">
						<input type="file" name="imagem" class="custom-file-input"
							value="${evento.imagemEncoded }" /> <label
							class="custom-file-label">Escolha uma imagem</label>
					</div>
				</div>

				<div class="form-group">
					<label for="casaDeShow">Casa de Show:</label> <select
						class="custom-select" name="casaDeShowID" id="casaDeShow" required>
						<c:forEach var="casaDeShow" items="${casasDeShow}">
							<option value="${casaDeShow.codigo}"
								${casaDeShow.codigo == evento.casaDeShow.codigo? 'selected': ''}>${casaDeShow.nome}</option>
						</c:forEach>
					</select>
				</div>

				<c:if test="${evento.codigo ne 0}">
					<div class="mb-5">
						<img class="img-thumbnail"
							src="data:image/jpge;base64,${evento.imagemEncoded }"
							alt="Imagem nao encontrada" />
					</div>
				</c:if>

				<br />
				<input type="submit" class="btn btn-primary center" name="salva"
					value="${evento.codigo == 0 ? 'Cadastrar' : 'Alterar'}">

				<c:if test="${evento.codigo ne 0}">
					<input type="submit" class="btn btn-primary" name="cancela"
						value="Cancelar">
				</c:if>

			</form:form>
			<c:if test="${not empty eventos}">
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Código</th>
							<th scope="col">Nome</th>
							<th scope="col">Descrição</th>
							<th scope="col">Data</th>
							<th scope="col">Ingresso R$</th>
							<th scope="col">Quantidade de Ingresso</th>
							<th scope="col">Casa De Show</th>
							<th scope="col" colspan="2">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="evento" items="${eventos}">
							<tr>
								<td scope="row">${evento.codigo}</td>
								<td>${evento.nome}</td>
								<td>${evento.descricao}</td>
								<td>${evento.data}</td>
								<td>${evento.preco}</td>
								<td>${evento.quant_ingresso}</td>
								<td>${evento.casaDeShow.nome}</td>
								<td><a href="${altera}${evento.codigo}"
									class="btn btn-warning">Alterar</a></td>
								<td><a href="${deleta}${evento.codigo}"
									class="btn btn-danger"
									onclick="return confirm('Deseja deletar este evento?')">Deletar</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</c:if>
		</div>
	</main>
	<!-- FIM DO CORPO -->
	<!-- COMEÇO DO RODAPE -->
	<footer> </footer>
	<!-- FIM DO RODAPE -->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
	<!-- Core theme JS-->
	<script src='<spring:url value="/resources/js/scripts.js" />'>
		
	</script>
	<script src='<spring:url value="/resources/js/main.js" />'>
		
	</script>
</body>
</html>