let emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

// Validators, does'nt matter for the exam
function zipCodeValidation() {
    let inputZipCode = document.getElementById("inputZipCode").value;
    if (inputZipCode.length !== 4) {
        document.getElementById("invalidZipCode").innerHTML = "Zip Code has to contain 4 numbers";
    }
    else document.getElementById("invalidZipCode").innerHTML = "";
}
function phoneNumberValidation() {
    let inputPhoneNumber = document.getElementById("inputPhoneNumber").value;
    if (inputPhoneNumber.length !== 8) {
        document.getElementById("invalidPhoneNumber").innerHTML = "Phone number has to contain 8 numbers";
    }
    else document.getElementById("invalidPhoneNumber").innerHTML = "";
}
function emailValidation() {
    let inputEmail = document.getElementById("inputEmail").value;
    if (!inputEmail.match(emailRegex)) {
        document.getElementById("invalidEmail").innerHTML = "Invalid Email";

    }
    else {
        document.getElementById("invalidEmail").innerHTML = "";

    }
}