function checkear() {
	if(document.getElementById('Acepto').checked) {
  		return true;
  	} else {
  		// alert("Por favor indica que usted a leido y acepta los Terminos y condiciones y las Politicas de privacidad del sitio "+ window.location.host);
  		// return false;
  		$('#mensajeEmergenteTyC-P').modal();
  		return false;
  	}
}