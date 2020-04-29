<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EV3NT0S</title>
<spring:url value="/cliente/" var="cliente"></spring:url>
<spring:url value="/casadeshow/" var="casaDeShow"></spring:url>
<spring:url value="/evento/" var="evento"></spring:url>
<spring:url value="/detalhe/" var="detalhe"></spring:url>

<link rel="icon" type="image/x-icon"
	href="https://uploaddeimagens.com.br/images/002/618/853/full/LOGO.ico?1588120315" />
<script src="https://use.fontawesome.com/releases/v5.12.1/js/all.js"
	crossorigin="anonymous"></script>
<link href='<spring:url value="/resources/css/styles2.css" />'
	rel="stylesheet" />
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

</head>
<body>
	<!-- MENU DO SITE=============================================================================== -->
	<header class="masthead">
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#">EV3NT0S</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto my-2 my-lg-0">
						<li class="nav-item active"><a
							class="nav-link js-scroll-trigger" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${cliente}">Clientes</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${casaDeShow}">Casas De Show</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${evento}">Eventos</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- FIM DO MENU ================================================================================-->
	<!-- CORPO DO SITE============================================================================== -->
	<main>
	
		<div class="container mt-3">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">EVENTOS</h2>
				<h3 class="section-subheading text-muted">Garanta já o seu
					ingresso!</h3>
			</div>
			<div class="row mt-5">
				<div class="center">
					<div class="row">
						<c:forEach var="evento" items="${eventos}">
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card h100">
									<img class="img-thumbnail"
										src="data:image/jpge;base64,${evento.imagemEncoded }"
										alt="Imagem nao encontrada" />
									<div class="card-body">
										<h4 class="card-title">
											<a href="${detalhe}${evento.codigo}"><input type="hidden" name="oi"
											value="${evento.codigo}">${evento.nome}</a>
										</h4>
										<h5>R$ ${evento.preco}</h5>
										<h5>Ingressos restantes: ${evento.quant_ingresso}</h5>
										
									</div>
									<div class="card-footer"></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- FIM DO CORPO=============================================================================== -->

	<!-- RODAPE DO SITE============================================================================= -->
	<footer>
		<div class="container-fluid bg-danger">
			<div class="row align-items-center">
				<div class="col-lg-6 text-lg-left"
					style="color: #ffffff; font-family: Trebuchet MS;">Copyright
					© EV3NT0S 2020</div>
				<div class="col-lg-6 my-3 my-lg-0 text-right">
					<a class="btn btn-danger btn-social mx-2" href="#"><i
						class="fab fa-twitter"></i></a><a
						class="btn btn-danger btn-social mx-2" href="#"><i
						class="fab fa-facebook-f"></i></a><a
						class="btn btn-danger btn-social mx-2" href="#!"><i
						class="fab fa-linkedin-in"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- FIM DO RODAPE============================================================================== -->
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