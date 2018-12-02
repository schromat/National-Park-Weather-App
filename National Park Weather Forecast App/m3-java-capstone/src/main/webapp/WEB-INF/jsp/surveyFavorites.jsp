<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:import url="/WEB-INF/jsp/common/header.jsp">
	<c:param name="pageTitle" value="National Park Geek - Favorite Park Results" />
</c:import>

<tr>
	<td colspan="3" style="padding: 25px 25px 0px 25px">
		<h3 style="margin: 0">National Park Geek's favorite parks, according to our user survey data! Head on over to the Survey page
		at the top and submit your favorite!</h3>
	</td>
</tr>

<c:forEach var="result" items="${surveyResults}">
	<c:forEach var="park" items="${allParks}">
		<c:if test="${park.code == result.key}">
			<c:set var="parkName" value="${park.name}" />
		</c:if>
	</c:forEach>
	<tr>
		<td style="padding: 25px 25px 0px 25px">
			<img src="img/parks/${fn:toLowerCase(result.key)}.jpg" style="width: 250px">
		</td>
		<td>
			<b>${parkName}</b> 
		</td>
		<td style="padding: 0px 400px 0px 0px">
			<b>${result.value}</b> Vote(s)
		</td>
		
	</tr>
</c:forEach>
<tr>
	<td style="padding: 0px 0px 25px 0px">
	</td>
</tr>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />