

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Registro"%>
<%if (session.getAttribute("lista") == null) {
        ArrayList<Registro> listaAux = new ArrayList<Registro>();

        session.setAttribute("lista", listaAux);
    }

    List<Registro> lista = (ArrayList<Registro>) session.getAttribute("lista");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listado de Inscritos</h1>
        <p><a href="MainServlet?action=nuevo">Nuevo</a> </p>
        <table border="1" cellspacing="0"> 
            <tr>
                <th>Id</th>
                <th>Fecha</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Turno</th>
                <th>Seminarios</th>
                <th></th>
                <th></th>

            </tr>
            <%
                for (Registro reg : lista) {
            %>
            <tr>
                <td><%= reg.getId() %></td>
                <td><%= reg.getFecha() %></td>
                <td><%= reg.getNombre() %></td>
                <td><%= reg.getApellidos() %></td>
                <td><%= reg.getTurno()%></td>
                <td><%= reg.getSeminarios() %></td>     
                <td><a href="MainServlet?action=editar&id=<%= reg.getId()%>">Editar</a></td>
                <td><a href="MainServlet?action=eliminar&id=<%= reg.getId()%>">Eliminar</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
