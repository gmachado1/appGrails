<%@ page import="br.com.aplicacao.sanduiche.Cliente"%>
<%@ page import="br.com.aplicacao.sanduiche.Enderecos"%>

<!-- Add our CSS stylesheet
<link rel="stylesheet"
	href="{resource(dir:'js/lib/jquery-1.8.2/css', file:'styles.css')}"
	type="text/css">
<!-- Add fancyBox main CSS files -->
<link rel="stylesheet"
	href="${resource(dir:'js/lib/jquery-1.8.2', file:'jquery.fancybox.css?v=2.1.2')}"
	type="text/css" media="screen">

<!-- Add our Jquery 1.8.2 -->
<script type="text/javascript"
	src="${resource(dir:'js/lib/jquery-1.8.2', file:'jquery-1.8.2.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir:'js/lib/jquery-1.8.2', file:'jquery.validate.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir:'js/lib/jquery-1.8.2', file:'jquery.fancybox.js?v=2.1.3')}"></script>

<script type="text/javascript"
	src="${resource(dir:'js/lib/jquery-1.8.2',file:'jquery.fancybox.js')}"></script>

<link rel="stylesheet"
	href="${resource(dir:'js/fancyapps-fancyBox-18d1712/source', file:'jquery.fancybox.css')}"
	type="text/css">

