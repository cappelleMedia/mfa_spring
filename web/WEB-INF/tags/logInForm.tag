<%@tag  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@attribute name="messages" required="true" type="java.util.List" %>
<%@attribute name="loginNameClass" required="true" type="String" %>
<%@attribute name="loginName" required="true" type="String" %>
<%@attribute name="loginPasswordClass" required="true" type="String" %>
<%@attribute name="loginRememberMe" required="true" type="Boolean" %>

<div class="row" id="loginForm">
    <div class="col-sm-offset-4 col-sm-4">
        <div class="panel panel-info push-panel">
            <div class="panel-heading">
                <h3 class="panel-title">Log in</h3>
            </div>
            <div class="panel-body">
                <form method="post" action="login.htm" autocomplete="off">                                        
                    <c:if test="${fn:length(messages) gt 0 }">
                        <div class="alert alert-danger">
                            <c:forEach var="message" items="${messages}">
                                <p>${message}</p>
                            </c:forEach>
                        </div>
                    </c:if>
                    <fieldset>
                        <div class="form-group ${loginNameClass}">
                            <label for="loginName">Username</label>
                            <div id="loginNameGroup" class="input-group">
                                <span id="loginNameSpan" class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </span>
                                <input type="text" class="form-control" id="loginName"
                                       name="loginName" placeholder="enter your admin username"
                                       required autocomplete="off" value="${loginName}">
                            </div>
                        </div>

                        <div class="form-group ${loginPasswordClass }">
                            <label for="loginPassword">Password</label>
                            <div id="loginPasswordGroup" class="input-group">
                                <span id="loginPasswordSpan" class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <input type="password" class="form-control" id="loginPassword"
                                       name="loginPassword" placeholder="enter your admin password"
                                       required autocomplete="off">
                            </div>
                        </div>
                        <button type="submit" class="btn-block btn btn-success" id="submitButton">log in</button>                       
                        <div class="form-group">
                            <div class="checkbox">
                                <label for="loginRememberMe">
                                    <input type="checkbox" name="loginRememberMe" id="loginRememberMe" value="${empty(loginRememberMe) ? true : loginRememberMe}" checked>
                                    Remember me
                                </label>
                            </div>
                        </div>
                    </fieldset>
                    <em>(Don't have an account yet? <a onclick="switchLoginRegisterFrom()" id="registerButton">register now</a>)</em>
                    <br/>
                    <small>noot voor lector: username = admin, passwoord = admin</small>
                </form>
            </div>
        </div>
    </div>
</div>
