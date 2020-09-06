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
String isAddCustomerReport="false";
String isTodayAllReports="false";
String isAddAndUpdateMedicines="false";
if(request.getAttribute("isAddCustomerReport")!=null){
	 isAddCustomerReport =(String)request.getAttribute("isAddCustomerReport");
     pageContext.setAttribute("isAddCustomerReport",isAddCustomerReport);
}
if(request.getAttribute("isTodayAllReports")!=null){
	isTodayAllReports =(String)request.getAttribute("isTodayAllReports");
    pageContext.setAttribute("isTodayAllReports",isTodayAllReports);
}
if(request.getAttribute("isAddAndUpdateMedicines")!=null){
	isAddAndUpdateMedicines =(String)request.getAttribute("isAddAndUpdateMedicines");
    pageContext.setAttribute("isAddAndUpdateMedicines",isAddAndUpdateMedicines);
}
if(request.getAttribute("isAddCustomerActive")!=null){
	String isAddCustomerActive=(String)request.getAttribute("isAddCustomerActive");
	pageContext.setAttribute("isAddCustomerActive", isAddCustomerActive);
}
if(request.getAttribute("isTodayReportsActive")!=null){
	String isTodayReportsActive=(String)request.getAttribute("isTodayReportsActive");
	pageContext.setAttribute("isTodayReportsActive", isTodayReportsActive);
}
if(request.getAttribute("isAddMedicinesActive")!=null){
	String isAddMedicinesActive=(String)request.getAttribute("isAddMedicinesActive");
	pageContext.setAttribute("isAddMedicinesActive", isAddMedicinesActive);
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
                                <li  class="${isHomeActive}"><a href="medicalHomeTabsTag.jsp?isHomeActive=active">Home</a></li>
                                <li class="${isAddCustomerActive}" ><a href="/HospitalManagement/addReport?formAction=GOTO_REPORT">Add Customer Report</a></li>
                                <li  class="${isTodayReportsActive}"><a href="/HospitalManagement/totalBills?formAction=GOTO_TODAT_REPORT">Today Reports</a></li>
                                <li  class="${isAddMedicinesActive}"><a href="/HospitalManagement/addReport?formAction=LIST_MEDICINES">Add Your Medicines</a></li>
                               
                            </ul>
                        </nav>
                        <div class="header__btn">
                            <a href="/HospitalManagement/login?formAction=LOGOUT" class="primary-btn">Logout</a>
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

<c:if test="${isAddCustomerReport==true && isAddCustomerReport!=null}">
<jsp:include page="generateMedicineReport.jsp">
<jsp:param value="${doctorName}" name="doctorName"/>
<jsp:param value="${dataset}" name="dataset"/>
</jsp:include>

</c:if>
<c:if test="${isTodayAllReports==true && isTodayAllReports!=null}">

<jsp:include page="todayAllMedicinesBill.jsp"></jsp:include>

</c:if>
<c:if test="${isAddAndUpdateMedicines==true && isAddAndUpdateMedicines!=null}">

<jsp:include page="addYourMedicines.jsp"></jsp:include>

</c:if>


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

</html>