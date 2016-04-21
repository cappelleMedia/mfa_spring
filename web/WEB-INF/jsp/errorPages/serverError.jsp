<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="nl">

    <head>
        <c:set var="url">${pageContext.request.requestURL}</c:set>
        <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />
        <mfa:header title="Server error"/>
        <META NAME="ROBOTS" CONTENT="none"> 

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-4 col-lg-4">
                    <div class="panel panel-danger push-panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Internal server error</h3>
                        </div>
                        <div class="panel-body">
                            <p>problem occured on: ${cause}</p>
                            <p>message: ${errorMessage}</p>
                            <c:if test="${!empty extraInfo}">
                                <p>extra information: ${extraInfo}</p>
                            </c:if>
                            <a href="index.htm">Go back to the mfa website</a>
                            <!-- should send mail to cappelle.design address so i'll get information on the error-->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
