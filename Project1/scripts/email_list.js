"use strict";

var $ = function(id) {
  return document.getElementById(id);
};

var joinList = function() {
  var email_Address1 = $("email_address1").value;
  var email_Address2 = $("email_address2").value;
  var firstName = $("first_name").value;
  var errorMessage = "";
  const FIRSTEMAIL = $("email1");
  const SECONDEMAIL = $("email2");
  const NAME = $("fName");
  var isValid = true;
  var email1HasAt = false;
  var email2HasAt = false;
  var i;
  // validate the entries

  for(i = 0; i < email_Address1.length; i++){
    if(email_Address1[i] == '@'){
      email1HasAt = true;
    }
  }

  for(i = 0; i < email_Address2.length; i++){
    if(email_Address2[i] == '@'){
      email2HasAt = true;
    }
  }

  if (email_Address1 == "") {
    FIRSTEMAIL.innerHTML = "First email address entry required";
    isValid = false;
  } else if (!email1HasAt){
    FIRSTEMAIL.innerHTML = "Email must have an @ sign"
  } else {
    FIRSTEMAIL.innerHTML = '';
  }
  if (email_Address2 == "") {
    SECONDEMAIL.innerHTML = "Second email address entry required";
    isValid = false;
  } else if (!email2HasAt){
    SECONDEMAIL.innerHTML = "Email must have an @ sign"
  } else if (email_Address2 != email_Address1) {
    SECONDEMAIL.innerHTML = "Email address entries must match";
    isValid = false;
  } else {
    SECONDEMAIL.innerHTML = '';
  }
  if (firstName == "") {
    NAME.innerHTML = "First name entry required";
    isValid = false;
  } else {
    NAME.innerHTML = '';
  }
  /*  if (emailAddress1 == "") {
    	errorMessage = "First email address entry required";
    } else if (emailAddress2 == "") {
    	errorMessage = "Second email address entry required";
    } else if (emailAddress2 != emailAddress1) {
    	errorMessage = "Email address entries must match";
    } else if (firstName == "") {
    	errorMessage = "First name entry required";
    }

    // submit the form if all entries are valid
    // otherwise, display an error message/*/
};

/*window.onload = function() {
  $("join_list").onclick = joinList;
  $("email_address1").focus();
};
*/
