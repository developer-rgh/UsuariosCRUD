<%@ page contentType="text/html;charset=UTF-8" %>

<div class="container mb-4">
    <h2 class="text-center mb-2">App CRUD Usuarios</h2>

    <!-- Bootstrap Carousel -->
    <div id="carouselHome" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner rounded shadow">
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/assets/images/01.jpg" class="d-block w-100" alt="Imagen 1">
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/assets/images/02.jpg" class="d-block w-100" alt="Imagen 2">
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/assets/images/03.jpg" class="d-block w-100" alt="Imagen 3">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselHome" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselHome" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
</div>
