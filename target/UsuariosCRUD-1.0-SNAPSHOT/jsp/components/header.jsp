<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
  <div class="container-fluid">
    <a class="navbar-brand nav-link" href="${pageContext.request.contextPath}/index.jsp" data-page="home">Mi App</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp" data-page="home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/usuarios" data-page="listaUsuarios">Usuarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-page="alumnos">Alumnos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-page="profesores">Profesores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-page="acerca">Acerca de</a>
        </li>
      </ul>
      <ul class="navbar-nav">
        <c:choose>
          <c:when test="${sessionScope.usuarioLogueado != null}">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/logout">Cerrar Sesión</a>
            </li>
          </c:when>
          <c:otherwise>
            <li class="nav-item">
              <a class="nav-link" href="#">Iniciar Sesión</a>
            </li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>
