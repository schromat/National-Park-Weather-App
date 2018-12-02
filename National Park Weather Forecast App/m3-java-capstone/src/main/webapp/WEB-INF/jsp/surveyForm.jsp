<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp">
	<c:param name="pageTitle" value="National Park Geek - Submit Your Survey!" />
</c:import>

<tr>
	<td colspan="2" style="padding: 25px 25px 25px 25px">
		<h3 style="margin: 0">Thanks for visiting National Park Geek! Please submit a survey below telling us which park you think
		is the best!</h3>
	</td>
</tr>

<c:url var="formAction" value="/surveyForm" />
<form method="POST" action="${formAction}">
<tr>
	<td>
		Favorite National Park
	</td>
	<td>
		<select name="parkCode">
		<c:forEach var="park" items="${allParks}">
			<option value="${park.code}">${park.name}</option>
		</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td>
		Your email
	</td>
	<td>
		<input type="email" name="email" size="36">
	</td>
</tr>
<tr>
	<td>
		State of Residence
	</td>
	<td>
		<select name="state">
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
			<option value="PR">Puerto Rico</option>
		</select>
	</td>
</tr>
<tr>
	<td>
		Activity level
	</td>
	<td>
		<input type="radio" name="activitylvl" checked="checked" value="inactive">Inactive
		<input type="radio" name="activitylvl" value="sedentary">Sedentary
		<input type="radio" name="activitylvl" value="active">Active
		<input type="radio" name="activitylvl" value="extremely active">Extremely Active
	</td>
</tr>
<tr>
	<td>
	</td>
	<td>
		<input type="submit" value=" Submit" />
	</td>
</tr>
</form>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />