<%@tag  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@attribute name="newsfeeds" required="true" type="java.util.List" %>

<div class="row">
    <div class="col-md-offset-1 col-md-10">
        <!-- NEWSFEED FUNCTIONS -->

        <h1>Newsfeeds</h1>       
        <a class="btn btn-success btn-bottom-push" href="addNewsfeedPage.htm">
            <i class="fa fa-plus"></i> 
            <spring:message code="label.add.newsfeed"/>
        </a>

        <table class="table table-bordered table-hover table-responsive">
            <thead>
                <tr>
                    <th>DATE</th>
                    <th>STATE</th>
                    <th>SUBJECT</th>
                    <th>TEXT</th>
                    <th>OPS</th>
                </tr>
            </thead>
            <tbody>                    
                <c:forEach var="newsfeed" items="${newsfeeds}">
                    <tr>
                        <td>${newsfeed.date.time}</td>
                        <td>${newsfeed.state}</td>
                        <td>${newsfeed.subject}</td>
                        <td>${newsfeed.text}</td>
                        <td>
                            <a class="btn btn-sm btn-danger" href="deleteNewsfeed.htm?newsfeedID=${newsfeed.id}">
                                <i class="fa fa-trash-o fa-lg"></i>
                            </a>
                            <a class="btn btn-sm btn-primary" href="updateNewsfeedPage.htm?newsfeedID=${newsfeed.id}">
                                <i class="fa fa-pencil fa-lg"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </div>
</div>