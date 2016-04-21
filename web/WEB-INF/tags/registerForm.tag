<%@tag import="org.springframework.validation.Errors" %>
<%@tag import="domain.user.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@attribute name="registerNameClass" required="true" type="String" %>
<%@attribute name="registerName" required="true" type="String" %>
<%@attribute name="registerPasswordClass" required="true" type="String" %>
<%@attribute name="user" required="true" type="domain.user.User" %>

<div class="row" id="registerForm">
    <div class="col-sm-offset-4 col-sm-4">
        <div class="panel panel-info push-panel">
            <div class="panel-heading">
                <h3 class="panel-title">Register</h3>
            </div>
            <div class="panel-body">
                <form:form method="post" action="register.htm" autocomplete="off" modelAttribute="user">                                              
                    <fieldset>
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
                                    required="required" autocomplete="off"/>
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

                        <div id="pw-form-group" class="form-group ${pwClass } has-feedback">
                            <form:label cssClass="control-label" path="pw">
                                Password
                            </form:label>
                            <div id="pwGroup" class="input-group">
                                <span id="pwSpan" class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <form:password onkeyup="passwordsCheck()" cssClass="form-control" id="pw"
                                               path="pw" placeholder="enter your password"
                                               required="required" autocomplete="off" />
                                <span id="pw-errorIcon" class="hidden glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                <span id="pw-errorSR" class="hidden">(error)</span>
                                <span id="pw-successIcon" class="hidden glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                <span id="pw-successSR" class="sr-only">(success)</span> 
                                <form:errors cssClass="text-danger" path="pw"/>
                            </div>
                        </div>

                        <div id="pwc-form-group" class="form-group has-feedback">
                            <label for="pwc">Password repeat</label>
                            <div id="pw-input-group" class="input-group">
                                <span id="pwc-span" class="input-group-addon">
                                    <i class="fa fa-eye"></i>
                                </span>
                                <input onkeyup="passwordsCheck()" type="password" class="form-control" id="pwc"
                                       name="pwc" placeholder="enter your password"
                                       required autocomplete="off">
                                <span id="pwc-errorIcon" class="hidden glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                <span id="pwc-errorSR" class="hidden">(error)</span>
                                <span id="pwc-successIcon" class="hidden glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                <span id="pwc-successSR" class="sr-only">(success)</span>
                            </div>
                        </div>                                
                        <button id="submitButton" type="submit" class="btn-block btn btn-success">Register</button>                                               
                    </fieldset>
                    <em>(Already have an account? <a onclick="switchLoginRegisterFrom()" id="showLogin">Log in</a>)</em>
                </form:form>
            </div>
        </div>
    </div>
</div>