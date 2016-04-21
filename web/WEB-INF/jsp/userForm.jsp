<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <script>
            var oldPw = '${user.pw}';
            //Really unsafe! needs to be fixed
        </script>
        <c:set var="url" value="${pageContext.request.requestURL}"/>
        <mfa:header title="MFA Account |User"/>
    </head>
    <body>
        <jsp:include page="/includers/menu.htm">
            <jsp:param name="active" value="account_id"/>
        </jsp:include>

        <c:choose>
            <c:when test="${formStyle == 'add'}">
                <c:set var="formAction" value="addAdmin.htm"/>
                <c:set var="formTit" value="User Add page"/>
                <c:set var="pwLab" value="Password"/>
                <c:set var="required" value="required"/>
            </c:when>
            <c:when test="${formStyle == 'update'}">
                <c:set var="formAction" value="updateUser.htm"/>
                <c:set var="formTit" value="User Update page"/>
                <c:set var="pwLab" value="New password"/>
                <c:set var="required" value=""/>
            </c:when>
        </c:choose>

        <main role="main" class="content container-fluid">
            <div class="row" id="userForm">
                <div class="col-sm-offset-4 col-sm-4">            
                    <form:form id="form" method="post" action="${formAction}" autocomplete="off" modelAttribute="user" cssClass="push-form">                                              
                        <fieldset>
                            <legend><c:out value="${formTit}"/></legend>
                            <div class="form-group ${usernameClass} has-feedback">
                                <form:label cssClass="control-label" path="username">
                                    Username
                                </form:label>
                                <div id="usernameGroup" class="input-group">
                                    <span id="uernameSpan" class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </span>
                                    <form:input
                                        type="text" cssClass="form-control" id="username"
                                        path="username" placeholder="enter your username"
                                        required="required" autocomplete="off" autofocus="true"/>
                                    <c:if test="${usernameClass == 'has-error'}">
                                        <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                        <span id="inputUsernameError" class="sr-only">(error)</span>
                                    </c:if>
                                    <c:if test="${usernameClass == 'has-success'}">
                                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                        <span id="inputUsernameSuccess" class="sr-only">(success)</span>
                                    </c:if>
                                </div>
                                <form:errors cssClass="text-danger" path="username"/>
                            </div>

                            <c:if test="${formStyle == 'update'}" >
                                <c:if test="${!empty(user.id)}">
                                    <form:hidden path="id"/>
                                </c:if>

                                <div class="form-group ${pwOldClass} has-feedback">
                                    <label class="control-label" for="pwOld">Old password</label>
                                    <div id="pwOld-input-group" class="input-group">
                                        <span id="pwOld-span" class="input-group-addon">
                                            <i class="fa fa-unlock-alt"></i>
                                        </span>
                                        <input type="password" class="form-control" id="pwOld"
                                               name="pwOld" placeholder="enter your previous password"
                                               required autocomplete="off">
                                        <c:if test="${pwOldClass == 'has-error'}">
                                            <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                            <span id="pwOldinputError" class="sr-only">(error)</span>
                                        </c:if>
                                        <c:if test="${pwOldClass == 'has-success'}">
                                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                            <span id="pwOldinputSuccess" class="sr-only">(success)</span>
                                        </c:if>
                                    </div>
                                    <p class="text-danger">${pwOldError}</p>
                                </div>

                                <div class="form-group ${pwAdClass} has-feedback">
                                    <label class="control-label" for="pwAd">Admin password</label>
                                    <div id="pwAd-input-group" class="input-group">
                                        <span id="pwAd-span" class="input-group-addon">
                                            <i class="fa fa-barcode"></i>
                                        </span>
                                        <input type="password" class="form-control" id="pwAd"
                                               name="pwAd" placeholder="enter your previous password"
                                               required="required" autocomplete="off">
                                        <c:if test="${pwAdClass == 'has-error'}">
                                            <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                            <span id="pwAdinputError" class="sr-only">(error)</span>
                                        </c:if>
                                        <c:if test="${pwAdClass == 'has-success'}">
                                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                            <span id="pwAdinputSuccess" class="sr-only">(success)</span>
                                        </c:if>
                                    </div>
                                    <p class="text-danger">${pwAdError}</p>
                                </div>
                            </c:if>                            
                            <div id="pw-change">
                                <div id="pw-form-group" class="form-group ${pwClass } has-feedback">
                                    <form:label cssClass="control-label" path="pw">
                                        ${pwLab}
                                    </form:label>
                                    <div id="pwGroup" class="input-group">
                                        <span id="pwSpan" class="input-group-addon">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                        <form:password onkeyup="passwordsCheck()" cssClass="form-control" id="pw"
                                                       path="pw" placeholder="enter your password"
                                                       required="${required}" autocomplete="off" />
                                        <span id="pw-errorIcon" class="hidden glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                        <span id="pw-errorSR" class="hidden">(error)</span>
                                        <span id="pw-successIcon" class="hidden glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                        <span id="pw-successSR" class="sr-only">(success)</span>                            
                                    </div>
                                    <form:errors cssClass="text-danger" path="pw"/>
                                </div>

                                <div id="pwc-form-group" class="form-group has-feedback">
                                    <label class="control-label" for="pwc">Password repeat</label>
                                    <div id="pwc-input-group" class="input-group">
                                        <span id="pwc-span" class="input-group-addon">
                                            <i class="fa fa-eye"></i>
                                        </span>
                                        <input onkeyup="passwordsCheck()" type="password" class="form-control" id="pwc"
                                               name="pwc" placeholder="enter your password"
                                               ${required} autocomplete="off">
                                        <span id="pwc-errorIcon" class="hidden glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                        <span id="pwc-errorSR" class="hidden">(error)</span>
                                        <span id="pwc-successIcon" class="hidden glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                        <span id="pwc-successSR" class="sr-only">(success)</span>
                                    </div>
                                    <form:errors cssClass="text-danger" path="pw"/>
                                </div> 
                            </div>
                            <div id="pw-btn" class="form-group" style="display: none">
                                <a id="pw-btn-inner" class="btn btn-default" onclick="changePwToggle()">
                                    Change password
                                </a>
                            </div>
                            <script>
                                addLoadEvent($('#pw-btn').show());
                                addLoadEvent($('#pw-change').hide());
                            </script>
                            <div id="adminState-form-group" class="form-group">
                                <form:label cssClass="control-label" path="adminState">
                                    Admin
                                </form:label>
                                <form:select cssClass="form-control" path="adminState">
                                    <form:option value="true" label="Yes"/>
                                    <form:option value="false" label="No"/>
                                </form:select>                                                                    
                            </div>

                        </fieldset>
                        <a class="btn btn-danger col-sm-4" href="account.htm">
                            Back to Account Overview
                        </a>
                        <button type="submit" class="col-sm-4 btn btn-success pull-right" id="submitButton">submit</button>               
                    </form:form>
                </div>
            </div>
        </main>        
        <mfa:scripts/>
    </body>
</html>