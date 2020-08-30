	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.project.been.objs.PharmacyDtls" %>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="js/addMedicines.js"></script>
</head>
<body>
<%
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls dtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaName", dtls.getPharmacyName());
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
                                <li><a href="/HospitalManagement/addReport?formAction=GOTO_REPORT">Add Customer Report</a></li>
    							<li><a href="/HospitalManagement/totalBills?formAction=GOTO_TODAT_REPORT">Today Reports</a></li>
                                <li><a href="#">Add Your Medicines</a></li>
                               
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
  <!-- main form starts from here -->
     <section class="consultation">
   
           
               
<div class="consultation__form">
<form action="addReport" name="yourMedicinesForm" method="post">
<input type="hidden" name="formAction" value="">
<input type="hidden" name="medicinesList" value="">
<input type="hidden" name="updateMedicinesList" value="">
<table id="medicines" align="left" class="cell-border" width="50%"> </table>
<i class="icofont-ui-delete icofont-2x" style="cursor: pointer;" name="Remove" value="Remove" id="remove" ></i>

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
			<input type="text" name="price" id="price" placeholder="Price" class="form-control"   ></td>
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
function doSubmit() {
//	alert("dosubmit");
	
	document.forms["yourMedicinesForm"].elements["formAction"].value="SAVE_MEDICINES";
	document.forms["yourMedicinesForm"].submit();
}

var dataset=<c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>