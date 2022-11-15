<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

{ "topSpots" : [
<c:forEach varStatus="i" var="top" items="${topSpots}">
				{
				"spotid" : "${top.spotid}",
				"title" : "${top.title}",
				"address" :"${top.address}",
				"hit" :"${top.hit}",
				"theme" :"${top.theme}",
				"image" :"${top.image}",
				"lat" : "${top.lat}",
				"lang" : "${top.lang}"
				}
				<c:if test="${i.index != topSpots.size() - 1}">,</c:if>
</c:forEach>
] }
