<%@page import="com.mysql.cj.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="com.project.been.objs.MedicalReportDtls" %>
    <%@page import="com.project.been.objs.PharmacyDtls" %>
    <jsp:include page="allImports.jsp" />
    
<!DOCTYPE html>
<html>
<head>

    
<style type="text/css">
body{
/*  background-image: url("https://www.toptal.com/designers/subtlepatterns/patterns/ignasi_pattern_s.png"); */
}
.searchbtn{
  float: left;
  width: 15%;
  padding: 5px;
  color: black;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}
</style>
<meta charset="ISO-8859-1">
<title class="title" >Medical Report</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/MedicalReport/icofont/icofont.min.css">
<script type="text/javascript" src="js/addReportScript.js"></script>
</head>
<style>
fieldset {
  margin: 5px;
  padding: 0 2px 2px;
  border: 1px solid #666;
  border-radius: 8px;
 
  padding-top: 0px;
}
body{
background-color: white;
}
.topright {
  position: absolute;
  top: 550px;
  right: 900px;
  font-size: 18px;
  font-weight: bold;
}
.topright1 {
  position: absolute;
  top: 590px;
  right: 900px;
  font-size: 18px;
  font-weight: bold;
}
.topright2 {
  position: absolute;
  top: 630px;
  right: 900px;
  font-size: 18px;
  font-weight: bold;
}

</style>
<body>
<%
if(request.getAttribute("reportDtls")!=null){
	MedicalReportDtls reportDtls=(MedicalReportDtls)request.getAttribute("reportDtls");
	pageContext.setAttribute("patientId", reportDtls.getPatientId());
	pageContext.setAttribute("patientName", reportDtls.getPatientName());
	pageContext.setAttribute("billNo", reportDtls.getBillNo());
	pageContext.setAttribute("billDate", reportDtls.getBillDate());
	pageContext.setAttribute("saleType", reportDtls.getSalesType());
	pageContext.setAttribute("totAmount", reportDtls.getTotAmount());
	pageContext.setAttribute("paidAmount", reportDtls.getPaidAmount());
	pageContext.setAttribute("netAmount", reportDtls.getNetAmount());
	pageContext.setAttribute("preparedBy", reportDtls.getPreparedBy());
	pageContext.setAttribute("printedBy", reportDtls.getPrintedBy());
	pageContext.setAttribute("cgstAmount", reportDtls.getCgstAmount());
	pageContext.setAttribute("sgstAmount", reportDtls.getSgstAmount());
	
	
}

if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls pdtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaId", pdtls.getPharmacyId());
	pageContext.setAttribute("gstInTaxId", pdtls.getGstInTaxId());
	pageContext.setAttribute("pharmaName", pdtls.getPharmacyName());
	pageContext.setAttribute("doctorName", pdtls.getDoctorName());
	pageContext.setAttribute("address", pdtls.getAddress());
	pageContext.setAttribute("phoneNo", pdtls.getPhoneNo());
	pageContext.setAttribute("gstInTaxNo", pdtls.getGstInTaxNo());
	pageContext.setAttribute("dlNo", pdtls.getDlNo());
	
}
 if(request.getSession().getAttribute("pharmaDtls")==null){
	response.sendRedirect("index.jsp");
} 
%>
<form action="todaysReport" method="post" width="1000px"; name="todayReportsForm">
<input type="hidden" name="formAction" value="">

</form>
<form action="addReport" method="post" width="500px"; name="medicalReportCreationForm">
<input type="hidden" name="addReportItems" value="">
 <input type="hidden" id="patientId" name="patientId" value="${patientId}" >
<input type="hidden" name="itemId"  value="${itemId}" />
<input type="hidden" name="formAction" value="${formAction}">

<input type="hidden" name="priceperone" id="priceperone" value="" />

 <fieldset>
 <p align="center"> ${pharmaName} </p>
 <p align="center"> ${address} </p>
 <p align="center"> Phone No :${phoneNo} </p>
 <p align="center">CASH/CREDIT BILL </p>
 <p> DLNO :${dlNo} </p>
 <p align="right"> GSTINNO :${gstInTaxNo} </p>

 </fieldset>
<fieldset>
<div class="col-md-7 col-md-offset-7">
 <div class="container login-container">
            <div class="row">
                <div class="col-md-3 login-form-5">
                <div class="form-group"> </div>
                  
                 <div class="form-group">
               
                 <p  style="font-weight: bold;"> Patient Name  &nbsp;&nbsp;&nbsp;:&nbsp;${patientName} </p>    
                        </div>
            
                      <div class="form-group">

 <p  style="font-weight: bold;">Sales Type  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;${saleType} </p>
                        </div>
               <div class="form-group">
             <p  style="font-weight: bold;">  Doctor Name &nbsp;&nbsp;&nbsp;:&nbsp; ${doctorName}</p>
               </div>
                
                </div>
                
              <div class="col-md-3 login-form-5">   
                  <div class="form-group"> </div>
                    <div class="form-group">
                    <input type="hidden" id="billNo" name="billNo" value="${billNo}">
                      <p  style = "position:relative; left:500px;font-weight: bold;" > Bill No &nbsp;&nbsp;:   ${billNo}</p>
                        </div>
                       
                      <div class="form-group">
 						<p  style = "position:relative; left:500px;font-weight: bold;" >Bill Date :   ${billDate}</p> 
                 <input type="hidden" id="billDate" name="billDate" value="${billDate}">
                            
                        </div>
                        
               </div> 
                
            </div>
        </div> </div> 
 
  
 </fieldset>
 <fieldset>
<div class="col-md-8 col-md-offset-9">
<table id="reportItems"  align="left" width="950px"></table>
<div class="form-group col-xs-10 col-sm-2 col-md-0 col-lg-3">	
	    
 
  </div> 
  </div> 
   

 <table>
 <tr><td>
 <p style="font-weight: bold;"> SGST TAX   :   ${sgstAmount}&nbsp;&nbsp;
CGST TAX   :   ${cgstAmount}</p> 
</td><td>
<p style = "position:relative; left:500px;font-weight: bold;" >  TotAmount  :   ${totAmount} </p></td></tr>
<tr><td>
<p style="font-weight: bold;"> Prepared By&nbsp;:   ${preparedBy}</p></td>
<td><p style = "position:relative; left:500px;font-weight: bold;" >  NetAmount  :   ${netAmount}</p></td></tr>
<tr><td> <p style="font-weight: bold;">  Printed By &nbsp;&nbsp;&nbsp;:   ${printedBy}</p></td>
<td><p style = "position:relative; left:500px;font-weight: bold;" > PaidAmount     :   ${paidAmount}</p></td>
</tr>

 </table>


 </fieldset>	
   
</form>
</body>
<script type="text/javascript">
/* alert(${patientId}); */
 function doSearch() {
//	alert("doSearch");
document.forms["todayReportsForm"].elements["formAction"].value="LIST_OF_MEDICINES";
document.forms["todayReportsForm"].submit();
/* var Window;
	 Window=window.open("/MedicalReport/todaysReport?formAction=LIST_OF_MEDICINES&reqSource=medicine","_blank","height=600,width=1000,left=300,top=10,resizable=yes,scrollbars=yes,toolbar=yes,location=center,directories=no, status=yes");
 */}
function doSave(){
	//alert("1");
	document.forms["medicalReportCreationForm"].elements["formAction"].value="REPORT_SAVE";
document.forms["medicalReportCreationForm"].submit();
   }
var dataset= <c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>