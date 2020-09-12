<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
#myInpgfut {
  background-image: url('/css/searchicon.png');
  background-position: 10px 12px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

</style>
<body>
	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
<input type="text" class="form-control input-sm"   id='myInput' onkeyup='searchTable()' placeholder="Type to search">

		<div class="container">
			
			<br>
			<table class="table table-bordered" style="width:100%; border: 1px solid black"  id="myTable">
				<thead>
					<tr >
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

						<tr id="myTr">
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





</body>
<script type="text/javascript">
function searchTable() {
    var input, filter, found, table, tr, td, i, j;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                found = true;
            }
        }
        if (found) {
            tr[i].style.display = "";
            found = false;
        } else {
            tr[i].style.display = "none";
        }
    }
}
</script>
</html>