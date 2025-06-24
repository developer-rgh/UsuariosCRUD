<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi App</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="d-flex flex-column min-vh-100">
<%@ include file="jsp/components/header.jsp" %>

<div class="container mt-4" id="content">
    <%@ include file="jsp/home.jsp" %>
</div>

<%@ include file="jsp/components/footer.jsp" %>
<!-- Incluye el script.js que manejara las cargas dinámicas -->

</body>
</html>