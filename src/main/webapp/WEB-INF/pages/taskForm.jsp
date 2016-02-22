<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Task Information</title>
  <!-- Bootstrap CSS -->
  <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <style type="text/css">
    .myrow-container{
      margin: 20px;
    }
  </style>
</head>
<body style="background-color: #eee">
<div class="container" style="width: 800px">
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">
        <div align="center"><b>Todo Details</b> </div>
      </h3>
    </div>
    <div class="panel-body">
      <form:form name="form" id="employeeRegisterForm" cssClass="form-horizontal" modelAttribute="task" method="post" action="saveTask">

        <div class="form-group">
          <div class="control-label col-xs-3"></div>
          <div class="col-xs-6">
            <form:hidden path="id" value="${taskObject.id}"/>
            <form:textarea cssClass="form-control" value="${taskObject.task}" path="task" placeholder="Enter task"></form:textarea>
          </div>
        </div>

        <div class="form-group">
          <div class="row">
            <div class="col-md-4">
            </div>
            <div align="center" class="col-md-4">
              <input type="submit" id="saveTask" class="btn btn-primary" value="Save" onclick="return submitEmployeeForm();"/>
              <input type="submit" class="btn btn-default" value="Cancel" onclick="cancel();"/>
            </div>
            <div class="col-md-4">
            </div>
          </div>
        </div>
      </form:form>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
  function submitEmployeeForm() {

    // getting the employee form values
    var name = $('#task').val().trim();
    if(name.length ==0) {
      alert('Please enter text');
      $('#task').focus();
      return false;
    }
    return true;
  }
  function cancel() {
    form.action = "getAllTasks";
    form.submit();
  }
</script>

</body>
</html>