<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <c:set var="url">${pageContext.request.requestURL}</c:set>
        <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />        
        <mfa:header title="MFA account"/>        
        </head>
        <body>
        <jsp:include page="/includers/menu.htm">
            <jsp:param name="active" value="account_id"/>
        </jsp:include>        
        <main role="main" class="content container-fluid">     
            <c:choose> 
                <c:when test="${empty sessionScope.loggedOnUser}">                     
                    <mfa:logInForm loginName="${loginName}" loginNameClass="${loginNameClass}" loginPasswordClass="${loginPasswordClass}" 
                                   loginRememberMe="${loginRememberMe}" messages="${messages}"/>
                    <mfa:registerForm registerName="${registerName}" registerNameClass="${registerNameClass}"
                                      registerPasswordClass="${registerPasswordClass}" user="${user}"/>
                    <script>
                        addLoadEvent($('#loginForm').hide());
                        addLoadEvent($('#registerForm').hide())
                    </script>

                    <c:choose>
                        <c:when test="${!empty(section) &&  section.equals('register')}">
                            <script>
                                addLoadEvent(toggleRegisterForm());
                            </script>
                        </c:when>
                        <c:otherwise>
                            <script>
                                addLoadEvent(toggleLoginForm());
                            </script>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise><!-- WHEN LOGGED IN AS ADMIN -->                     
                    <c:set var="section" value="${empty(adminSection) ? 'newsfeeds' : adminSection}"/>
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="${section == 'newsfeeds' ? 'active' : ''}">
                            <a href="#newsfeedManagement" aria-controls="newsfeedManagement" role="tab" data-toggle="tab">
                                <i class="fa fa-comments"></i> Newsfeed Manager
                            </a>
                        </li>
                        <li role="presentation" class="${section == 'polls' ? 'active' : ''}">
                            <a href="#polls" aria-controls="polls" role="tab" data-toggle="tab">
                                <i class="fa fa-bar-chart"></i> Polls Manager
                            </a>
                        </li>
                        <li role="presentation" class="${section == 'users' ? 'active' : ''}">
                            <a href="#users" aria-controls="users" role="tab" data-toggle="tab">
                                <i class="fa fa-users"></i> User manager
                            </a>                            
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane ${section == 'newsfeeds' ? 'active' : ''}" id="newsfeedManagement">
                            <mfa:newsfeedManager newsfeeds="${newsfeedItems}"/>
                        </div>

                        <div role="tabpanel" class="tab-pane ${section == 'polls' ? 'active' : ''}" id="polls">
                            <mfa:pollManager polls="${pollItems}"/>
                        </div>

                        <div role="tabpanel" class="tab-pane ${section == 'users' ? 'active' : ''}" id="users">
                            <mfa:userManager users="${users}"/>
                        </div>
                    </div>

                </c:otherwise>
            </c:choose>
        </main>
        <mfa:scripts/>
    </body>
</html>