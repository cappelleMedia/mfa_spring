<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <c:set var="url">${pageContext.request.requestURL}</c:set>
        <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />
        <mfa:header title="MFA Home"/>
    </head>

    <body>

        <jsp:include page="/includers/menu.htm">
            <jsp:param name="active" value="index_id"/>
        </jsp:include>        
        <main role="main" class="home content container-fluid">

            <div id="carousel-home-mini" class="carousel slide row visible-sm visible-xs">
                <li data-target="#carousel-home-mini" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-home-mini" data-slide-to="1" ></li>
            </div>

            <div id="carousel-home" class="carousel slide row visible-lg visible-md" data-ride="carousel">

                <ol class="carousel-indicators">
                    <li data-target="#carousel-home" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-home" data-slide-to="1"></li>
                </ol>

                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="item-holder container-fluid">
                            <div class="item-headings row">
                                <div class="item-cat col-md-offset-1 col-md-3">
                                    <h2>Food of the week</h2>
                                </div>
                                <div class="item-title col-md-8">
                                    <h2>Stir-fried chicken with broccoli &amp; brown rice</h2>
                                </div>
                            </div>

                            <div class="item-contents row">
                                <div class="col-md-offset-1 col-md-3">                                    
                                    <img class="item-contents-img" src="resources/images/foodsOfTheWeek/srces/chickBrocRic.jpg" alt="Chicken broccoli and rice"/>
                                </div>
                                <div class="item-text col-md-4">
                                    <h3 class="item-text-title">General info</h3>
                                    <ul class="item-text-content-list">
                                        <li><b>Preptime:</b> 30 mins</li>
                                        <li><b>Difficulty:</b> Easy</li>
                                        <li><b>Servings:</b> 2</li>
                                        <li><b>Ingredients:</b>
                                            <ul>
                                                <li>200g Broccoli</li>
                                                <li>1 Chicken breast</li>
                                                <li>250g cooked brown rice</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="item-text col-md-4">
                                    <h3 class="item-text-title">Stats</h3>
                                    <ul class="item-text-content-list">
                                        <li><b>Proteins:</b> 100g</li>
                                        <li><b>Carbs</b> 150g</li>
                                        <li><b>Fats:</b> 100g</li>
                                        <li><b>Fibers: </b> 80g</li>
                                        <li><b>Sugars: </b> 20g</li>
                                        <li><b>Vitamins: </b> K, C, B1, B2, B3, B6, E, A</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-offset-5 col-md-2">
                                    <a href="extras.htm" class="caption center-block text-center btn btn-primary">Get full recipe here</a>
                                </div>
                            </div>
                        </div>                        
                    </div>    
                    <div class="item">
                        <div class="item-holder container-fluid">
                            <div class="item-headings row">

                                <div class="item-title col-md-offset-3 col-md-8">
                                    <h2>Welcoming bonus</h2>
                                </div>
                            </div>

                            <div class="item-contents row">
                                <div class="item-text col-md-offset-3 col-md-4">
                                    <h3 class="item-text-title">Join now and get</h3>                                    
                                    <ul class="item-text-content-list">
                                        <li>
                                            <b>Life time premium access with: </b>
                                            <ul>
                                                <li>Full access to all foods of the week</li>
                                                <li>Full access to all polls</li>
                                                <li>Creation of your own polls</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <b>A discount on our products:</b>
                                            <ul>
                                                <li>
                                                    10&percnt; on all combi plans (food + excersise plan)
                                                </li>
                                                <li>
                                                    8&percnt; on all food plans
                                                </li>
                                                <li>
                                                    5&percnt; on all excersise plans
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="item-text col-md-5">
                                    <h3 class="item-text-title">Our products</h3>
                                    <ul class="item-text-content-list">
                                        <li>
                                            <b>Foodplan formula's</b>
                                            <ul>
                                                <li>
                                                    3 months food plan [15 euro]
                                                </li>
                                                <li>
                                                    6 months food plan (Renewed after 3 months)[25 euro]
                                                </li>
                                                <li>
                                                    1 year food plan (Renewed every 2 months)[40 euro]
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <b>Excercise formula's</b>
                                            <ul>
                                                <li>
                                                    3 month excersise plan [10 euro]
                                                </li>
                                                <li>
                                                    6 month excersise plan (Renewed after 3 months)[15 euro]
                                                </li>
                                                <li>
                                                    1 Year excersise plan (Renewed every 3 months)[25 euro]
                                                </li>
                                            </ul>
                                        </li>                                        
                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="col-md-offset-5 col-md-2">
                                        <a href="products.htm" class="caption center-block text-center btn btn-primary">Browse our products</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>     
                </div>

                <a class="left carousel-control" href="#carousel-home" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-home" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div> 
            <div class="row">                
                <div id="info" class="col-md-push-3 col-md-6">
                    <div class="home-panel panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-tittle">
                                <spring:message code="label.welcome.heading"/>
                            </div>
                        </div>
                        <div class="panel-body scroll-panel">
                            <h3><spring:message code="label.welcome.title"/></h3>
                            <p>
                                <spring:message code="label.welcome.text"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div id="polls" class="col-md-3 col-md-pull-6">
                    <div class="home-panel panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-tittle">
                                Newsfeed
                            </div>
                        </div>
                        <div class="panel-body scroll-panel">
                            <c:forEach var="newsfeedItem" items="${newsfeedItems}">
                                <c:set var="idOfNewsfeedItem" value="${newsfeedItem.id}"></c:set>
                                    <div class="panel-body-item">
                                        <h4>${newsfeedItem.subject}</h4>
                                    <p>${newsfeedItem.text}</p>
                                    <small>
                                        ${newsfeedItem.date.time}
                                    </small>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div id="news" class="col-md-3">
                    <div class="home-panel panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-tittle text-right">
                                Polls
                            </div>
                        </div>
                        <div class="panel-body scroll-panel">

                            <c:forEach var="pollItem" items="${pollItems}" varStatus="pollsLoop">
                                <c:set var="idOfPollItem" value="${pollItem.id}"></c:set>
                                    <div class="panel-body-item">
                                        <h4>${pollItem.question}</h4>
                                    <c:forEach var="answer" items="${pollItem.answers}" varStatus="loop">
                                        <form class="${!loop.last ? 'polAns' : ''}" method="post" id="addPollVote_id" action="addPollAnswerVote.htm">
                                            <input type="hidden" name="poll" value="${pollItem.id}"/>
                                            <input type="hidden" name="answerId" value="${answer.id}">
                                            <button type="submit" class="btn btn-primary">
                                                ${answer.answerText} (votes: ${answer.votes})
                                            </button>
                                        </form>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer>
            <div class="container-fluid">
                <div class="row icon-holder">
                    <div class="icon-col col-xs-offset-1 col-xs-1">
                        <a class="fb-icon" href="https://wwww.facebook.com/musclefoodadviser">
                            <i class="fa fa-facebook-official fa-3x"></i>
                        </a>
                    </div>
                    <div class="icon-col col-xs-offset-2 col-xs-1">
                        <a class="twit-icon" href="#">
                            <i class="fa fa-twitter-square fa-3x"></i>
                        </a>
                    </div>
                    <div class="icon-col col-xs-offset-2 col-xs-1">
                        <a class="lin-icon" href="#">
                            <i class="fa fa-linkedin-square fa-3x"></i>
                        </a>
                    </div>
                    <div class="icon-col col-xs-offset-2 col-xs-1">
                        <a class="twit-icon" href="#">
                            <i class="fa fa-envelope-square fa-3x"></i>
                        </a>
                    </div>
                </div>               
            </div>
        </footer>

        <mfa:scripts/>
    </body>
</html>

