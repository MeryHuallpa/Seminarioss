package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "view";
        switch (action) {
            case "view":
                response.sendRedirect("index.jsp");
                break;

            case "nuevo":
                Registro c = new Registro();
                request.setAttribute("Registro", c);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));

                HttpSession sesion = request.getSession();
                List<Registro> lista = (ArrayList<Registro>) sesion.getAttribute("lista");

                Registro editCal = new Registro();
                for (Registro item : lista) {
                    if (item.getId() == idEditar) {
                        editCal = item;
                        break;
                    }
                }
                request.setAttribute("Registro", editCal);
                request.getRequestDispatcher("edit.jsp").forward(request, response);

                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                HttpSession sesion1 = request.getSession();
                List<Registro> lista1 = (ArrayList<Registro>) sesion1.getAttribute("lista");

                for (Registro item : lista1) {
                    if (item.getId() == idEliminar) {
                        lista1.remove(item);
                        break;
                    }
                }
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombre");
       String apellidos = request.getParameter("apellidos");
        String turno = request.getParameter("turno");
         // Procesar los seminarios seleccionados
    String[] seminariosSeleccionados = request.getParameterValues("curso");
    StringBuilder seminarios = new StringBuilder();
    if (seminariosSeleccionados != null) {
        for (String seminario : seminariosSeleccionados) {
            seminarios.append(seminario).append(",");
        }
    }
    
    if (seminarios.length() > 0) {
        seminarios.setLength(seminarios.length() - 1);
    }

        HttpSession ses = request.getSession();

        List<Registro> lista = (ArrayList<Registro>) ses.getAttribute("lista");

        if (id == 0) {
            //Nuevo Registro
            Registro c = new Registro();

            int idNuevo = obtenerNuevoId(lista);
            c.setId(idNuevo);
            c.setFecha(fecha);
            c.setNombre(nombre);
            c.setApellidos(apellidos);
            c.setTurno(turno);
            c.setSeminarios(seminarios.toString());
       
            lista.add(c);

        } else {
            for (Registro item : lista) {
                if (item.getId() == id) {
                    item.setFecha(fecha);
                    item.setNombre(nombre);
                    item.setApellidos(apellidos);
                    item.setTurno(turno);
                     item.setSeminarios(seminarios.toString());
                    
                    break;
                }
            }
        }

        response.sendRedirect("index.jsp");

    }

    private int obtenerNuevoId(List<Registro> lista) {
        int nuevoId = 1;
        for (Registro item : lista) {
            if (item.getId() >= nuevoId) {
                nuevoId = item.getId() + 1;
            }
        }
        return nuevoId;

    }
}
