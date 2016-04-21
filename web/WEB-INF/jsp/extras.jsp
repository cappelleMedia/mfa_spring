<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <c:set var="url">${pageContext.request.requestURL}</c:set>
        <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />

        <mfa:header title="MFA Extras"/>
        
    </head>
    <body>
        <jsp:include page="/includers/menu.htm">
            <jsp:param name="active" value="extras_id"/>
        </jsp:include>


        <main role="main" class="content container-fluid">
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6">
                    <div class="panel panel-warning text-center">
                        <div class="panel-heading">
                            <div class="panel-title">
                                Information
                            </div>
                        </div>
                        <div class="panel-body">
                            <h3>
                                <i class="fa fa-lg fa-warning"></i>
                                This page is still under construction
                                <i class="fa fa-lg fa-warning"></i>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <mfa:scripts/>
    </body>
</html>