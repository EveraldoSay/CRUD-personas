<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Listar Personas</title>
    </head>
    <body>
        <div class="container">
            <h1>Personas</h1>
            <a class="btn btn-success" href="Controlador?accion=add">Agregar Nuevo</a>
            <br><br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">DNI</th>
                        <th class="text-center">NOMBRES</th>
                        <th class="text-center">ESTADO</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        PersonaDAO dao = new PersonaDAO();
                        List<Persona> list = dao.listar();
                        Iterator<Persona> iter = list.iterator();
                        Persona per = null;
                        while (iter.hasNext()) {
                            per = iter.next();
                    %>
                    <tr>
                        <td class="text-center"><%= per.getId() %></td>
                        <td class="text-center"><%= per.getDni() %></td>
                        <td><%= per.getNom() %></td>
                        <td class="text-center"><%= per.getEstado() == 1 ? "Activo" : "Inactivo" %></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= per.getId() %>">Editar</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= per.getId() %>">Eliminar</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