<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=110994505629056";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#contact_us").fancybox({
			type : "inline",
			closeBtn : true
		});

	});
	$("#send_form")
			.click(
					function() {

						var name = $("#name").val();
						var email = $("#email").val();
						var message = $("#message").val();

						if ((name == "") || (email == "") || (message == "")) {
							$(".errormsg").html(" * All fields Required")
									.fadeIn("Slow").fadeOut(3000);
						} else if (!isValidEmailAddress(email)) {
							$(".errormsg").html(" * Invalid Email").fadeIn(
									"Slow").fadeOut(3000);
						} else {
							$(".errormsg").fadeOut();
							$
									.ajax({
										type : 'POST',
										url : 'php/process.php',
										data : {
											'name' : name,
											'email' : email,
											'message' : message,
										},
										beforeSend : function() {
											$("#show_our_contact_form")
													.empty()
													.html(
															"<h3>Sending your Message to our Awesome Boss! Please wait . . . </h3>");
										},
										error : function() {
											alert("Something went wrong!");
										},
										success : function(returnData) {
											$("#show_our_contact_form")
													.empty()
													.html(
															"<h3>Your Message Successfully Delivered! <br/> Thank you</h3>");

										}
									});
						}

					});

	var isValidEmailAddress = function(email_add) {
		var pattern = new RegExp(
				/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
		return pattern.test(email_add);
	};
</script>


<div
	class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
	<label for="nome"> <g:message code="cliente.nome.label"
			default="Nome" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="30" required=""
		value="${clienteInstance?.nome}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'sobrenome', 'error')} required">
	<label for="sobrenome"> <g:message
			code="cliente.sobrenome.label" default="Sobrenome" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="sobrenome" maxlength="30" required=""
		value="${clienteInstance?.sobrenome}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'celular', 'error')} required">
	<label for="celular"> <g:message code="cliente.celular.label"
			default="Celular" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="celular" required=""
		value="${clienteInstance?.celular}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'endereco', 'error')} ">
	<label for="endereco"> <g:message code="cliente.endereco.label"
			default="Endereco" />

	</label>
	<!-- Enderecos -->
	<g:if test="${clienteInstance?.id}">
		<a href="#show_our_contact_form" id="contact_us">Editar Endereco</a>
	</g:if>
	<g:else>
		<a href="#show_our_contact_form" id="contact_us">Adicionar Endereco</a>
	</g:else>


	<div id="show_our_contact_form" style="display: none">
		<script type="text/javascript"
			src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
			var geocoder;
			var map;
			function carregarMapa() {
				geocoder = new google.maps.Geocoder();
				var latlng = new google.maps.LatLng(-21.21353996963235,
						-43.75502586364746);
				var mapOptions = {
					zoom : 15,
					center : latlng,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				}
				map = new google.maps.Map(
						document.getElementById('map_canvas'), mapOptions);
			}

			function codeAddress() {
				//break;
				carregarMapa()
				var address = document.getElementById('rua').value + ","
						+ document.getElementById('complemento').value;
				address = address + "-"
						+ document.getElementById('cidade').value + "-"
						+ document.getElementById('estado').value;
				address = address + "-" + document.getElementById('cep').value;
				;
				geocoder.geocode({
					'address' : address
				}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						var variable = results[0].geometry.location;
						document.getElementById('latitude').value = variable
								.lat();
						document.getElementById('longitude').value = variable
								.lng();
						map.setCenter(results[0].geometry.location);
						var marker = new google.maps.Marker({
							map : map,
							position : results[0].geometry.location
						});
					} else {
						alert('Localização não econtrada ');
					}
				});
			}
		</script>
		<table>
			<tr>
				<td>
					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'estado', 'error')} required">
						<label for="estado"> <g:message
								code="enderecos.estado.label" default="Estado" /> <span
							class="required-indicator">*</span>
						</label>
						<g:select name="estado"
							from="${br.com.aplicacao.sanduiche.EstadoEnum?.values()}"
							keys="${br.com.aplicacao.sanduiche.EstadoEnum.values()*.name()}"
							required="" value="${clienteInstance.endereco?.estado?.name()}"
							noSelection="['':'-Estado-']" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'cep', 'error')} required">
						<label for="cep"> <g:message code="enderecos.cep.label"
								default="Cep" /> <span class="required-indicator">*</span>
						</label>
						<g:textField name="cep" required=""
							value="${clienteInstance.endereco?.cep}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'cidade', 'error')} required">
						<label for="cidade"> <g:message
								code="enderecos.cidade.label" default="Cidade" /> <span
							class="required-indicator">*</span>
						</label>
						<g:textField name="cidade" required=""
							value="${clienteInstance.endereco?.cidade}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'bairro', 'error')} required">
						<label for="bairro"> <g:message
								code="enderecos.bairro.label" default="Bairro" /> <span
							class="required-indicator">*</span>
						</label>
						<g:textField name="bairro" required=""
							value="${clienteInstance.endereco?.bairro}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'rua', 'error')} required">
						<label for="rua"> <g:message code="enderecos.rua.label"
								default="Rua" /> <span class="required-indicator">*</span>
						</label>
						<g:textField name="rua" required=""
							value="${clienteInstance.endereco?.rua}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'complemento', 'error')} ">
						<label for="complemento"> <g:message
								code="enderecos.complemento.label" default="Complemento" />

						</label>
						<g:textField name="complemento"
							value="${clienteInstance.endereco?.complemento}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'referencia', 'error')} ">
						<label for="referencia"> <g:message
								code="enderecos.referencia.label" default="Referencia" />

						</label>
						<g:textField name="referencia"
							value="${clienteInstance.endereco?.referencia}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'latitude', 'error')} "
						style="display: none">
						<label for="latitude"> <g:message
								code="enderecos.latitude.label" default="Latitude" />

						</label>
						<g:field name="latitude"
							value="${fieldValue(bean: clienteInstance.endereco, field: 'latitude')}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: clienteInstance.endereco, field: 'longitude', 'error')} "
						style="display: none">
						<label for="longitude">x <g:message
								code="enderecos.longitude.label" default="Longitude" />

						</label>
						<g:field name="longitude"
							value="${fieldValue(bean: clienteInstance.endereco, field: 'longitude')}" />
					</div>
				</td>
				<td>
					<div>
						<input type="button" value="Localizar no Mapa"
							onclick="codeAddress()">
						<div id="map_canvas" style="height: 500px; width: 600px;"></div>
					</div>
				</td>
			</tr>
		</table>
	</div>


	<!-- Fim do componente de enderecos -->
</div>

<div
	class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
	<label for="email"> <g:message code="cliente.email.label"
			default="Email" />

	</label>
	<g:textField name="email" value="${clienteInstance?.email}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'entregas', 'error')} ">
	<label for="entregas"> <g:message code="cliente.entregas.label"
			default="Entregas" />

	</label>

	<ul class="one-to-many">
		<g:if test="${clienteInstance.id}">
			<g:each in="${clienteInstance?.entregas?}" var="e">
				<li><g:link controller="entregas" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
			</g:each>
			<li class="add"><g:link controller="entregas" action="create"
				params="['cliente.id': clienteInstance?.id]">
				Solicitar Entrega
			</g:link></li>
		</g:if>
		<g:else>
			<li class="add">
			<g:link controller="entregas" action="create"
				params="['cliente.id': clienteInstance?.id]">
				Realizar pedido sem cadastro de cliente
			</g:link></li>
		</g:else>

	</ul>

</div>

