<%@page import="com.emergentes.Registro"%>
<%
    Registro reg = (Registro) request.getAttribute("Registro");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registro en Seminarios</h1>


        <form action="MainServlet" method="post">

            <input type="hidden" name="id" value="<%= reg.getId()%>">

            <table border="0">

                <tr>
                    <td>Fecha</td>
                    <td>
                        <input type="date" name="fecha" value="<%= reg.getFecha()%>">
                    </td>
                </tr>

                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<%= reg.getNombre()%>"></td>
                </tr>
                <tr>
                    <td>Apellidos</td>
                    <td><input type="text" name="apellidos" value="<%= reg.getApellidos()%>"></td>
                </tr>


                <tr>
                    <td>Turno</td>
                    <td>
                        <input type="radio" name="turno" value="Mañana" <%= (reg.getTurno().equals("Mañana")) ? "checked" : ""%>> Mañana
                        <input type="radio" name="turno" value="Tarde" <%= (reg.getTurno().equals("Tarde")) ? "checked" : ""%>> Tarde
                        <input type="radio" name="turno" value="Noche" <%= (reg.getTurno().equals("Noche")) ? "checked" : ""%>> Noche
                    </td>
                </tr>

                <tr>
                    <td>Seminarios</td>
                    <td>
                        <br>
                        <input type="checkbox" id="curso1" name="curso" value="Inteligencia Artificial" <%= (reg.getSeminarios() != null && reg.getSeminarios().contains("Inteligencia Artificial ")) ? "checked" : ""%>>
                        <label for="curso1">Inteligencia Artificial </label><br>

                        <input type="checkbox" id="curso2" name="curso" value="Machine Learning" <%= (reg.getSeminarios() != null && reg.getSeminarios().contains("Machine Learning ")) ? "checked" : ""%>>
                        <label for="curso2">Machine Learning </label><br>

                        <input type="checkbox" id="curso3" name="curso" value="Simulacion con Acer" <%= (reg.getSeminarios() != null && reg.getSeminarios().contains("Simulacion con Acer ")) ? "checked" : ""%>>
                        <label for="curso3">Simulacion con Acer </label><br>

                        <input type="checkbox" id="curso4" name="curso" value="Robotica Educativa" <%= (reg.getSeminarios() != null && reg.getSeminarios().contains("Robotica Educativa ")) ? "checked" : ""%>>
                        <label for="curso4">Robotica Educativa </label><br>


                    </td>
                </tr>


                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar Registro"></td>
                </tr>

            </table>
        </form>

    </body>
</html>