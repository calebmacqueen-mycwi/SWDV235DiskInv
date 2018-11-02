"use strict";
var $ = function(id) { return document.getElementById(id); };

function processEntries() {
    var header = "";
    var html = "";
    var required = '<span class="error">Required field</span>';
    var error = '<span class="error">Email must contain @ sign.</span>'
    var msg = "Please review your entries and complete all required fields";
    var email = $("email").value;
    var name = $("name").value;
    var comment = $("message").value;
    var doesEmailHaveAt = false;
    var i;

    if (email == "") {
        email = required;
        header = msg;
    } else {
      for(i = 0; i < email.length; i++){
        if(email[i] == '@'){
          doesEmailHaveAt = true;
        }
      }
      if(!doesEmailHaveAt){
        email = error;
        header = msg;
      }
    }
	if (name == "") {
        name = required;
        header = msg;
    }

    $("registration_header").nodeValue = header;
    if (header == msg) {
        html = html + "<tr><td>Email:</td><td>" + email + "</td></tr>";
        html = html + "<tr><td>Name:</td><td>" + name + "</td></tr>";
        //html = html + "<tr><td>Comment Length:</td><td>" + comment.length + "</td></tr>";
        $("registration_info").innerHTML = html;
        //console.log("Should display table");
    } else {
        $("registration_info").innerHTML = "";
        //$("registration_form").submit();  //uncomment this to actually submit the form
        //console.log("Info is valid");
        email = $("email_address").value = '';
        name = $("name").value = '';
        comment = $("comments").value = '';
        // display acceptance msg
    }
};

var resetForm = function() {
    $("registration_form").reset();
    $("registration_header").firstChild.nodeValue = "";
    $("registration_info").innerHTML = "";
    $("email_address").focus();
};

/*window.onload = function() {
    $("register").onclick = processEntries;
    $("reset_form").onclick = resetForm;
    $("email_address").focus();
};*/
