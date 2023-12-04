<?php
// Archivo de busqueda de comunas en la BD -> depende de las regiones ("get_regiones")

include('../sql/conexion_sql.php');

// Solo se consideran los activos, permitiendo solo mostrar algunas comunas
if($_POST){
    if($_POST['idRegion']){
        $idRegion = $_POST['idRegion'];
        $sql = "SELECT idComuna,nombre FROM comunas WHERE activo = 1 and id_Region = {$idRegion} ORDER BY nombre ASC";
        $resultados = mysqli_query($conexion,$sql);
        $rows = array();
        while($r = mysqli_fetch_array($resultados)) {
            $rows[] = $r;
        }
        echo json_encode($rows);
    }
}

?>