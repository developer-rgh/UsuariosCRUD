<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="usuario" class="com.unsij.beans.Usuario" scope="request"/>
<html>
<head>
    <title>Formulario Usuario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css" />
</head>
<body>
    <%@ include file="../components/header.jsp" %>
    <h2>${usuario.id > 0 ? "Editar" : "Nuevo"} Usuario</h2>
    <form method="post" action="${pageContext.request.contextPath}/usuarios">
        <input type="hidden" name="id" value="${usuario.id}" />
        Nombre: <input type="text" name="nombre" value="${usuario.nombre}" required />
        Correo: <input type="text" name="correo" value="${usuario.correo}" required />
        <input type="submit" value="${usuario.id > 0 ? 'Actualizar' : 'Guardar'}" />

    </form>
    <%@ include file="../components/footer.jsp" %>
</body>
</html>
