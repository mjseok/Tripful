<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

{ "spots" : [
<c:forEach varStatus="i" var="spot" items="${spots}">
				{
				"spotid" : "${spot.spotid}",
				"title" : "${spot.title}",
				"address" :"${spot.address}",
				"hit" :"${spot.hit}",
				"theme" :"${spot.theme}",
				"image" :"${spot.image}",
				"lat" : "${spot.lat}",
				"lang" : "${spot.lang}"
				}
				<c:if test="${i.index != spots.size() - 1}">,</c:if>
</c:forEach>
] }
