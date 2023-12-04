<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de votación</title>
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet"> 

    <style>
        .alerta-textos{
            color: red;
        }
    </style>

</head>

<body>

<div class="container">
    <h1 class="pt-5 text-center">Formulario de Votación</h1>
    <form id="formularioVotacion" action="./formulario_votacion/guardar_voto.php" method="POST">
        <div class="row">
            <div class="col-sm-6">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control pt-2" id="nombre" name="nombre" placeholder="Ingrese su nombre completo">
                    <div id="alerta_nombre" class="d-none">
                        <p id="texto_nombre" class="alerta-textos"></p>
                    </div>
            </div>

            <div class="col-sm-6">
                <label for="alias" class="form-label">Alias</label>
                <input type="text" class="form-control pt-2" id="alias" name="alias" placeholder="Ingrese un alias">
                    <div id="alerta_alias" class="d-none">
                        <p id="texto_alias" class="alerta-textos"></p>
                    </div>
            </div>

            <div class="col-sm-6">
                <label for="rut" class="form-label">Rut</label>
                <input type="text" class="form-control pt-2" id="rut" name="rut" placeholder="111111111-1">
                    <div id="alerta_rut" class="d-none">
                        <p id="texto_rut" class="alerta-textos"></p>
                    </div>
            </div>

            <div class="col-sm-6">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control pt-2" id="email" name="email" placeholder="Ingrese su correo" value="">
                    <div id="alerta_correo" class="d-none">
                        <p id="texto_correo" class="alerta-textos"></p>
                    </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                <label for="region">Región</label>
                    <select class="form-control pt-2" id="region" name="region">
                    </select>
                    <div id="alerta_region" class="d-none">
                        <p id="texto_region" class="alerta-textos"></p>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                <label for="comuna">Comuna</label>
                    <select class="form-control pt-2" id="comuna" name="comuna">
                    </select>
                    <div id="alerta_comuna" class="d-none">
                        <p id="texto_comuna" class="alerta-textos"></p>
                    </div>
                </div>
            </div>

            <div class="offset-6 col-sm-6">
                <div class="form-group">
                <label for="candidato">Candidato</label>
                    <select class="form-control pt-2" id="candidato" name="candidato">
                    </select>
                    <div id="alerta_candidato" class="d-none">
                        <p id="texto_candidato" class="alerta-textos"></p>
                    </div>
                </div>
            </div>

            <div class="col-sm-12">
            <div class="form-group">
                <label class="pt-3 px-2">Como se enteró de Nosotros</label>

                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="id_web" value="Web" name="como_se_entero[]">
                    <label class="form-check-label" for="id_web">Web</label>
                </div>

                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="id_tv" value="TV" name="como_se_entero[]">
                    <label class="form-check-label" for="id_tv">TV</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="id_redes" value="Redes Sociales" name="como_se_entero[]">
                    <label class="form-check-label" for="id_redes">Redes Sociales</label>
                </div>

                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="id_entero" value="Amigo" name="como_se_entero[]">
                    <label class="form-check-label" for="id_entero">Amigo</label>
                </div>

                <div id="alerta_entero" class="d-none">
                    <p id="texto_entero" class="alerta-textos">* Seleccione al menos 2 opciones</p>
                </div>
            </div>
            </div>
        </div>

        <button class="btn btn-success btn-lg">Votar</button>
    </form>

    <!-- Button trigger modal -->
    <button id="btn-modal-cambio" type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 id="text-modal-titulo" class="modal-title text-center">Cambio Realizado</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <p  id="text-modal" class="text-center"></p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        </div>
        </div>
    </div>
    </div>



</div>
    <script src="./assets/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/jquery-3.7.1.min.js"></script>
    <script src="./assets/js/formulario.js"></script>
</body>

</html>