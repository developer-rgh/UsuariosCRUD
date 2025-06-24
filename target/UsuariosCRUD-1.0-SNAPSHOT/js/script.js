// Obtener el contextPath dinámicamente desde JavaScript
/*const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
 
 window.onload = () => {
 asignarEventos();
 loadPage('home'); // Cargar home.jsp por defecto
 };
 
 function asignarEventos() {
 // Obtener todos los enlaces del menú
 document.querySelectorAll('[data-page]').forEach(link => {
 link.addEventListener('click', function (event) {
 event.preventDefault(); // Evita recargar la página
 const page = this.getAttribute('data-page');
 loadPage(page); // Cargar página seleccionada
 });
 });
 }
 
 function loadPage(page) {
 // Mapear cada página a su archivo .jsp o servlet
 const pages = {
 home: `${contextPath}/jsp/home.jsp`, // Cargar home.jsp
 listaUsuarios: `${contextPath}/usuarios`, // Llamar al servlet /usuarios
 nuevoUsuario: `${contextPath}/jsp/usuarios/formularioUsuario.jsp`,
 alumnos: `${contextPath}/jsp/alumnos.jsp`, // Cargar alumnos.jsp
 acerca: `${contextPath}/jsp/acerca.jsp`  // Cargar acerca.jsp
 };
 const pageUrl = pages[page];
 console.log("PAGE URL: ", pageUrl);  // Imprimir la URL de la página para depuración
 
 // Realizar la solicitud al servlet o archivo JSP
 fetch(pageUrl)
 .then(response => {
 if (!response.ok)
 throw new Error(`Error HTTP ${response.status}`);
 return response.text();
 })
 .then(html => {
 document.getElementById('content').innerHTML = html; // Cargar contenido
 asignarEventos(); // <- Reasignar eventos a los nuevos elementos
 })
 .catch(error => {
 console.error("Error al cargar la página:", error);
 document.getElementById('content').innerHTML = `<p class="text-danger">No se pudo cargar la página solicitada.</p>`;
 });
 }*/

// Obtener el contextPath dinámicamente desde JavaScript
const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));

// Mapeo de rutas por página
const pages = {
    home: `${contextPath}/jsp/home.jsp`,
    listaUsuarios: `${contextPath}/usuarios`, // Servlet
    nuevoUsuario: `${contextPath}/usuarios?action=nuevo`,
    listaProfesores: `${contextPath}/profesores`, // Servlet
    nuevoProfesor: `${contextPath}/jsp/profesores/formularioProfesor.jsp`,
    alumnos: `${contextPath}/jsp/alumnos.jsp`,
    acerca: `${contextPath}/jsp/acerca.jsp`
};

// Se ejecuta al cargar la página
window.onload = () => {
    asignarEventosGlobales();
    loadPage('home'); // Cargar home.jsp por defecto
};

// Asignar eventos a elementos con data-page
function asignarEventosGlobales() {
    document.querySelectorAll('[data-page]').forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            const page = this.getAttribute('data-page');
            loadPage(page);
        });
    });
}

// Cargar una página en el div #content
function loadPage(page) {
    const pageUrl = pages[page];
    console.log("Cargando: ", pageUrl);

    fetch(pageUrl)
            .then(response => {
                if (!response.ok)
                    throw new Error(`Error HTTP ${response.status}`);
                return response.text();
            })
            .then(html => {
                document.getElementById('content').innerHTML = html;
                // Reasignar eventos después de cargar contenido dinámico
                asignarEventosGlobales();
                asignarEventosFormularios();
            })
            .catch(error => {
                console.error("Error al cargar la página:", error);
                document.getElementById('content').innerHTML =
                        `<p class="text-danger">No se pudo cargar la página solicitada.</p>`;
            });
}

// Manejo de formularios de distintos módulos
function asignarEventosFormularios() {

    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function (e) {
            e.preventDefault(); // Evitar comportamiento por defecto
            console.log("ASIGNAR EVENTOS FORMULARIO.");
            const formData = new FormData(form);
            const params = new URLSearchParams();
            
            formData.forEach((value, key) => {
                console.log(key, value);
                params.append(key, value);
            });


            const action = form.getAttribute('action');
            console.log("ACTION: ", action);
            fetch(action, {
                method: 'POST',
                body: params
            })
                    .then(response => {
                        if (!response.ok)
                            throw new Error(`Error HTTP ${response.status}`);
                        return response.text();
                    })
                    .then(html => {
                        document.getElementById('content').innerHTML = html;
                        // Reasignar eventos después de actualización
                        asignarEventosGlobales();
                        asignarEventosFormularios();
                    })
                    .catch(error => {
                        console.error("Error al enviar el formulario:", error);
                        alert("Hubo un error al guardar.");
                    });
        });
    });
}

