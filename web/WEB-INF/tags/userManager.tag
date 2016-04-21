<%@tag  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@attribute name="users" required="true" type="java.util.List" %>

<div class="row">
    <div class="col-md-offset-1 col-md-10">
        <!-- USER FUNCTIONS -->

        <h1>Users</h1>       
        <a class="btn btn-success btn-bottom-push" href="addUserPage.htm">
            <i class="fa fa-user-plus"></i> 
            <spring:message code="label.add.user"/>
        </a>

        <table class="table table-bordered table-hover table-responsive">
            <thead>
                <tr>
                    <th>USERNAME</th>
                    <th>PASSWORD</th>
                    <th>ADMIN</th>
                    <th>OPS</th>
                </tr>
            </thead>
            <tbody>                    
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.pw}</td> <!-- Should not be shown once online -> admins should not know user passwords -->
                        <td>${user.adminState}</td>
                        <td>
                            <a class="btn btn-sm btn-danger" href="deleteUser.htm?userID=${user.id}">
                                <i class="fa fa-user-times fa-lg"></i>
                            </a>
                            <a class="btn btn-sm btn-primary" href="updateUserPage.htm?userID=${user.id}">
                                <i class="fa fa-pencil fa-lg"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>            

    </div>
</div>