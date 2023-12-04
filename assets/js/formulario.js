$( document ).ready( function(){
    get_usuarios();
    get_region();


    const menuRegion = document.querySelector("#region");
    menuRegion.addEventListener('change',(e)=>get_comuna(e.target.value));
})

const base_url = 'http://127.0.0.1/pruebadev_desis/';

function get_usuarios(){
	$('#candidato').html('');
	$('#candidato').append('<option value="0" selected>Seleccione un Candidato</option>');
	$.post( base_url+'formulario_votacion/get_candidatos.php',
		{},
		function(data){
			if(data){
				var c = JSON.parse(data);
					$.each(c,function(i,item){
                        $('#candidato').append('<option value='+item.idCandidato+'>'+item.nombre+'</option>');
					});
			}	
	});
}

function get_region(){
	$('#region').html('');
	$('#region').append('<option value="0" selected>Seleccione una Región</option>');
	$.post( base_url+'formulario_votacion/get_regiones.php',
		{},
		function(data){
			if(data){
				var c = JSON.parse(data);
					$.each(c,function(i,item){
                        $('#region').append('<option value='+item.idRegion+'>'+item.nombre+'</option>');
					});
			}	
	});
}

function get_comuna(idRegion){
	$('#comuna').html('');
	$('#comuna').append('<option value="0" selected>Seleccione una Comuna</option>');
	$.post( base_url+'formulario_votacion/get_comunas.php',
		{idRegion:idRegion},
		function(data){
			if(data){
				var c = JSON.parse(data);
					$.each(c,function(i,item){
                        $('#comuna').append('<option value='+item.idComuna+'>'+item.nombre+'</option>');
					});
			}	
	});
}

function validarRut() {
	let rut = $('#rut').val();

    // Verificar el formato del RUT
    if (!/^[0-9]+-[0-9kK]{1}$/.test(rut)) {
        return false;
    }

    // Separar el número y el dígito verificador
    const [numero, digitoVerificador] = rut.split('-');

    // Calcular el dígito verificador esperado
    let suma = 0;
    let multiplicador = 2;

    for (let i = numero.length - 1; i >= 0; i--) {
        suma += parseInt(numero.charAt(i)) * multiplicador;

        multiplicador = multiplicador === 7 ? 2 : multiplicador + 1;
    }

    const resto = suma % 11;
    const digitoCalculado = 11 - resto;

    // Manejar caso especial del dígito verificador 10
    const digitoVerificadorCalculado = digitoCalculado === 11 ? '0' : digitoCalculado === 10 ? 'K' : digitoCalculado.toString();

    // Comparar el dígito verificador calculado con el proporcionado (ignorando mayúsculas/minúsculas)
    return digitoVerificador.toUpperCase() === digitoVerificadorCalculado.toUpperCase();
}

function validarFormularioCliente(){
    let var1L             =  $('#nombre').val().length;
	let var1     		  = $('#nombre').val();
	let llaveTexto_var1L  = '#texto_nombre';
	let llaveAlerta_var1L = '#alerta_nombre';
	let exp_var1          = /^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/g;

    if( var1L>=3 && var1L<=100 ){
		$(llaveAlerta_var1L).css("display","none");
    }else{
		$(llaveTexto_var1L).html("");
        $(llaveTexto_var1L).html("* El nombre debe tener entre 3 y 100 carácteres");
		$(llaveAlerta_var1L).removeClass("d-none");
        $(llaveAlerta_var1L).css("display","block");
		return false;
    }

	if(!exp_var1.test(var1)){
        $(llaveTexto_var1L).html("* El nombre no tiene el formato solicitado, solo se permiten letras");
		$(llaveAlerta_var1L).removeClass("d-none");
        $(llaveAlerta_var1L).css("display","block");
        return false;
    }

	
    //===================

    let var2L    = $('#rut').val().length;
    let var2     = $('#rut').val();
    let exp_var2 = /[0-9Kk-]{9,12}$/;
	let llaveTexto_var2L  = '#texto_rut';
	let llaveAlerta_var2L = '#alerta_rut';

    if( var2L>=3 && var2L<=15 ){
		$(llaveAlerta_var2L).css("display","none");
        $(llaveTexto_var2L).html("");
    }else{
		$(llaveTexto_var2L).html("* El rut debe tener entre 3 y 15 caracteres");
		$(llaveAlerta_var2L).removeClass("d-none");
        $(llaveAlerta_var2L).css("display","block");
		return false;
    }

    if(!exp_var2.test(var2)){
        $(llaveTexto_var2L).html("* El rut no tiene el formato solicitado");
		$(llaveAlerta_var2L).removeClass("d-none");
        $(llaveAlerta_var2L).css("display","block");
        return false;
    }

    //===================

    let var3L    = $('#alias').val().length;
    let var3     = $('#alias').val();
    let exp_var3 = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
	let llaveTexto_var3L  = '#texto_alias';
	let llaveAlerta_var3L = '#alerta_alias';

   if( var3L>=5 && var3L<=100 ){
		$(llaveAlerta_var3L).css("display","none");
		$(llaveTexto_var3L).html("");
    }else{
		$(llaveTexto_var3L).html("* El alias debe tener entre 5 y 100 carácteres, y minimo tener una letra y un número");
		$(llaveAlerta_var3L).removeClass("d-none");
        $(llaveAlerta_var3L).css("display","block");
        return false;
    }

    if(!exp_var3.test(var3)){
        $(llaveTexto_var3L).html("* El alias necesita minimo una letras y número");
		$(llaveAlerta_var3L).removeClass("d-none");
        $(llaveAlerta_var3L).css("display","block");
        return false;
    }


	let var4L    = $('#email').val().length;
    let var4     = $('#email').val();
    let exp_var4 = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
	let llaveTexto_var4L  = '#texto_correo';
	let llaveAlerta_var4L = '#alerta_correo';

   if( var4L>=5 && var4L<=100 ){
		$(llaveAlerta_var4L).css("display","none");
		$(llaveTexto_var4L).html("");
    }else{
		$(llaveTexto_var4L).html("* El correo debe tener entre 5 y 100 carácteres");
		$(llaveAlerta_var4L).removeClass("d-none");
        $(llaveAlerta_var4L).css("display","block");
        return false;
    }

    if(!exp_var4.test(var4)){
        $(llaveTexto_var4L).html("* El correo no tiene el formato solicitado");
		$(llaveAlerta_var4L).removeClass("d-none");
        $(llaveAlerta_var4L).css("display","block");
        return false;
    }

	if($("#region").val() === '0'){
		$("#texto_region").html("* Seleccione una Región");
		$("#alerta_region").removeClass("d-none");
        $("#alerta_region").css("display","block");
		return false;
	}else{
		$("#alerta_region").css("display","none");
	}

	if($("#comuna").val() === null || $("#comuna").val() ==='0'){
		$("#texto_comuna").html("* Seleccione una Comuna");
		$("#alerta_comuna").removeClass("d-none");
        $("#alerta_comuna").css("display","block");
		return false;
	}else{
		$("#alerta_comuna").css("display","none");
	}

	if($("#candidato").val() === '0'){
		$("#texto_candidato").html("* Seleccione un candidato");
		$("#alerta_candidato").removeClass("d-none");
        $("#alerta_candidato").css("display","block");
		return false;
	}else{
		$("#alerta_candidato").css("display","none");
	}

	if( $("input[type=checkbox]:checked").length >=2){
		$("#alerta_entero").css("display","none");
	}else{
		$("#texto_entero").html("* Seleccione por lo menos 2 opciones");
		$("#alerta_entero").removeClass("d-none");
        $("#alerta_entero").css("display","block");
		return false;
	}

	if( validarRut() == true ){
		$(llaveAlerta_var2L).css("display","none");
        $(llaveTexto_var2L).html("");
	}else{
		$(llaveTexto_var2L).html("* El rut debe tener el siguien formato '11111111-1' sin puntos ");
		$(llaveAlerta_var2L).removeClass("d-none");
        $(llaveAlerta_var2L).css("display","block");
		return false;
	}

    return true;
}

