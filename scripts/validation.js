"use strict"; 

function quantityNumber(quantity){
	var err = ""; 
	var result = true; 
	if (isNaN(quantity)) { //isNaN ensures that a number is entered
		err += "Quantity is not a number. \n";
	}
	else if  (quantity <0)  {
		err +=  "Quantity cannot be negative. \n";
	}
	
	return err; 
	if (err != "") {
		alert(err);
		result = false;
	}
}

function init() {
	if (document.URL.includes("add_record.php")) {
		var regForm = document.getElementById("add_record"); //this is for the enquire page 
		regForm.onsubmit = quantityNumber;
	}
}

window.addEventListener("load",init);