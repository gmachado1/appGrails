<%@ page import="br.com.aplicacao.sanduiche.Entregas"%>
<%@ page import="br.com.aplicacao.sanduiche.Enderecos"%>
<g:if test="${entregasInstance?.cliente?.id}">
	<g:set var="clienteVinculado" value="true" />
</g:if>
<g:else>
	<g:set var="clienteVinculado" value="false" />
</g:else>


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
	function solicitaEndereco() {
		var campo = $('input[name=isEntregaResidencia]:checked').val();

		if (campo == "true") {
			$("#divEnderecos").hide();
		} else {
			$("#divEnderecos").show();
		}
	};

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
	class="fieldcontain ${hasErrors(bean: entregasInstance, field: 'funcionario', 'error')} required">
	<label for="funcionario"> <g:message
			code="entregas.funcionario.label" default="Funcionario" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="funcionario" name="funcionario.id"
		from="${br.com.aplicacao.sanduiche.Funcionario.list()}" optionKey="id"
		required="" value="${entregasInstance?.funcionario?.id}"
		optionValue="nome" class="many-to-one" />
</div>

<div class="fieldcontain">
	<label> Entrega na residência do cliente?<span
		class="required-indicator">*</span>
	</label>
	<table border="0">
		<tr>
			<td></td>
			<td><g:if test="${clienteVinculado == false}">
					<g:radioGroup onClick="solicitaEndereco()" readonly="true"
						disabled="true" id="isEntregaResidencia"
						name="isEntregaResidencia"
						value="${entregasInstance?.isEntregaResidencia}"
						labels="['Sim','Não']" values="[true,false]">
						<p>
							${it.label}
							${it.radio}
						</p>
					</g:radioGroup>
				</g:if> <g:else>
					<g:radioGroup onClick="solicitaEndereco()" id="isEntregaResidencia"
						name="isEntregaResidencia"
						value="${entregasInstance?.isEntregaResidencia}"
						labels="['Sim','Não']" values="[true,false]">
						<p>
							${it.label}
							${it.radio}
						</p>
					</g:radioGroup>
				</g:else></td>
		</tr>
	</table>

</div>

<div
	class="fieldcontain ${hasErrors(bean: entregasInstance, field: 'endereco', 'error')} "
	id="divEnderecos" style="display:">
	<label for="endereco"> <g:message
			code="entregas.endereco.label" default="Endereco" />

	</label>
	<!-- Enderecos -->
	<g:if test="${entregasInstance?.id}">
		<a href="#show_our_contact_form" id="contact_us">Editar Endereco</a>
	</g:if>
	<g:else>
		<a href="#show_our_contact_form" id="contact_us">Adicionar
			Endereco</a>
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
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'estado', 'error')} ">
						<label for="estado"> <g:message
								code="enderecos.estado.label" default="Estado" />
						</label>
						<g:select name="estado"
							from="${br.com.aplicacao.sanduiche.EstadoEnum?.values()}"
							keys="${br.com.aplicacao.sanduiche.EstadoEnum.values()*.name()}"
							value="${entregasInstance.endereco?.estado?.name()}"
							noSelection="['':'-Estado-']" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'cep', 'error')} ">
						<label for="cep"> <g:message code="enderecos.cep.label"
								default="Cep" />
						</label>
						<g:textField name="cep" value="${entregasInstance.endereco?.cep}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'cidade', 'error')} ">
						<label for="cidade"> <g:message
								code="enderecos.cidade.label" default="Cidade" />
						</label>
						<g:textField name="cidade"
							value="${entregasInstance.endereco?.cidade}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'bairro', 'error')} ">
						<label for="bairro"> <g:message
								code="enderecos.bairro.label" default="Bairro" /> <g:textField
								name="bairro" value="${entregasInstance.endereco?.bairro}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'rua', 'error')} ">
						<label for="rua"> <g:message code="enderecos.rua.label"
								default="Rua" />
						</label>
						<g:textField name="rua" value="${entregasInstance.endereco?.rua}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'complemento', 'error')} ">
						<label for="complemento"> <g:message
								code="enderecos.complemento.label" default="Complemento" />

						</label>
						<g:textField name="complemento"
							value="${entregasInstance.endereco?.complemento}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'referencia', 'error')} ">
						<label for="referencia"> <g:message
								code="enderecos.referencia.label" default="Referencia" />

						</label>
						<g:textField name="referencia"
							value="${entregasInstance.endereco?.referencia}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'latitude', 'error')} "
						style="display: none">
						<label for="latitude"> <g:message
								code="enderecos.latitude.label" default="Latitude" />

						</label>
						<g:field name="latitude"
							value="${fieldValue(bean: entregasInstance.endereco, field: 'latitude')}" />
					</div>

					<div
						class="fieldcontain ${hasErrors(bean: entregasInstance.endereco, field: 'longitude', 'error')} "
						style="display: none">
						<label for="longitude">x <g:message
								code="enderecos.longitude.label" default="Longitude" />

						</label>
						<g:field name="longitude"
							value="${fieldValue(bean: entregasInstance.endereco, field: 'longitude')}" />
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

