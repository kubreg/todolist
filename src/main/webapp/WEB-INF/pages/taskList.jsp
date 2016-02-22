<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Employees List</title>
  <!-- Bootstrap CSS -->
  <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <style type="text/css">
    .myrow-container {
      margin: 20px;
    }
  </style>
</head>
<body style="background-color: #eee">
<div class="container" style="width: 800px">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <div align="center"><b>Todo List</b> </div>
        <div class="row">
          <div align="left" class="col-md-8">
            <ul class="nav nav-pills nav-pills-sm">
              <li><a href="getAllTasks">Show all</a></li>
              <li><a href="getIncompleteTasks">Show incomplete</a></li>
              <li><a href="getCompletedTasks">Show complete</a></li>
            </ul>
          </div>
          <div align="right" class="col-md-4">
            <form action="createTask" method="post">
              <button type="submit" class="btn btn-primary btn-sm">Add New Task</button>
            </form>
          </div>
        </div>
      </h3>
    </div>
    <div class="panel-body">
      <c:if test="${empty taskList}">
        There are no Employees
      </c:if>
      <c:if test="${not empty taskList}">

        <table class="table table-hover table-bordered">
          <thead style="background-color: #bce8f1;">
          <tr>
            <th><div align="center">Task</div></th>
            <th></th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${taskList}" var="emp">
            <tr <c:if test="${emp.done}"> class="success" </c:if> <c:if test="${!emp.done}"> class="warning" </c:if>>
              <th class="col-md-8">
                <c:out value="${emp.task}"/>
                <br>
                <small>
                  <fmt:formatDate value="${emp.created}" pattern="dd.MM.yyyy"/>
                  <c:if test="${emp.done}">
                    <c:out value=" - "/>
                    <fmt:formatDate value="${emp.completed}" pattern="dd.MM.yyyy"/>
                  </c:if>
                </small>
              </th>
              <th class="col-md-1">
                <div align="center">
                  <c:if test="${!emp.done}">
                    <a href="completeTask?id=<c:out value='${emp.id}'/>">
                      <span class="glyphicon glyphicon-ok"/>
                    </a>
                    <a href="editTask?id=<c:out value='${emp.id}'/>">
                      <span class="glyphicon glyphicon-pencil"/>
                    </a>
                  </c:if>
                  <c:if test="${emp.done}">
                    <a href="incompleteTask?id=<c:out value='${emp.id}'/>">
                      <span class="glyphicon glyphicon-remove"/>
                    </a>
                  </c:if>
                  <a href="deleteTask?id=<c:out value='${emp.id}'/>">
                    <span class="glyphicon glyphicon-trash"/>
                  </a>
                </div>
              </th>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </c:if>
    </div>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  <%-- <script src="<c:url value="/resources/js/jquery-2.1.3.js"/>"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
   --%>

</body>
</html>