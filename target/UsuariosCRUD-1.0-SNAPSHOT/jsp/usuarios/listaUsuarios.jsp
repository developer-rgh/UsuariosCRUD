<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Incluir Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJvZtPU5i7n4VfCw9R5b88jzS4z7b5e0gkp6l8zFfvz5F6l60r8DBsWwWrP5" crossorigin="anonymous">
<%@ include file="../components/header.jsp" %>
<div class="container mt-4">
    <h2 class="mb-4">Lista de Usuarios</h2>

    <!-- Botón de Nuevo Usuario -->
    <a class="btn btn-primary mb-4" href="jsp/usuarios/formularioUsuario.jsp">Nuevo Usuario</a>



    <!-- Tabla de Usuarios -->
    <table class="table table-striped table-bordered">
        <thead>
            <tr class="text-center">
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${usuarios}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.nombre}</td>
                    <td>${u.correo}</td>
                    <td class="text-center">
                        <a href="usuarios?action=editar&id=${u.id}" class="btn btn-warning btn-sm">
                            <i class="bi bi-pencil-square"></i> Editar
                        </a>
                        <a href="usuarios?action=eliminar&id=${u.id}" class="btn btn-danger btn-sm" onclick="return confirm('¿Eliminar?')">
                            <i class="bi bi-trash"></i> Eliminar
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%@ include file="../components/footer.jsp" %>
<!-- Incluir Bootstrap Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>

