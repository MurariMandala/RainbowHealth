<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="allImports.jsp"></jsp:include>
</head>

<body>
<form action="bookAppointment" name="viewAppointmentsForm" method="post">
<input type="hidden" name="formAction" value="">


 <select class="selectpicker" data-style="btn-primary" name="searchOption" id="searchOption" style="display: none;">
 
      <option data-icon="glyphicon glyphicon-music">Search Options</option>
      <option value="appointMentId"  data-icon="glyphicon glyphicon-star">AppointMent Id</option>
      <option value="phoneNo" data-icon="glyphicon glyphicon-heart">Phone No</option>
  </select>
	  <table id="appointments" class="cell-border" width="100%"></table>
	

</form>
</body>
<script type="text/javascript">
var appointmentDataSet=<c:out value="${appointmentDataSet}" escapeXml="false"/>;
alert(appointmentDataSet);
$(document).ready(function() {
	 $('appointments').DataTable({
		 data: appointmentDataSet,
		   columns: [
	            { title: "Appointment Id" },
	            { title: "Name" },
	            { title: "Phone No" },
	            { title: "Type Of Service" },
	            { title: "Date" },
	            { title: "Action" }
	            
	        ]
	});
});

function doSearch() {
var searchOption=document.getElementById("searchOption").value;
var search=	document.getElementById("search").value;
//alert(searchOption);
//alert(search);
	document.forms["viewAppointmentsForm"].elements["formAction"].value="SEARCH";
	document.forms["viewAppointmentsForm"].submit();
}
</script>
</html>