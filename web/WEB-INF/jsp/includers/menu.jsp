<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header navbar-inner">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#prim-nav">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand col-lg-1" href="index.htm"> MFA</a>
                </div>
                <div class="collapse navbar-collapse col-lg-10 col-md-10 col-sm-10 col-sm-offset-1 col-lg-offset-1 col-md-offset-1 col-xs-offset-0" id="prim-nav">
                    <!-- InstanceBeginEditable name="navigation" -->
                    <ul class="nav nav-tabs nav-justified ">
                        <c:forEach var="menuItem" items="${menuItems}">
                            <c:set var="elementID" value="${menuItem.action}_id"></c:set>
                            <li class="${param.active == elementID ? 'active' : 'none'}">
                                <a id="${elementID}" href="${menuItem.action}.htm">
                                    ${menuItem.description}
                                </a>
                            </li> 
                        </c:forEach>
                    </ul>
                </div>				
            </div>
            <div class="row">
                <div class="container-fluid languages">
                    <div class="col-xs-10 btngroup">
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-fw fa-language"> </i> 
                            <spring:message code="label.language.choise"/> 
                            <i class="caret"> </i>
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <a href=" ${fn:replace(param.active, "_id","")}.htm?lang=nl">
                                    Nederlands 
                                    <img class="pull-right" height="30px" alt="nl" title="Nederlands" src="<c:url value="/resources/images/languages/nl.png"/>">
                                </a>
                            </li>
                            <li>
                                <a href=" ${fn:replace(param.active, "_id","")}.htm?lang=en">
                                    English 
                                    <img class="pull-right" height="30px" alt="en" title="English" src="<c:url value="/resources/images/languages/en.png"/>">
                                </a>                                                                
                            </li>
                        </ul>
                    </div>
                    <div class="col-xs-2">
                        <div class="pull-right">
                            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-fw fa-user"></i><c:out value="${empty sessionScope.loggedOnUser ? 'Not logged in' : sessionScope.loggedOnUser.username}"></c:out> <i class="caret"> </i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                    <c:choose>
                                        <c:when test="${empty sessionScope.loggedOnUser}">
                                            <a href="adminAccount.htm">
                                                <i class="fa fa-gw fa-key"></i> 
                                                Log in
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="logout.htm?page=${fn:replace(param.active, "_id","")}">
                                                <i class="fa fa-gw fa-power-off"></i> 
                                                Log out
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
