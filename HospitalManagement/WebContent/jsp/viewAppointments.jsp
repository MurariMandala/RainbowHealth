<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Appointment ID</th>
						<th>Patient Name</th>
						<th>Phone No</th>
						<th>Date</th>
						<th>Type Of Service</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="appointments" items="${appointmentsList}">

						<tr>
							<td><c:out value="${appointments.bookkingId}" /></td>
							<td><c:out value="${appointments.name}" /></td>
							<td><c:out value="${appointments.phoneNo}" /></td>
							<td><c:out value="${appointments.date}" /></td>
							<td><c:out value="${appointments.typeOfService}" /></td>
							
							<td><a href="edit?id=<c:out value='${appointments.bookkingId}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${appointments.bookkingId}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
	
<h1></h1>




</body>
</html>