/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unsij.controllers;

import com.unsij.beans.Usuario;
import com.unsij.services.UsuarioService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UsuarioController extends HttpServlet {

    private final UsuarioService service = new UsuarioService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Acción: " + action);
        if ("editar".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario u = service.obtenerPorId(id);
            request.setAttribute("usuario", u);
            request.getRequestDispatcher("/jsp/usuarios/formularioUsuario.jsp").forward(request, response);
        } else if ("eliminar".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.eliminar(id);
            //response.sendRedirect("usuarios");
            // Opción 1: Reenvía lista actualizada directamente
            request.setAttribute("usuarios", service.obtenerUsuarios());
            request.getRequestDispatcher("/jsp/usuarios/listaUsuarios.jsp").forward(request, response);
        } else {
            request.setAttribute("usuarios", service.obtenerUsuarios());
            request.getRequestDispatcher("/jsp/usuarios/listaUsuarios.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = request.getParameter("id") == null || request.getParameter("id").isEmpty() ? 0 : Integer.parseInt(request.getParameter("id"));
        System.out.println("Parametro ID: " + id);
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        System.out.println("Nombre: " + nombre);
        System.out.println("Correo: " + correo);
        
        Usuario u = new Usuario();
        u.setId(id);
        u.setNombre(nombre);
        u.setCorreo(correo);

        service.guardar(u);
        //response.sendRedirect("usuarios");
        // En lugar de redirigir, reenvía lista actualizada
        request.setAttribute("usuarios", service.obtenerUsuarios());
        request.getRequestDispatcher("/jsp/usuarios/listaUsuarios.jsp").forward(request, response);
    }
}
