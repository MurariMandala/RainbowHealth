<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Work"); map.put("y", 44); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Gym"); map.put("y", 9); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Leisure"); map.put("y", 8); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Routines"); map.put("y", 8); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Nap"); map.put("y", 2); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Sleep"); map.put("y", 29); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
System.out.println(dataPoints);
//[{"y":44,"label":"Work"},{"y":9,"label":"Gym"},{"y":8,"label":"Leisure"},{"y":8,"label":"Routines"},{"y":2,"label":"Nap"},{"y":29,"label":"Sleep"}]
%>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</body>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Typical Day"
	},
	data: [{
		type: "pie",
		toolTipContent: "<b>{label}</b>: {y}%",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: <%out.print(dataPoints);%>
	}],
	
});
chart.render();
 
}
</script>
</html>