<div style="display: none"
	class="fieldcontain ${hasErrors(bean: entregasInstance, field: 'dtEntrega', 'error')} ">
	<label for="dtEntrega"> <g:message
			code="entregas.dtEntrega.label" default="Dt Entrega" />

	</label>
	<g:datePicker name="dtEntrega" precision="day"
		value="${entregasInstance?.dtEntrega}" default="none"
		noSelection="['': '']" />
</div>

<div style="display: none"
	class="fieldcontain ${hasErrors(bean: entregasInstance, field: 'dtSolicitacao', 'error')} ">
	<label for="dtSolicitacao"> <g:message
			code="entregas.dtSolicitacao.label" default="Dt Solicitacao" />

	</label>
	<g:datePicker name="dtSolicitacao" precision="day"
		value="${entregasInstance?.dtSolicitacao}" default="none"
		noSelection="['': '']" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: entregasInstance, field: 'cliente', 'error')} ">
	<label for="cliente"> <g:message code="entregas.cliente.label"
			default="Cliente" />

	</label>
	<g:if test="${entregasInstance?.cliente?.id}">
		<g:link controller="cliente" action="show"
			params="[id:entregasInstance?.cliente?.id]">
			${entregasInstance?.cliente?.nome}
			${entregasInstance?.cliente?.sobrenome}
		</g:link>
		<div style="display:none" >
		<g:field name="cliente.id" value="${fieldValue(bean: entregasInstance.cliente, field: 'id')}" />
		</div>
	</g:if>
	<g:else>
		<g:message code="entregas.cliente.label"
			default="Entrega não vinculada a cliente ou solicitação fora de residência do cliente. " />
	</g:else>
</div>

<div style="display: none"
	class="fieldcontain ${hasErrors(bean: entregasInstance, field: 'situacaoEntrega', 'error')} required">
	<label for="situacaoEntrega"> <g:message
			code="entregas.situacaoEntrega.label" default="Situacao Entrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="situacaoEntrega"
		from="${br.com.aplicacao.sanduiche.EstadoEntregaEnum?.values()}"
		keys="${br.com.aplicacao.sanduiche.EstadoEntregaEnum.values()*.name()}"
		required="" value="${entregasInstance?.situacaoEntrega?.name()}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: entregasInstance, field: 'pedidos', 'error')} ">
	<label for="pedidos"> <g:message code="entregas.pedidos.label"
			default="Pedidos" />

	</label>

	<ul class="one-to-many">
		<g:if test="${entregasInstance.id}">
			<table>
				<g:each in="${entregasInstance?.pedidos?}" var="p">
					<tr width="90">
						<td>
							<li><g:link controller="pedidos" action="show" id="${p.id}">
						Qtd: ${p?.quantidade} - ${p?.produto?.nome} - R$ ${p?.total}
								</g:link></li>
						</td>
					</tr>
				</g:each>
				<tr>
					<td>
						<li class="add"><g:link controller="pedidos" action="create"
								params="['entregasInstance.id': entregasInstance?.id]">
								${message(code: 'default.add.label', args: [message(code: 'pedidos.label', default: 'Pedidos')])}
							</g:link></li>
					</td>
				</tr>
			</table>
		</g:if>
		<g:else>
			<li class="add">
				Confirme o enderco e o funcionário antes de realizar os pedidos
		</g:else>

	</ul>

</div>

