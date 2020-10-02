	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.project.been.objs.PharmacyDtls" %>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  
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
   
           
               
<div class="consultation__form">
<form action="addReport" id="form" name="yourMedicinesForm" method="post">
<input type="hidden" name="formAction" value="">
<input type="hidden" name="medicinesList" value="">
<input type="hidden" name="updateMedicinesList" value="">

<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
		
			<br>
<table id="medicines" align="left"  width="100%"> </table> <br>
<i class="icofont-ui-delete icofont-2x" style="cursor: pointer;" name="Remove" value="Remove" id="remove" ></i>
		</div>
	</div>
	
	

<table>
 <tbody>
 <tr><td> <label>Medicine Name <p id="medError"></p></label>  
     <input type="text" name="medicineName" id="medicineName" placeholder="Medicine Name" class="form-control" >
     <input type="hidden" name="medicineId" id="medicineId" placeholder="Medicine ID" class="form-control" ></td>
      <td><label class="col-md-2 control-label">Manufacture</label>
				
            <input type="text" name="manufacture" id="manufacture" placeholder="Manufacture" class="form-control" ></td>
      <td> <label>Batch No</label>
	        <input type="text" name="batchNo" id="batchNo" placeholder="Batch No" class="form-control"  ></td>
      <td>
      <label class="col-md-2 control-label">Exp.Date</label>

<input type="month"  min="2018-03" value="2018-05"name="expDate" id="expDate" placeholder="Exp.Date" class="form-control"   >
     
          </td>
            			<td>
			 <label class="col-md-2 control-label">Quantity<p id="qtyError"></p></label>  
			<input type="number" name="qty" id="qty" placeholder="Quantity" class="form-control"   >
			</td> 
			  
                </tr> <tr>     <td>
              <label class="col-md-2 control-label">Price<p id="priceError"></p></label>  
			<input type="text" name="price" id="price" placeholder="Price" class="form-control"   >
		</td>
 <td>
           
    
 
  <button class="btn btn-success" class="add" id="add">Add <i class="icofont-medicine"></i></button>
  <button class="btn btn-primary" class="update" id="update"> Update  <i class="icofont-pen-alt-4"></i></button></td> </tr>     
 </tbody>    	
 
 </table>
<button class="btn btn-success" type="button" onclick="doSubmit()">Submit  <i class="icofont-share-alt icofont-1x"></i></button>

</form>
  </div>
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