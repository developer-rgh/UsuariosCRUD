/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unsij.services;

import com.unsij.dao.UsuarioDAO;
import com.unsij.beans.Usuario;

import java.util.List;

public class UsuarioService {
    private final UsuarioDAO dao = new UsuarioDAO();

    public List<Usuario> obtenerUsuarios() {
        return dao.listar();
    }

    public Usuario obtenerPorId(int id) {
        return dao.buscarPorId(id);
    }

    public void guardar(Usuario u) {
        if (u.getId() > 0) {
            dao.actualizar(u);
        } else {
            dao.insertar(u);
        }
    }

    public void eliminar(int id) {
        dao.eliminar(id);
    }
}
