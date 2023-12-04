<?php

//Archivo principal que se encarga del guardado de guardar la informacion de los votantes y su voto

include('../sql/conexion_sql.php');

if($_POST){
    if($_POST['nombre'] && $_POST['alias'] && $_POST['rut'] && $_POST['email'] && $_POST['region'] && $_POST['comuna'] && $_POST['candidato']){

        $nombre         = ucwords(strtolower($_POST['nombre']));
        $alias          = strtolower($_POST['alias']);
        $rut            = strtolower($_POST['rut']);
        $email          = strtolower($_POST['email']);
        $region         = $_POST['region'];
        $comuna         = $_POST['comuna'];
        $candidato      = $_POST['candidato'];
        $como_se_entero = implode(', ',$_POST['como_se_entero']);


        if( existeRut($conexion,$rut) ){
            echo "el_rut_ya_se_encuentra_registrado";
            exit;
        }

        if( tamanioMinMax($nombre,3,100) == false){
            echo "EL nombre no cumple con el tamaño solicitado";
            exit;
        }

        if( tamanioMinMax($alias,5,100) == false){
            echo "EL alias no cumple con el tamaño solicitado";
            exit;
        }

        if( tamanioMinMax($rut,1,15) == false){
            echo "el_rut_no_cumple_con_el_tamano_solicitado";
            exit;
        }

        if( tamanioMinMax($email,5,100) == false ){
            echo "el_correo_no_cumple_con_el_tamano_solicitado";
            exit;
        }

        if( emailValido($email) == false){
            echo "el_correo_no_cumple_con_el_formato_solicitado";
            exit;
        }

        if( aliasValido($alias) == false){
            echo "el_alias_no_cumple_con_el_formato_solicitado";
            exit;
        }

        if( nombreValido($nombre) == false){
            echo "el_nombre_no_cumple_con_el_formato_solicitado";
            exit;
        }

        if( rutValido($rut) == false){
            echo "el_rut_no_cumple_con_el_formato_solicitado";
            exit;
        }

        //Preparar consultas para evitar injection SQL
        $stmt = $conexion->prepare("INSERT INTO votantes(nombre,alias,rut,email,region,comuna,comoSeEntero) VALUES (?, ?, ?, ?, ?, ?, ?);");
        $stmt->bind_param("sssssss", $nombre, $alias, $rut, $email, $region, $comuna, $como_se_entero);
        $stmt->execute();

        $idVotante = $conexion->insert_id;

        $stmt = $conexion->prepare("INSERT INTO voto(idVotante,idCandidato) VALUES (?, ?);");
        $stmt->bind_param("ss", $idVotante, $candidato);
        $stmt->execute();

        $stmt->close();

        echo "registro_insertado";
        exit;

    }else{
        echo 'Falta enviar uno de los campos obligatorios';
        exit;
    }
}else{
    echo 'No se han enviado datos al formulario';
    exit;
}


//Comprobar si el rut ya existe en ls bd para permitir el voto
function existeRut($conexion,$rut){
    $stmt = $conexion->prepare(" SELECT 1 FROM votantes WHERE rut = ? LIMIT 1");
    $stmt->bind_param("s", $rut);
    $stmt->execute();
    $stmt->store_result();
    $num_filas = $stmt->num_rows;
    $stmt->close();

    if( $num_filas>0 ){
        return true;
    }else{
        return false;
    }
}

function tamanioMinMax($campo,$min,$max){
    if( strlen($campo) >= $min &&  strlen($campo) <= $max ){
        return true;
    }else{
        return false;
    }
}

function emailValido($str){
    $matches = null;
    return (1 === preg_match('/^[A-z0-9\\._-]+@[A-z0-9][A-z0-9-]*(\\.[A-z0-9_-]+)*\\.([A-z]{2,6})$/', $str, $matches));
}

function aliasValido($str){
    $matches = null;
    return (1 === preg_match('/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/', $str, $matches));
}

function nombreValido($str){
    $matches = null;
    return (1 === preg_match('/^[a-zA-ZÀ-ÿñÑ]+(\s*[a-zA-ZÀ-ÿñÑ]*)*[a-zA-ZÀ-ÿñÑ]+$/u', $str, $matches));
}


function rutValido($rut) {

    if ((empty($rut)) || strlen($rut) < 3) {
        return array('error' => true, 'msj' => 'RUT vacío o con menos de 3 caracteres.');
    }

    $parteNumerica = str_replace(substr($rut, -2, 2), '', $rut);

    if (!preg_match("/^[0-9]*$/", $parteNumerica)) {
        //return array('error' => true, 'msj' => 'La parte numérica del RUT sólo debe contener números.');
        return false;
    }

    $guionYVerificador = substr($rut, -2, 2);
    if (strlen($guionYVerificador) != 2) {
        //return array('error' => true, 'msj' => 'Error en el largo del dígito verificador.');
        return false;
    }

    // obliga a que el dígito verificador tenga la forma -[0-9] o -[kK]
    if (!preg_match('/(^[-]{1}+[0-9kK]).{0}$/', $guionYVerificador)) {
        //return array('error' => true, 'msj' => 'El dígito verificador no cuenta con el patrón requerido');
        return false;
    }

    // Valida que sólo sean números, excepto el último dígito que pueda ser k
    if (!preg_match("/^[0-9.]+[-]?+[0-9kK]{1}/", $rut)) {
        //return array('error' => true, 'msj' => 'Error al digitar el RUT');
        return false;
    }

    $rutV = preg_replace('/[\.\-]/i', '', $rut);
    $dv = substr($rutV, -1);
    $numero = substr($rutV, 0, strlen($rutV) - 1);
    $i = 2;
    $suma = 0;
    foreach (array_reverse(str_split($numero)) as $v) {
        if ($i == 8) {
            $i = 2;
        }
        $suma += $v * $i;
        ++$i;
    }
    $dvr = 11 - ($suma % 11);
    if ($dvr == 11) {
        $dvr = 0;
    }
    if ($dvr == 10) {
        $dvr = 'K';
    }
    if ($dvr == strtoupper($dv)) {
        //return array('error' => false, 'msj' => 'RUT ingresado correctamente.');
        return true;
    } else {
        //return array('error' => true, 'msj' => 'El RUT ingresado no es válido.');
        return false;
    }
}



?>