<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Casas de Show</title>
<spring:url value="/casadeshow/deleta/" var="deleta"></spring:url>
<spring:url value="/casadeshow/salva/" var="salva"></spring:url>
<spring:url value="/casadeshow/alterar/" var="altera"></spring:url>
<spring:url value="/" var="home"></spring:url>
<spring:url value="./cliente/" var="cliente"></spring:url>
<spring:url value="./evento/" var="evento"></spring:url>


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

<link href='<spring:url value="/resources/css/styles3.css" />'
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
							href="#">Casas de Show</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${home}${evento}">Evento</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main>
		<div class="container">
			<form:form action="${salva}" modelAttribute="casaDeShow"
				cssClass="mb-2">

				<form:hidden path="codigo" />

				<div class="form-group">
					<label>Nome</label>
					<form:input path="nome" class="lg-6" cssClass="form-control" />
				</div>

				<div class="form-group">
					<label>Cep</label>
					<form:input path="cep" cssClass="form-control" />
				</div>

				<div class="form-=group">
					<label>Estado</label>
					<form:input path="uf" cssClass="form-control" />
				</div>
				
				<div class="form-=group">
					<label>Cidade</label>
					<form:input path="cidade" cssClass="form-control" />
				</div>

				<div class="form-=group">
					<label>Bairro</label>
					<form:input path="bairro" cssClass="form-control" />
				</div>

				<div class="form-=group">
					<label>Logradouro</label>
					<form:input path="logradouro" cssClass="form-control" />
				</div>

				<div class="form-=group">
					<label>Complemento</label>
					<form:input path="complemento" cssClass="form-control" />
				</div>
				
				<div class="form-=group">
					<label>Capacidade de Pessoas</label>
					<form:input path="capacidade" cssClass="form-control" />
				</div>

				<br />
				<input type="submit" class="btn btn-primary center" name="salva"
					value="${casaDeShow.codigo == 0 ? 'Cadastrar' : 'Alterar'}">
				<c:if test="${casaDeShow.codigo ne 0}">
					<input type="submit" class="btn btn-primary" name="cancela"
						value="Cancelar">
				</c:if>
			</form:form>
			<c:if test="${not empty casasDeShow}">
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Código</th>
							<th scope="col">Nome</th>
							<th scope="col">Cep</th>
							<th scope="col">Estado</th>
							<th scope="col">Cidade</th>
							<th scope="col">Bairro</th>
							<th scope="col">Logradouro</th>
							<th scope="col">Complemento</th>
							<th scope="col">Capacidade</th>
							<th scope="col" colspan="2">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="casaDeShow" items="${casasDeShow}">
							<tr>
								<td scope="row">${casaDeShow.codigo}</td>
								<td>${casaDeShow.nome}</td>
								<td>${casaDeShow.cep}</td>
								<td>${casaDeShow.uf}</td>
								<td>${casaDeShow.cidade}</td>
								<td>${casaDeShow.bairro}</td>
								<td>${casaDeShow.logradouro}</td>
								<td>${casaDeShow.complemento}</td>
								<td>${casaDeShow.capacidade}</td>
								<td><a href="${altera}${casaDeShow.codigo}"
									class="btn btn-warning">Alterar</a></td>
								<td><a href="${deleta}${casaDeShow.codigo}"
									class="btn btn-danger"
									onclick="return confirm('Deseja deletar esta casa de show?')">Deletar</a></td>
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