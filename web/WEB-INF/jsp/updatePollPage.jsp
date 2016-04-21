<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="mfa" tagdir="/WEB-INF/tags/"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <c:set var="url">${pageContext.request.requestURL}</c:set>
        <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />

        <mfa:header title="MFA Account"></mfa:header>

        </head>
        <body>
        <jsp:include page="includers/menu.jsp">
            <jsp:param name ="active" value="account_id"/>
        </jsp:include>


        <main role="main" class="content container-fluid">           
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8">
                    <form method="post" action="updatePoll.htm" autocomplete="OFF" modelAttribute="poll">
                        <c:if test="${fn:length(result) gt 0}">
                            <div class="alert alert-danger">
                                <c:forEach var="message" items="${result}">
                                    <p>${message}</p>
                                </c:forEach>
                            </div>
                        </c:if>
                        <fieldset>
                            <legend>New Poll creation</legend>
                            <input hidden="true" type="text" id="id" name="id" value="${poll.id}"/>
                            <!-- TODO use onblur/oninput for instant checks -->
                            <div class="form-group ${pollQuestionClass}">
                                <label for="pollQuestion" >
                                    QUESTION 
                                </label>
                                <input type="text" class="form-control" id="question" 
                                       name="question" placeholder="enter the poll question" autofocus
                                       required value="${poll.question}">
                            </div>


                            <div id="ThePollAnswers" class="form-group ${pollAnswerClass}">
                                <label for="pollAnswers">THE ANSWERS</label>

                                <!-- pollAnswersClnMaterial will be cloned by the js -->
                                <div id="pollAnswersClnMaterial" class="input-group" style="display: none;">
                                    <input type="text" class="form-control" id="pollAnswers"
                                           name="pollAnswersRoot" placeholder="enter a poll answer">
                                    <span  id="pollAnswersSpan" class="input-group-btn">
                                        <button id="pollAnswersRemoveButton" class="btn btn-danger" type="button" onclick="removeField('pollAnswers', this.parentNode.id)">
                                            <i class="fa fa-minus-circle"></i>
                                        </button>
                                    </span>
                                </div>
                                <span id="pollAnswersWriteroot"></span>
                                <!-- js will write new answers fields here -->
                                <c:forEach var="aPollAnswer" items="${poll.answers}" varStatus="position">
                                    <c:if test="${! empty aPollAnswer}">
                                        <script type="text/javascript"> addField('pollAnswers', '${aPollAnswer.answerText}')</script>
                                    </c:if>
                                </c:forEach>

                                <div>
                                    <button id="pollAnswersAddButton" class="btn btn-success" type="button" onclick="addField('pollAnswers')">
                                        <i class="fa fa-plus fa-lg"></i>
                                    </button>
                                </div>
                            </div>


                        </fieldset>

                        <a type="button" class="btn btn-danger" href="account.htm">
                            Back to Account Overview
                        </a>
                        <button type="submit" class="col-sm-2 btn btn-success pull-right" id="submitButton">submit</button>
                    </form>
                </div>
            </div>
        </main>

        <mfa:scripts/>
    </body>
</html>