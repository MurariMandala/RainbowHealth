	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.project.been.objs.PharmacyDtls" %>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
         <jsp:include page="listOfMedicines.jsp" />
<!DOCTYPE html>
<html>
<head>
	

   <link rel="stylesheet" type="text/css" href="css/boot1.css" />
  <link rel="stylesheet" type="text/css" href="css/mp5DetailsLayout.css" />
   <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> --> 
<link rel="stylesheet" type="text/css" href="css/mp5GlobalStyle.css" />
  
 
 <script type="text/javascript" src="js/addReportScript.js"></script>
</head>
<body>
<%
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls dtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaName", dtls.getPharmacyName());
}
if(request.getParameter("doctorName")!=null){
	String doctorName = request.getParameter("doctorName");
pageContext.setAttribute("doctorName", doctorName);
}
if(request.getParameter("dataset")!=null){
	String dataset = request.getParameter("dataset");
pageContext.setAttribute("dataset", dataset);
}
%>
   
  <!-- main form starts from here -->
     <section class="consultation">
   
           
               

                      <form action="addReport" method="post" name="generateMedicineReportForm">
    <input type="hidden" name="formAction" value="">
                        <input type="hidden" name="priceperone" id="priceperone" value="" />
                        <input type="hidden" name="addReportItems" value="">

	<div class="container-fluid">
	  <div class="row">
 
  <div class="col-md-8 ">  
 
<div class="col-md-12 mrn-input">
 <table>
  <tr>
  <td> <div class="form-group col-md-10  ">
  <label class="control-label">Patient Name</label>
<input class="form-control form-control-sm" id="patientName" name="patientName"  value="${patientName}" type="text" />
  </div></td>
  
  <td> <div class="form-group col-md-10  ">
  <label class="control-label">Sale Type</label>
<input class="form-control form-control-sm"  id="saleType" name="saleType"  value="${saleType}" type="text"/>
  
  </div></td>
  <td>  <div class="form-group col-md-4  ">
  <label class="control-label">Bill No</label>
<input class="form-control form-control-lg" type="text"id="billNo" name="billNo" value="${billNo}"/>
  </div></td>
  <td><div class="form-group col-md-4  ">
  <label class="control-label">Bill Date</label>
<input class="form-control form-control-sm"id="billDate" name="billDate" value="${billDate}"type="text"/>
  </div></td>
  
  </tr>
  </table>
 
  
   <div class="form-group col-md-4  ">
  <label class="control-label">Doctor Name</label>
<input class="form-control form-control-sm" value="${doctorName}" type="text"/>
  
  </div>
  
    
   
  
</div></div></div></div>
	<!--  items section -->
	
<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
		
			<br>
<table id="reportItems"  align="left" width="1150px"></table><br>
<i class="icofont-ui-delete icofont-2x" style="cursor: pointer;" name="Remove" value="Remove" id="remove" ></i>
		</div>
	</div>
	<div class="container-fluid">
	  <div class="row">
 
  <div class="col-md-8 ">  
  
<div class="col-md-12 mrn-input">
  <div class="form-group col-md-4  ">
  <label class="control-label">Medicine Name</label>
<input class="form-control form-control-sm" name="medicineName" id="medicineName"  readonly type="text" />
<input type="hidden" name="medicineId" id="medicineId" > 
<i class="icofont-search icofont-2x" style="cursor: pointer;" href="#myModal"  data-toggle="modal"></i>
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Manufacture</label>
<input class="form-control form-control-sm" id="manufacture" name="manufacture"  type="text"/>
  
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Batch No</label>
<input class="form-control form-control-sm"  name="batchNo" id="batchNo" type="text"/>
  
  </div>
  
      <div class="form-group col-md-4  ">
  <label class="control-label">Exp.Date</label>
<input class="form-control form-control-sm" type="month"  min="2018-03" value="2018-05" name="expDate" id="expDate"/>
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Quantity</label>
  	<input type="hidden" name="actualQty" id="actualQty" placeholder="Quantity"    >
<input class="form-control form-control-sm"name="qty" id="qty" type="text"/>
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">Price</label>
<input class="form-control form-control-sm"name="price" id="price" type="text"/>
  </div>
  
   <div class="form-group col-md-4  ">
  <label class="control-label">SGST%</label>
  <select  class="form-control form-control-sm"  name="sgst" id="sgst"   >
      <option value="">Select SGST%</option>
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select>
  </div>
   <div class="form-group col-md-4  ">
  <label class="control-label">CGST%</label>
<select  class="form-control form-control-sm"  name="cgst"  id="cgst"   >
	    <option value="">Select CGST%</option>
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select>
  </div>
     <div class="form-group col-md-4  ">
  <label class="control-label">TotAmount</label>
<input class="form-control form-control-sm" name="totItemAmount" id="totItemAmount"  type="text"/>
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


  <div class="form-group col-md-4  ">
  <label class="control-label">SGST TAX </label>
<input class="form-control form-control-sm" id="sgstTax" name="sgstTax"  value="${sgstAmount}" readonly="readonly" type="text"/>
  </div>   
  <div class="form-group col-md-4  ">
  <label class="control-label">CGST TAX </label>
<input class="form-control form-control-sm"id="cgstTax" name="cgstTax"   value="${cgstAmount}" readonly="readonly"type="text"/>
  </div>   
  <div class="form-group col-md-4  ">
  <label class="control-label">NetAmount </label>
<input class="form-control form-control-sm"  id="netAmount" name="netAmount"  value="${netAmount}" readonly="readonly"  type="text"/>
  </div> 
   <div class="form-group col-md-4  ">
  <label class="control-label">TotAmount </label>
<input class="form-control form-control-sm"  id="totAmount" name="totAmount"  value="${totAmount}" readonly="readonly"  type="text"/>
  </div>
  
   <div class="form-group col-md-4  ">
  <label class="control-label">Prepared By</label>
<input class="form-control form-control-sm"  id="preparedBy" name="preparedBy" value="${preparedBy}" type="text"/>
  </div>
  <div class="form-group col-md-4  ">
  <label class="control-label">Printed By</label>
<input class="form-control form-control-sm"  id="printedBy" name="printedBy" value="${printedBy}" type="text"/>
  </div>
  
  <div class="form-group col-md-4  ">
  <label class="control-label">PaidAmount</label>
<input class="form-control form-control-sm" id="paidAmount" name="paidAmount" value="${paidAmount}" type="text"/>
  </div>
  
   <div class="form-group col-md-8">
  	 <div class="searchResult">
   
   		<div class="newEditBtn pt-2">
   	
									<button type="button" class="btn save btn-primary btn-sm"  onclick="doSave();"><span>Generate bill </span></button>
							
								
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
function doSave(){
	//alert("1");
	var paidAmount=document.getElementById('paidAmount').value;
	if(paidAmount==''||paidAmount=='undefined'){
		alert("please provide the value for paidAmount");
	return false;
	}else{
		document.forms["generateMedicineReportForm"].elements["formAction"].value="REPORT_SAVE";
		document.forms["generateMedicineReportForm"].submit();
		
	}
   }
var dataset=${dataset}
</script>
</html>