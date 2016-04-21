<%@tag  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@attribute name="polls" required="true" type="java.util.List" %>

<div class="row">
    <div class="col-md-offset-1 col-md-10">
        <h1>Polls</h1>
        <a class="btn btn-success btn-bottom-push" href="addPollPage.htm">
            <i class="fa fa-plus"></i> 
            <spring:message code="label.add.poll"/>
        </a>

        <table class="table table-bordered table-hover table-responsive">
            <thead>
                <tr>
                    <th>DATE</th>
                    <th>STATE</th>
                    <th>QUESTION</th>
                    <th>ANSWERS</th>
                    <th>OPS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="poll" items="${polls}">
                    <tr>
                        <td>${poll.date.time}</td>
                        <td>${poll.state}</td>
                        <td>${poll.question}</td>
                        <td>${poll.answers}</td>
                        <td>
                            <a class="btn btn-sm btn-danger" href="deletePoll.htm?pollID=${poll.id}">
                                <i class="fa fa-trash-o fa-lg"></i>
                            </a>
                            <a class="btn btn-sm btn-primary" href="updatePollPage.htm?pollID=${poll.id}">
                                <i class="fa fa-pencil fa-lg"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>
</div>
