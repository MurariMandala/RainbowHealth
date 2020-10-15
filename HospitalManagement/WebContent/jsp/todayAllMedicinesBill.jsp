	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.project.been.objs.PharmacyDtls" %>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="js/addReportScript.js"></script>
</head>
<body>
<%
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls dtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaName", dtls.getPharmacyName());
}
%>


<section class="chooseus spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="hero__text">
              	 <table id="reportItems"  align="left" width="950px"></table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
  <div class="form-group row">
 <label for="staticEmail" class="col-sm-0 col-form-label">Email</label>
 <div class="col-sm-10">
 <input type="text" class="form-control-plaintext" id="staticEmail"
value="email@example.com">
 </div>
 </div>
<br>
</body>
<script type="text/javascript">
var dataset= <c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>