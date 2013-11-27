<%@ page import="br.com.aplicacao.sanduiche.Enderecos" %>
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
		map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions);
	}

	function codeAddress() {
		//break;
		carregarMapa()
		var address = document.getElementById('rua').value+","+document.getElementById('complemento').value;
		address = address+"-"+document.getElementById('cidade').value+"-"+document.getElementById('estado').value;
		address = address+"-"+document.getElementById('cep').value;;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var variable = results[0].geometry.location;
				document.getElementById('latitude').value = variable.lat();
				document.getElementById('longitude').value = variable.lng();
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
<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="enderecos.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${br.com.aplicacao.sanduiche.EstadoEnum?.values()}"  keys="${br.com.aplicacao.sanduiche.EstadoEnum.values()*.name()}" required=""  value="${enderecosInstance?.estado?.name()}" noSelection="['':'-Estado-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'cep', 'error')} ">
	<label for="cep">
		<g:message code="enderecos.cep.label" default="Cep" />
		
	</label>
	<g:textField name="cep" required="" value="${enderecosInstance?.cep}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'cidade', 'error')} ">
	<label for="cidade">
		<g:message code="enderecos.cidade.label" default="Cidade" />
		
	</label>
	<g:textField name="cidade" required="" value="${enderecosInstance?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'bairro', 'error')} ">
	<label for="bairro">
		<g:message code="enderecos.bairro.label" default="Bairro" />
		
	</label>
	<g:textField name="bairro" required="" value="${enderecosInstance?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'rua', 'error')} ">
	<label for="rua">
		<g:message code="enderecos.rua.label" default="Rua" />
		
	</label>
	<g:textField name="rua" required="" value="${enderecosInstance?.rua}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'complemento', 'error')} ">
	<label for="complemento">
		<g:message code="enderecos.complemento.label" default="Complemento" />
		
	</label>
	<g:textField name="complemento" value="${enderecosInstance?.complemento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'referencia', 'error')} ">
	<label for="referencia">
		<g:message code="enderecos.referencia.label" default="Referencia" />
		
	</label>
	<g:textField name="referencia" value="${enderecosInstance?.referencia}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'latitude', 'error')} " style="display: none" >
	<label for="latitude">
		<g:message code="enderecos.latitude.label" default="Latitude" />
		
	</label>
	<g:field name="latitude" value="${fieldValue(bean: enderecosInstance, field: 'latitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecosInstance, field: 'longitude', 'error')} " style="display: none"  >
	<label for="longitude">x
		<g:message code="enderecos.longitude.label" default="Longitude" />
		
	</label>
	<g:field name="longitude" value="${fieldValue(bean: enderecosInstance, field: 'longitude')}"/>
</div>
</td>
<td>
<div>
	<input type="button" value="Localizar no Mapa" onclick="codeAddress()">
	<div id="map_canvas" style="height: 500px; width: 600px;"></div>
</div>
</td>
</tr>
</table>