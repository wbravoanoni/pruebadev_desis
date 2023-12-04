<?php
// Archivo de busqueda de regiones en la BD

include('../sql/conexion_sql.php');

// Solo se consideran los activos, permitiendo solo mostrar algunas regiones
$sql = "SELECT idRegion,nombre FROM regiones WHERE activo = 1";
$resultados = mysqli_query($conexion,$sql);
$rows = array();
while($r = mysqli_fetch_array($resultados)) {
    $rows[] = $r;
}
echo json_encode($rows);
?>