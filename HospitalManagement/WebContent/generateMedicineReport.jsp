<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.project.been.objs.PharmacyDtls" %>
 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Aesthetic Template">
    <meta name="keywords" content="Aesthetic, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Aesthetic</title>
<jsp:include page="allImports.jsp"></jsp:include>
  <jsp:include page="listOfMedicines.jsp" />
<script type="text/javascript" src="js/addReportScript.js"></script>
    <!-- Google Font -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet"> -->
<link rel="stylesheet" href="/HospitalManagement/icofont/icofont.min.css">
</head>
<body>
<%
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls dtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaName", dtls.getPharmacyName());
	pageContext.setAttribute("doctorName", dtls.getDoctorName());
}
%>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__btn">
            <a href="#" class="primary-btn">Appointment</a>
        </div>
        <ul class="offcanvas__widget">
            <li><i class="fa fa-phone"></i> 9666689168</li>
            <li><i class="fa fa-map-marker"></i> tr nagar jenda road Hno:9-8-2</li>
            <li><i class="fa fa-clock-o"></i> Mon to Sat 9:00am to 18:00pm</li>
        </ul>
        <div class="offcanvas__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="https://www.instagram.com/murari______mandala/"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-dribbble"></i></a>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="header__top__left">
                   <li><i class="fa fa-phone"></i> 9666689168</li>
            <li><i class="fa fa-map-marker"></i> tr nagar jenda road Hno:9-8-2</li>
            <li><i class="fa fa-clock-o"></i> Mon to Sat 9:00am to 18:00pm</li>
                        </ul>
                    </div>
                    <div class="col-lg-4">
                        <div class="header__top__right">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                           <a href="https://www.instagram.com/murari______mandala/"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-dribbble"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="header__menu__option">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="medicalHome.jsp">Home</a></li>
                                <li><a href="#">Add Customer Report</a></li>
                                <li><a href="/HospitalManagement/totalBills?formAction=GOTO_TODAT_REPORT">Today Reports</a></li>
                                <li><a href="/HospitalManagement/addReport?formAction=LIST_MEDICINES">Add Your Medicines</a></li>
                               
                            </ul>
                        </nav>
                        <div class="header__btn">
                            <a href="#" class="primary-btn">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
     <section class="hero spad set-bg" data-setbg="img/hero-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="hero__text">
                        <span>Eiusmod tempor incididunt </span>
                        <h2>${pharmaName}</h2>
                     
                    </div>
                </div>
            </div>
        </div>
    </section>
<br>
   <section class="consultation">
    
           
               
               <div class="consultation__form">
                      <form action="addReport" method="post" name="generateMedicineReportForm">
                    <div class="col-md-7 col-md-offset-7">
 <div class="container login-container">
            <div class="row">
                <div class="col-md-3 login-form-7">
           
                  
                 <div class="form-group">
                 
                 <c:if test="${patientId ==0 || patientId==null}"> <input type="text"placeholder="PATIENT NAME" id="patientName" name="patientName"  value="${patientName}" /></c:if>
                 <c:if test="${patientId !=0 && patientId !=null }">
                 <p  style="font-weight: bold;"> Patient Name  :${patientName} </p></c:if>           
                        </div>
            
                      <div class="form-group">

                 <c:if test="${patientId ==0 || patientId==null}"> <input type="text" placeholder="SALE TYPE" id="saleType" name="saleType"  value="${saleType}" /></c:if>
                <c:if test="${patientId !=0 && patientId !=null }"> <p  style="font-weight: bold;">Sales Type  :${saleType} </p></c:if>         
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
        </div> </div> <table id="reportItems"  align="left" width="950px"></table>
                       <i class="icofont-ui-delete icofont-2x" style="cursor: pointer;" name="Remove" value="Remove" id="remove" ></i>
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
      <td><label class="col-md-2 control-label">Manufacture</label>
				
            <input type="text" name="manufacture"  id="manufacture" placeholder="Manufacture"  readonly  ></td>
      <td> <label>Batch No</label>
	        <input type="text" name="batchNo" id="batchNo"  placeholder="Batch No"   readonly ></td>

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
    <td>  <button class="site-btn" class="add" id="add">Add  <i class="icofont-plus-circle"></i></button></td>
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
       <button style="margin-left: 30%;"class="site-btn" id="save" name="save" type="button" onclick="doSave();">Generate bill  <i class="icofont-save"></i></button>
       
   </td></tr>
 
                     </table>       
       
                        </form>
       </div></div>                   
                                 
    </section>
    <!-- Js Plugins -->
  
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/masonry.pkgd.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
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
var dataset= <c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>