$("#formularioVotacion").submit(function(event){
    event.preventDefault();
    if( validarFormularioCliente()==true){
    $.ajax({
        beforeSend:function(){
        },
            url:$("#formularioVotacion").attr("action"),
            type:$("#formularioVotacion").attr("method"),
            data:$("#formularioVotacion").serialize(),
            success:function(respuesta)
        {

            if(respuesta=="registro_insertado"){
				$('#btn-modal-cambio').click();
                $("#text-modal-titulo").html("Advertencia");
                $("#text-modal").html("Voto Ingresado corrrectamente");
				$("#nombre").val("");
				$("#alias").val("");
				$("#rut").val("");
				$("#email").val("");
				$("#region").prop("selectedIndex", 0);
				$("#comuna").prop("selectedIndex", 0);
				$("#candidato").prop("selectedIndex", 0);
				$("#alerta_nombre").css("display","none");
				$("#alerta_rut").css("display","none");
				$("#alerta_alias").css("display","none");
				$("#alerta_correo").css("display","none");
				$("#alerta_entero").css("display","none");
				$("input[type=checkbox]:checked").prop("checked", false);  
            }else if(respuesta=="el_rut_ya_se_encuentra_registrado"){
				$('#btn-modal-cambio').click();
				$("#text-modal-titulo").html("Advertencia");
				$("#text-modal").html("Este rut ya voto, intente con otro");
            }else if(respuesta=="el_rut_no_cumple_con_el_tamano_solicitado"){
				$('#btn-modal-cambio').click();
				$("#text-modal-titulo").html("Advertencia");
				$("#text-modal").html("Este rut no cumple con el tamaño solicitado");
			}else if( respuesta=="el_correo_no_cumple_con_el_tamano_solicitado"){
				$('#btn-modal-cambio').click();
				$("#text-modal-titulo").html("Advertencia");
				$("#text-modal").html("Este correo no cumple con el tamaño solicitado");
			}else if( respuesta=="el_rut_no_cumple_con_el_formato_solicitado"){
				$('#btn-modal-cambio').click();
				$("#text-modal-titulo").html("Advertencia");
				$("#text-modal").html("EL rut no cumple con el formato solicitado o no es valido, el formato es 11111111-1 sin puntos");
			}else if( respuesta=="el_alias_no_cumple_con_el_formato_solicitado"){
				$('#btn-modal-cambio').click();
				$("#text-modal-titulo").html("Advertencia");
				$("#text-modal").html("El alias no cumple con el tamaño solicitado, debe contener mínimo una letra, un número y ser mayor a 5 caracteres");
			}else if(respuesta=="el_correo_no_cumple_con_el_formato_solicitado"){
				$('#btn-modal-cambio').click();
				$("#text-modal-titulo").html("Advertencia");
				$("#text-modal").html("El correo no cumple con el formato solicitado");
			}else if( respuesta=="el_nombre_no_cumple_con_el_formato_solicitado"){
					$('#btn-modal-cambio').click();
					$("#text-modal-titulo").html("Advertencia");
					$("#text-modal").html("El nombre no cumple con el tamaño solicitado");
			}else{
                console.log(respuesta);
            }
        },
            error:function(){
            alert("ERROR GENERAL DEL SISTEMA, INTENTE NUEVAMENTE");
    }

    });

    }else{

    }
});