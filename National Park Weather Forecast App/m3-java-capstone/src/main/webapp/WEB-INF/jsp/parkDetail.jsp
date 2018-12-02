<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:import url="/WEB-INF/jsp/common/header.jsp">
	<c:param name="pageTitle" value="${park.name} - National Park Geek" />
</c:import>

<tr>
	<td colspan="5" style="padding: 25px 25px 20px 25px">
		<figure style="width:auto; height: 475px; overflow:hidden; margin:0">
			<img style="width: 100%" src="img/parks/${fn:toLowerCase(park.code)}.jpg">
		</figure>
	</td>
</tr>


<tr>
	<td colspan="2" class="pdTR1" style="font-size: 18px">"${park.inspirationalQuote}"</td>
</tr> 
<tr>
	<td colspan="2" class="pdTR1"> - ${park.inspirationalQuoteSource}</td>
</tr>
<tr>
	<td colspan="2" class="pdTR1"><h2>${park.name}</h2></td>
</tr>
<tr>
	<td colspan="2" class="pdTR1">${park.description}</td>
</tr>


<tr>
	<td class="pdTR2left">
		<b>State:</b> ${park.state}
	</td>
	<td class="pdTR2right">
		<b>Acreage:</b> ${park.acreage}    
	</td>
</tr>

<tr>
	<td class="pdTR2left">
		<b>Entry Fee:</b> $${park.entryFee} 
	</td>
	<td class="pdTR2right">
		<b>Miles of Trail:</b> ${park.milesOfTrail}
	</td>
</tr> 

<tr>
	<td class="pdTR2left">
		<b>Year Founded: </b> ${park.yearFounded}
	</td>
	<td class="pdTR2right">
		<b>Number of Campsites:</b> ${park.numberOfCampsites}
	</td>
</tr>

<tr>
	<td class="pdTR2left">
		<b>Elevation in Feet:</b> ${park.elevationInFeet}
	</td>
	<td class="pdTR2right">
		<b>Climate:</b> ${park.climate}
	</td>
</tr>

<tr>
	<td class="pdTR2left">
		<b>Annual Visitor Count:</b> ${park.annualVisitorCount}
	</td>
	<td class="pdTR2right">
		<b>Number Of Animal Species:</b> ${park.numberOfAnimalSpecies}
	</td>
</tr>

<tr>
	<td style="padding: 25px">
	</td>
</tr>

<tr>
	<td colspan="2" style="text-align: center">
	<c:forEach var="day" items="${forecast}">
	<c:choose>
		<c:when test="${day.forecast == 'partly cloudy'}">
			<c:set var="forecastFilename" value="partlyCloudy.png"/>
		</c:when>
		<c:otherwise>
			<c:set var="forecastFilename" value="${day.forecast}.png" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${sessionScope.tempScale == 'C'}">
			<c:set var="high" value="${Math.round(((day.high) - 32) * (5/9))} C" />
			<c:set var="low" value="${Math.round(((day.low) - 32) * (5/9))} C" />
			<c:set var="tempOptions" value="<option value='C'>C</option><option value='F'>F</option>" />
		</c:when>
		<c:otherwise>
				<c:set var="high" value="${day.high} F" />
			<c:set var="low" value="${day.low} F" />
			<c:set var="tempOptions" value="<option value='F'>F</option><option value='C'>C</option>" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${day.fiveDayForecastValue == 1}">
			<div style="display:inline-block">
				<h3 style="margin: 0; color:#50c327">5-DAY FORECAST</h3> 
				<c:url var="formAction" value="/parkDetail?code=${park.code}" />
				<form method="POST" action="${formAction}">
					Temp Scale 
					<select name="tempScale">
						${tempOptions}
					</select>
					<input type="submit" name=" Submit" />
				</form>
				<b>TODAY</b><br>
				<img src="img/weather/${forecastFilename}" ><br>
				<b style="color:#50c327">High:</b> ${high}<br>
				<b style="color:#4da6ff">Low:</b> ${low}<br>
				<b>Forecast:</b> ${day.forecast}
			</div>
		</c:when>
		<c:otherwise>
			<div style="display: inline-block; padding: 125px 25px 0px 25px; vertical-align: top">
				<img src="img/weather/${forecastFilename}" style="width: 100px"><br>
				<b style="color:#50c327">High:</b> ${high}<br>
				<b style="color:#4da6ff">Low:</b> ${low} 
			</div>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	</td>
</tr>

<tr>
	<td style="padding: 25px">
	</td>
</tr>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />