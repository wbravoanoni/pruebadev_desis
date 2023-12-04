<?php
// Archivo de busqueda de candidatos en la BD

include('../sql/conexion_sql.php');

// Solo se consideran los activos, permitiendo solo mostrar algunos candidatos
$sql = "SELECT idCandidato,nombre FROM candidatos WHERE activo = 1";
$resultados = mysqli_query($conexion,$sql);
$rows = array();
while($r = mysqli_fetch_array($resultados)) {
    $rows[] = $r;
}
echo json_encode($rows);
?>