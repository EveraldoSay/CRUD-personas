<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Persona</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
              <%
                PersonaDAO dao = new PersonaDAO();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Persona p = dao.list(id);
                %>
                <h1>Modificar Persona</h1>
                <form action="Controlador" method="post">
                    DNI:<br>
                    <input class="form-control" type="text" name="txtDni" value="<%= p.getDni() %>" required><br>
                    Nombres:<br>
                    <input class="form-control" type="text" name="txtNom" value="<%= p.getNom() %>" required><br>
                    Estado:<br>
                    <select class="form-control" name="txtEstado">
                        <option value="1" <%= p.getEstado() == 1 ? "selected" : "" %>>Activo</option>
                        <option value="0" <%= p.getEstado() == 0 ? "selected" : "" %>>Inactivo</option>
                    </select><br>
                    <input type="hidden" name="txtid" value="<%= p.getId() %>">
                    <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                    <a href="Controlador?accion=listar">Regresar</a>
                </form>
          </div>
        </div>
    </body>
</html>
