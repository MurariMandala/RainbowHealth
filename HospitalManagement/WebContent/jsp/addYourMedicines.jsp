	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.project.been.objs.PharmacyDtls" %>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/mp5DetailsLayout.css" />
<link rel="stylesheet" type="text/css" href="css/mp5GlobalStyle.css" />
  
<script type="text/javascript" src="js/addMedicines.js"></script>
</head>
<body>
<%
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls dtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaName", dtls.getPharmacyName());
}
%>
   
  <!-- main form starts from here -->
     <section class="consultation">
   
           
               

<form action="addReport" id="form" name="yourMedicinesForm" method="post">
<input type="hidden" name="formAction" value="">
<input type="hidden" name="medicinesList" value="">
<input type="hidden" name="updateMedicinesList" value="">
<input type="hidden" name="medicineId" id="medicineId">
<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
		
			<br>
<table id="medicines" align="left"  width="100%"> </table> <br>
<i class="icofont-ui-delete icofont-2x" style="cursor: pointer;" name="Remove" value="Remove" id="remove" ></i>
		</div>
	</div>
	<div class="container-fluid">
	  <div class="row">
 
  <div class="col-md-8 ">  
  
<div class="col-md-12 mrn-input">
  <div class="form-group col-md-4  ">
  <label class="control-label">Medicine Name</label>
<input class="form-control form-control-sm" name="medicineName" id="medicineName" type="text" />
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Manufacture</label>
<input class="form-control form-control-sm"name="manufacture" id="manufacture" type="text"/>
  
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Batch No</label>
<input class="form-control form-control-sm"name="batchNo" id="batchNo" type="text"/>
  
  </div>
  
      <div class="form-group col-md-4  ">
  <label class="control-label">Exp.Date</label>
<input class="form-control form-control-sm" type="month"  min="2018-03" value="2018-05"name="expDate" id="expDate"/>
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Quantity</label>
<input class="form-control form-control-sm"name="qty" id="qty" type="text"/>
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Price</label>
<input class="form-control form-control-sm" name="price" id="price" type="text"/>
  </div>
   <div class="form-group col-md-8">
  	 <div class="searchResult">
   
   		<div class="newEditBtn pt-2">
   	
									<button type="button" class="btn save btn-primary btn-sm" id="add"><span>Add</span></button>
									
									<button type="button" class="btn update btn-primary btn-sm" id="update" ><span>Update</span></button>
									<button type="button" class="btn save btn-primary btn-sm" name="Upload" value="Upload" id="Upload" onclick="doSubmit()"><span>Submit</span></button>
								
	 </div>
</div>

 
</div>    
</div></div></div></div>
	

<table>

 </tbody>    	
 
 </table>


</form>

  </section>
<br>
</body>
 
</body>
<script type="text/javascript">
function doSubmit() {
//	alert("dosubmit");
	
	document.forms["yourMedicinesForm"].elements["formAction"].value="SAVE_MEDICINES";
	document.forms["yourMedicinesForm"].submit();
}

var dataset=<c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>