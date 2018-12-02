<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:import url="/WEB-INF/jsp/common/header.jsp">
	<c:param name="pageTitle" value="National Park Geek - Home Page" />
</c:import>

<c:forEach var="park" items="${allParks}">
	<tr>
		<td style = "padding: 50px 25px 0px 25px">
		<c:url var="parkDetail" value="/parkDetail?code=${park.code}" />
		<a href="${parkDetail}"><img src="img/parks/${fn:toLowerCase(park.code)}.jpg" style="width: 500px"></a>
		</td>
		<td style="font-size: 22px; vertical-align: bottom; padding: 0px 25px 0px 0px">
		<b style="font-family: marker felt">${park.name}</b> <br><br>
		<div style="min-height: 200px; border: 3px solid #4b2d10; font-size: 17px; padding: 5px">${park.description}</div>
		</td>
	</tr>
</c:forEach>
	<tr>
		<td style="padding: 50px 0px 0px 0px">
		</td>
	</tr>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />