<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Persona</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Persona</h1>
                <form action="Controlador" method="post">
                    DNI:<br>
                    <input class="form-control" type="text" name="txtDni" required><br>
                    Nombres:<br>
                    <input class="form-control" type="text" name="txtNom" required><br>
                    Estado:<br>
                    <select class="form-control" name="txtEstado">
                        <option value="1">Activo</option>
                        <option value="0">Inactivo</option>
                    </select><br>
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="Controlador?accion=listar">Regresar</a>
                </form>
            </div>
        </div>
    </body>
</html>
