<?php

define('HOST','localhost');
define('USER','root');
define('PASSWORD','');
define('DB','formulario_votacion');

$conexion = mysqli_connect(HOST,USER,PASSWORD,DB);

if($conexion->connect_errno){
    echo $conexion->connect_errno;
}


?>