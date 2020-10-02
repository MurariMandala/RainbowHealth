
<%
if(request.getParameter("doctorName")!=null){
	String doctorName = request.getParameter("doctorName");
pageContext.setAttribute("doctorName", doctorName);
}
if(request.getParameter("dataset")!=null){
	String dataset = request.getParameter("dataset");
pageContext.setAttribute("dataset", dataset);
}

%>
 <jsp:include page="listOfMedicines.jsp" />
<script type="text/javascript" src="js/addReportScript.js"></script>
 <link rel="stylesheet" href="css/mdb.css" type="text/css">
<br>
   <section class="consultation">
    
    
               
               <div class="consultation__form">
                      <form action="addReport" method="post" name="generateMedicineReportForm">
                    <div class="col-md-7 col-md-offset-7">
 <div class="container login-container">
            <div class="row">
                <div class="col-md-3 login-form-7">
           
                  
                 <div class="md-form md-inline">
                 
                 <input type="text" class="form-control" id="patientName" name="patientName"  value="${patientName}" />
                 <label for="inputValidationEx67" data-error="wrong" data-success="right">Patient Name</label>
                        </div>
            
                       <div class="md-form md-outline">

                 <input type="text"class="form-control"  id="saleType" name="saleType"  value="${saleType}" />
                       <label for="inputValidationEx67" data-error="wrong" data-success="right">SALE TYPE</label>  
                        </div>
               <div class="form-group">
             <p  style="font-weight: bold;">  Doctor Name : ${doctorName}</p>
               </div>
                
                </div>
                
              <div class="col-md-3 login-form-5">   
                  <div class="form-group"> </div>
                    <div class="form-group">
                    <input type="hidden" id="billNo" name="billNo" value="${billNo}">
                      <p  style = "position:relative; left:500px;font-weight: bold;" > Bill No :   ${billNo}</p>
                        </div>
                       
                      <div class="form-group">
 						<p  style = "position:relative; left:500px;font-weight: bold;" >Bill Date :   ${billDate}</p> 
                 <input type="hidden" id="billDate" name="billDate" value="${billDate}">
                            
                        </div>
                        
               </div> 
                
            </div>
        </div> </div> 
        
        
<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
		
			<br>
		 <table id="reportItems"  align="left" width="1150px"></table><br>
		  <i class="icofont-ui-delete icofont-2x" style="cursor: pointer;" name="Remove" value="Remove" id="remove" ></i>
		</div>
	</div>
	
	
                      
                        <input type="hidden" name="formAction" value="">
                        <input type="hidden" name="priceperone" id="priceperone" value="" />
                        <input type="hidden" name="addReportItems" value="">
                     <table>
                     <tr><td>
                    
                     <label class="col-md-5 control-label">Medicine Name</label>
                     <input type="text"  placeholder="Search Medicine Name" name="medicineName" id="medicineName"  readonly>
                      <input type="hidden" name="medicineId" id="medicineId" placeholder="Medicine ID"  >  </td>
  <td> <i class="icofont-search icofont-2x" style="cursor: pointer;" href="#myModal"  data-toggle="modal" href="#myModal"  data-toggle="modal"></i></td>
  
    </tr>     <tr>          
      <td>
    <div class="md-form md-outline">
                 
                 <input type="text" class="form-control" placeholder="Manufacture" id="manufacture" name="manufacture"  />
                 <label for="inputValidationEx67" data-error="wrong" data-success="right">Manufacture</label>
                        </div></td>
      <td>
       <div class="md-form md-outline">
                 
                 <input type="text" class="form-control" name="batchNo" id="batchNo" />
                 <label for="inputValidationEx67" data-error="wrong" data-success="right">Batch No</label>
                        </div>
                        </td>

<td><label class="col-md-2 control-label">Exp.Date</label>

<input type="month" min="2018-03" value="2018-05"name="expDate" id="expDate" placeholder="Exp.Date"    >
     
          </td>
            

       
			<td>
			 <label class="col-md-2 control-label">Quantity</label>
			<input type="number"  name="qty" id="qty" placeholder="Quantity"    >
			<input type="hidden" name="actualQty" id="actualQty" placeholder="Quantity"    ></td> 
			  
                </tr> <tr>     <td>
              <label class="col-md-2 control-label">Price</label>
			<input type="text"name="price" id="price" placeholder="Price"    ></td>
 
            <td>
              
     <label class="col-md-2 control-label">SGST%</label>
      <select name="sgst" id="sgst"   >
      <option value="">Select SGST%</option>
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select>
     
			</td>
			   
	<td> <label class="col-md-2 control-label">CGST%</label>
	  <select name="cgst"  id="cgst"   >
	    <option value="">Select CGST%</option>
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select></td>
           <td> <label class="col-md-2 control-label">TotAmount</label>
            <input type="text"   name="totItemAmount" id="totItemAmount" placeholder="TotAmount"  readonly="readonly"  ></td>
    <td>  <button class="btn btn-success" class="add" id="add">Add  <i class="icofont-plus-circle"></i></button></td>
                     </tr>
                     <tr>
   <td>  <label for="sgstTax" >SGST TAX  :</label>
<input type="text"  id="sgstTax" name="sgstTax"  placeholder="SGST TAX"  value="${sgstAmount}" readonly="readonly"  ></td>
  <td>  <label for="cgstTax">CGST TAX :</label>
   
<input type="text" id="cgstTax" name="cgstTax"  placeholder="CGST TAX"  value="${cgstAmount}" readonly="readonly"  ></td>
  
  <td>  <label for="netAmount">NetAmount:</label>
 <input type="text"   id="netAmount" name="netAmount" placeholder="NetAmount"   value="${netAmount}" readonly="readonly"  ></td>

 
  
   
   <td>  <label for="totAmount">TotAmount:</label>
   <input type="text"   id="totAmount" name="totAmount" placeholder="TotAmount"   value="${totAmount}" readonly="readonly"  ></td>
  </tr><tr> 
    <td>  <label for="doctor">Prepared By:</label>
  <input type="text"  placeholder="Prepared By" id="preparedBy" name="preparedBy" value="${preparedBy}"></td>
  
   <td>  <label for="doctor">Printed By:</label>
<input type="text"  id="printedBy" placeholder="Printed By"name="printedBy" value="${printedBy}"></td>
  
  
  
   <td>  <label for="paidAmount">PaidAmount:</label>
   <input type="text" placeholder="Paid Amount"  id="paidAmount" name="paidAmount" value="${paidAmount}"></td>
     <td>  
    
 


  </td>
   <td>  	
       <button style="margin-left: 30%;"class="btn btn-success" id="save" name="save" type="button" onclick="doSave();">Generate bill  <i class="icofont-save"></i></button>
       
   </td></tr>
 
                     </table>       
       
                        </form>
       </div></div>                   
                                 
    </section>

<script src="js/mdb.min.js"></script>


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
