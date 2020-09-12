
<style type="text/css">
 /* Styling modal */ 
    
          
        .modal-dialog { 
            display: inline-block; 
           right: 20%;
           left:  20%;
        } 
          
      
.modal-header {
  background-color: #B3B9BD;
  color: white;
    display: inherit !important;
    color:#fff;
    padding:9px 15px;
    border-bottom:1px solid #eee;
    background-color: #8CD3FF;
    color: #000;
    -webkit-border-top-left-radius: 5px;
    -webkit-border-top-right-radius: 5px;
    -moz-border-radius-topleft: 5px;
    -moz-border-radius-topright: 5px;
     border-top-left-radius: 5px;
     border-top-right-radius: 5px;
}
.modal-content {
    width: 1150px;
}
#medicines.dataTable tbody tr:hover {
 background-color: #337ab7;
    color :#ffff;
}
 #medicines.dataTable thead {
line-height: 12px;
  background-color: #B3B8BD  ;
   color :#FFFFFF;
}

  #medicines tr td { 
  	line-height: 12px; }
 #myModal {

}
</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
var listMedicinesDataSet=${listMedicinesDataSet}
//var dataSet=[["DOLO650","2020B","2021-05","30","500.0"]];;
//alert(dataSet);
 
 $(document).ready(function() {
   var table= $('#medicines').DataTable( {
        data: listMedicinesDataSet,
        columns: [
            { title: "Medicine Name" },
            { title: "Medicine Id" },
            { title: "Manufacture" },
            { title: "Batch No" },
            { title: "Exp.Date" },
            { title: "Quantity" },
            { title: "Price" }
            
        ]
    } );
    $('#medicines tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
           
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            returnSelected();
        }
    } );
    
    function returnSelected(){
    	//alert(" function returnSelected");
    	var selItem=table.$('tr.selected');
    		  var str= table.row('.selected').data();
				   var arr = str.toString().split(',');
				   selItem.addClass('selected');
               // alert( 'You clicked on '+data[9]+'\'s row' );
				var medicineName = arr[0]  
				var medicineId = arr[1]
              var manufacture=arr[2];
				var batchNo = arr[3]
				var expDate = arr[4]
				var qty = arr[5]
				var price = arr[6]
				var actualQty=arr[5]
				var priceperone=price/qty;
				document.getElementById('priceperone').value = priceperone;
				document.getElementById('medicineName').value = medicineName;
				document.getElementById('medicineId').value = medicineId;
				document.getElementById('manufacture').value =manufacture;
				document.getElementById('batchNo').value =batchNo;
				document.getElementById('expDate').value =expDate;
				document.getElementById('qty').value = qty;
				document.getElementById('actualQty').value = actualQty;
				document.getElementById('price').value = price;
				hide();
  
    }
    function hide(){
       // this will help in hide the model
    	$("[data-dismiss=modal]").trigger({ type: "click" });

 };

 
} );

</script>



<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			
				  <div class="col-lg-2">
                    <div class="header__logo">
                       <img src="img/logo.png" alt="">
                    </div>
                </div>	
	
			
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                
			</div>
			<div class="modal-body">
		<table id="medicines" class="cell-border" width="100%"></table>	</div>
		</div>
		 <font size="4px" color="#FFF" face="sans-serif">Single click on a row to select.</font>
	</div>
</div>
