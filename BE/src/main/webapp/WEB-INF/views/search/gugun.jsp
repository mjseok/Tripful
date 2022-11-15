<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{ "guguns" : [
<c:forEach varStatus="i" var="gugun" items="${guguns}">
				{
				"gugunid" : "${gugun.sidoid}",
				"name" : "${gugun.name}"
				}
				<c:if test="${i.index != guguns.size() - 1}">,</c:if>
</c:forEach>
] }
