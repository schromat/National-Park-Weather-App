<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<style>
		body {
			background-color: #50c327;
			font-family: didot;
		}
		table {
			width: 1080px;
			border: 3px solid #4b2d10;
			margin-left: auto;
			margin-right: auto;
			background-color: #fcfadb;
		}
		#siteLogo {
			max-width: auto;
			max-height: 15%;
		}
		.tdNav {
			background-color: #4b2d10;
			color: #fcfadb;
		}
		a:link, a:visited {
			color: #fcfadb;
			text-decoration: none;
		}
		a:hover {
			color: #50c327;
			text-decoration: none;
		}
		a:active {
			color: #50c327;
			text-decoration: underline;
		}
		.hdNav {
			display: inline; 
			white-space: pre;
		}
		.pdTR1 {
			padding: 5px 25px 20px 25px;
		}
		.pdTR2left {
			padding: 0px 25px 0px 25px
		}
		.pdTR2right {
			padding: 0px 500px 0px 0px
		}
	</style>
	<title>${param.pageTitle}</title>
	</head>
	<body>
	<table>
		<tr>
			<td colspan="3">	
			<c:url var="npgeekimg" value="/img/logo.png" />
			<img src="${npgeekimg}" id="siteLogo" alt="site logo"/>		
			</td>
		</tr>
		<tr>
			<td colspan="3" class="tdNav">
				<c:url var="homeLink" value="/" />
				<c:url var="surveyLink" value="/surveyForm" />
				<c:url var="surveyFavs" value="/surveyFavorites" />
				<h2 class="hdNav">  <a href="${homeLink}">Home</a>    </h2>
				<h2 class="hdNav"><a href="${surveyLink}">Survey</a>    </h2>
				<h2 class="hdNav"><a href="${surveyFavs}">Favorite Parks</a></h2>
			</td>
		</tr>

	