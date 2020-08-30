var updateItems = [ ];
const app = {
  buildForm() {
    return [
      $('#medicineName').val(),//0
      $('#medicineId').val(),//9
      $('#manufacture').val(),  //1
      $('#batchNo').val(),//2
      $('#expDate').val(),//3
      $('#qty').val(),//6
      $('#price').val(),//7
      
	
	  
	  ];
  },
  sendToServer() {
    const formData = this.buildForm();
    axios.post('http://localhost:2000/record', formData)
      .then(response => console.log(response));
  },
  addRow(dataTable, data) {
	  var medicineId=document.getElementById("medicineId").value;
	  var medicineName=document.getElementById("medicineName").value;
	  var qty=document.getElementById("qty").value;
	  var price=document.getElementById("price").value;
	  if(medicineName==undefined ||  medicineName==''){
		//  alert("please provide the value for Medicine name");
		  document.getElementById("medError").innerHTML = "<span class='error'>*</span>";
		/*  var msg;
		  var isModel;
		  var url="jsp/addYourMedicines.jsp?msg=please provide the value for Medicine name&isModel=true";
	   window.location.href = url;*/
		  return false;
	  }else if(qty==undefined || qty==''){
		  document.getElementById("qtyError").innerHTML = "<span class='error'>*</span>";
		  return false;
	  }else if(price==undefined || price==''){
		  document.getElementById("priceError").innerHTML = "<span class='error'>*</span>";
		  return false;
	  }
	//  alert(medicineId);
	  var data = dataTable.rows().data().length; 
	  for(var i=0;i<data;i++){
		  var data1 = dataTable.rows().data()[i];
	   var arr = data1 .toString().split(',');
	   var id=arr[1];
	   var medName=arr[0]
	   if(id==0){
		   if(medName==medicineName){
			   alert("you already Added this Medicine so please select and update ");
			   return false;
		   }
		   
	   }else{
		   if(id==medicineId || medName==medicineName){
			   alert("you already have this Medicine so please select and update ");
			   return false;
		   }
		   
	   }
	   
	  }
   const formData = this.buildForm();
        const addedRow = dataTable.row.add(formData).draw();
      //  addedRow.show().draw(false);
        const addedRowNode = addedRow.node();
        console.log(addedRowNode);
        $(addedRowNode).addClass('highlight');
        this.confirmData(dataTable,"");
        

  	  document.getElementById("medicineName").value='';
  	  document.getElementById("medicineId").value='';
  	  document.getElementById("manufacture").value='';
  	  document.getElementById("batchNo").value='';
  	  document.getElementById("expDate").value='';
  	  document.getElementById("qty").value='';
  	  document.getElementById("price").value='';
		return false;
	 
  },
  addUpdatedRow(dataTable, data) {
	//  alert(updateItems);
	  const formData = this.buildForm();
      const addedRow = dataTable.row.add(formData).draw();
      var updatedId= formData[1];
      var data = dataTable.rows().data().length; 
      var updateItem = [ ];
 	  for(var i=0;i<data;i++){
	   var data1 = dataTable.rows().data()[i];
	   var arr = data1 .toString().split(',');
	   var id=arr[1];
	   if(id==updatedId){
		   updateItem[i]=data1;   
		
	   }
	  }
 //	  alert(updateItem);
 	   updateItems=updateItems+'~'+updateItem;
 	//  alert(updateItems);
	   document.forms["yourMedicinesForm"].elements["updateMedicinesList"].value=updateItems;
	  
      const addedRowNode = addedRow.node();
      console.log(addedRowNode);
      $(addedRowNode).addClass('highlight');
  //    this.confirmUpdateData(dataTable,"");

  	  document.getElementById("medicineName").value='';
  	  document.getElementById("medicineId").value='';
  	  document.getElementById("manufacture").value='';
  	  document.getElementById("batchNo").value='';
  	  document.getElementById("expDate").value='';
  	  document.getElementById("qty").value='';
  	  document.getElementById("price").value='';
      
  },
  selectRow(dataTable) {
	   if ($(this).hasClass('selected')) {
      $(this).removeClass('selected');
      //deduct from total
//      
      $(this).addClass('unselected');
	  var str= dataTable.row('.unselected').data();
	   var arr = str.toString().split(',');

	   $(this).removeClass('unselected');
	   document.getElementById("medicineName").value='';
	  	  document.getElementById("medicineId").value='';
	  	  document.getElementById("manufacture").value='';
	  	  document.getElementById("batchNo").value='';
	  	  document.getElementById("expDate").value='';
	  	  document.getElementById("qty").value='';
	  	  document.getElementById("price").value='';
	  
    } else {
      var selItem=dataTable.$('tr.selected');
      selItem.removeClass('selected');
      $(this).addClass('selected');
      var str= dataTable.row('.selected').data();
	   var arr = str.toString().split(',');
	
	   selItem.addClass('selected');
	   	 
	   //add in total
 
	   if(arr[0]){		   

		   document.getElementById('medicineName').value = arr[0];
	  }else{
		    document.getElementById('medicineName').value ="";
	   } 
	    
	   if(arr[1]){		   

		   document.getElementById('medicineId').value = arr[1];
	  }else{
		    document.getElementById('medicineId').value ="";
	   } 
	   if(arr[2]){		   

		   document.getElementById('manufacture').value = arr[2];
	  }else{
		    document.getElementById('manufacture').value ="";
	   }
	   if(arr[3]){		   

		   document.getElementById('batchNo').value = arr[3];
	  }else{
		    document.getElementById('batchNo').value ="";
	   }	    
	   if(arr[4]){		   

		   document.getElementById('expDate').value = arr[4];
	  }else{
		    document.getElementById('expDate').value ="";
	   }	    	  
	   if(arr[5]){		   

		   document.getElementById('qty').value = arr[5];
	  }else{
		    document.getElementById('qty').value ="";
	   }	    	  
	   if(arr[6]){		   

		   document.getElementById('price').value = arr[6];
	  }else{
		    document.getElementById('price').value ="";
	   }	    	  
    }
  },
  updateRow(dataTable,data){
	     var str= dataTable.row('.selected').data();
	 	if(str==undefined){
	 		alert("you need to select one item to proceed update !");
	 		return false;
	 	}
	  this.removeUpdatedRow(dataTable) ;  
	  this.addUpdatedRow(dataTable, data);
	  
	  return false;
  },
  removeUpdatedRow(dataTable,data){
	  var data = dataTable.rows().data().length; 
	  var data1 = dataTable.row('.selected').data(); 
	
		//   var arr = data1 .toString().split(',');
		  
				  dataTable.row('.selected').remove().draw( false );
				  
				   return false;
			
  },
  confirmUpdateData(dataTable) {
	  var data = dataTable.rows().data().length; 
	  var data1 = dataTable.rows().data();
	
     var arr = data1 .toString().split(',');
     var updateItems =data1;   
     return false; 
  },
  confirmData(dataTable) {
		 
		 var data = dataTable.rows().data().length; 
		 var totSgstAmount=0.0;
		 var totCgstAmount=0.0;
		 var totAmount=0.0;
		 
			var i;
	         var addReportItems = [ ];
	         var updateItems = [ ];
					var arrayAsAString=''; 
					for(i=0;i<data;i++){
						
						var data1 = dataTable.rows().data()[i];
					
							   addReportItems[i]=data1; 
					
							  
					
							
						}
				
					addReportItems=addReportItems.join("~");		
		 document.forms["yourMedicinesForm"].elements["medicinesList"].value=addReportItems;
	
		
	 },

	  removeRow(dataTable,data) {
		  var data = dataTable.rows().data().length; 
		  var data1 = dataTable.row('.selected').data(); 
		
			//   var arr = data1 .toString().split(',');
			  
					  dataTable.row('.selected').remove().draw( false );
					   this.confirmData(dataTable,"");
					   return false;
				
		  
		  
		  },
		
	
  start() {
    const dataTable = $('#medicines').DataTable({
    //	"searching": false,
    	"bPaginate": false,   //show entries
   //     "bLengthChange": false,
   //     "bFilter": true,
   //     "bInfo": false,
    	 select: {
             style: 'single'
         },
      data: dataset,
	   columns: [
	
		   { title: "Medicine Name" },
           { title: "Medicine Id" },
           { title: "Manufacture" },
           { title: "Batch No" },
           { title: "Exp.Date" },
           { title: "Quantity" },
           { title: "Price" }
        
      	 
      ]
      
    });
	
   
  
	  
	
  $('#add').on('click', this.addRow.bind(this, dataTable));   
  // $('#add').on('click', this.sendToServer.bind(this));
    const self = this;
    $('#medicines tbody').on('click', 'tr', function(){
      self.selectRow.bind(this, dataTable)();
    });
    $('#remove').on('click', this.removeRow.bind(this, dataTable));
    $('#update').on('click', this.updateRow.bind(this, dataTable)); 
  }
 	  
	
};

$(document).ready(() => app.start());
