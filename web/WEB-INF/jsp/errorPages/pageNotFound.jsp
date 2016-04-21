<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="eng">

    <head>
        <c:set var="url">${pageContext.request.requestURL}</c:set>
        <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />
        <mfa:header title="Page not found error" />
        <META NAME="ROBOTS" CONTENT="none"> 

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-4 col-lg-4">
                    <div class="panel panel-danger push-panel">
                        <div class="panel-heading">
                            <h3 id="page_not_found_panel_title" class="panel-title">Page not found error</h3>
                        </div>
                        <div id="page_not_found_panel_body" class="panel-body">
                            <p id="page_not_found_message">An internal error occurd, the page could not be feched by the controller<br>
                                It is possible you don't have the needed admin rights to visit this page or the page may simply not exist</p>
                            <a id="returnTo_index" href="Controller?action=home">Go back to the MFA website</a>
                            <!-- should send mail to cappelle.design address so i'll get information on the error-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
