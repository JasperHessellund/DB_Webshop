let emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

function signUpToDatabase() {
    let firstName = document.getElementById("inputFirstName").value;
    let lastName = document.getElementById("inputLastName").value;
    let gender = document.getElementById("inputLastName").value;
    let address = document.getElementById("inputAddress").value;
    let zipCode = document.getElementById("inputLastName").value;
    let phoneNumber = document.getElementById("inputPhoneNumber").value;
    let email = document.getElementById("inputEmail").value;
    let password = document.getElementById("inputPassword").value;
    if (gender === "Male") gender = "M";
    else gender = "F";

    let signUpQuery = "EXEC sp_createUser "+firstName +","+lastName+","+gender+","+address+","+zipCode+","+phoneNumber+
        ","+email+","+password+",0;";
}






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