<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <c:set var="url">${pageContext.request.requestURL}</c:set>
        <mfa:header title="MFA Account |Newsfeed"></mfa:header>
        </head>
        <body>
        <jsp:include page="/includers/menu.htm">
            <jsp:param name="active" value="account_id"/>
        </jsp:include>

        <c:choose>
            <c:when test="${formStyle == 'add'}">
                <c:set var="formAction" value="addNewsfeed.htm"/>
                <c:set var="formTit" value="Newsfeed Add page"/>
            </c:when>
            <c:when test="${formStyle == 'update'}">
                <c:set var="formAction" value="updateNewsfeed.htm"/>
                <c:set var="formTit" value="Newsfeed Update page"/>
            </c:when>
        </c:choose>

        <main role="main" class="content container-fluid">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8">
                    <form:form method="post" action="${formAction}" autocomplete="OFF" modelAttribute="newsfeed" >
                        <fieldset>
                            <legend><c:out value="${formTit}"/></legend>
                            <c:if test="${!empty(newsfeed.id)}">
                                <form:hidden path="id"/>
                            </c:if>
                            <!-- TODO use onblur/oninput for instant checks -->
                            <div class="form-group ${newsfeedSubjectClass} has-feedback">
                                <form:label cssClass="control-label" path="subject" >
                                    SUBJECT 
                                </form:label>
                                <form:input 
                                    type="text" cssClass="form-control" id="subject" 
                                    path="subject" placeholder="enter the newsfeed subject"
                                    required="required" autofocus="autofocus"
                                    value="${newsfeed.subject}"/>
                                <c:if test = "${newsfeedSubjectClass == 'has-error'}">
                                    <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                    <span id="inputSubjectError" class="sr-only">(error)</span>
                                </c:if>
                                <c:if test = "${newsfeedSubjectClass == 'has-success'}">
                                    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                    <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                </c:if>
                                <form:errors cssClass="text-danger" path="subject"/>
                            </div>

                            <div class="form-group ${newsfeedTextClass} has-feedback">
                                <form:label cssClass="control-label" path="text" >
                                    MESSAGE 
                                </form:label>
                                <form:input 
                                    type="text" cssClass="form-control" id="text" 
                                    path="text" placeholder="enter the newsfeed text"
                                    required="required" autofocus="autofocus"
                                    value="${newsfeed.text}"/>
                                <c:if test = "${newsfeedTextClass == 'has-error'}">
                                    <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                    <span id="inputSubjectError" class="sr-only">(error)</span>
                                </c:if>
                                <c:if test = "${newsfeedTextClass == 'has-success'}">
                                    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                    <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                </c:if>
                                <form:errors cssClass="text-danger" path="text"/>
                            </div>
                        </fieldset>
                        <a type="button" class="btn btn-danger" href="account.htm">
                            Back to Account Overview
                        </a>
                        <button type="submit" class="col-sm-2 btn btn-success pull-right" id="submitButton">submit</button>
                    </form:form>
                </div>
            </div>
        </main>

        <mfa:scripts/>
    </body>
</html>