"use strict";
var $ = function(id) { return document.getElementById(id); };

// the event handler for the click event of each h2 element
var toggle = function() {
    var h2 = this;                    // clicked h2 tag
    var div = h2./*parentElement.*/nextElementSibling;  // h2 tag's sibling div tag

    // toggle plus and minus image in h2 elements by adding or removing a class
    /*if (h2.parentElement.className != '') {
      //  h2.removeAttribute("class");
      h2.parentElement.className = '';
    } else {
      //  h2.setAttribute("class", "minus");
      h2.parentElement.className = 'minus';
    }*/

    // toggle div visibility by adding or removing a class
    if (div.className != 'faqDiv') {
      //  div.removeAttribute("class");
      div.className = 'faqDiv';
    } else {
      //  div.setAttribute("class", "open");
      div.className = 'faqDiv open';
    }
};

window.onload = function() {
    // get the h2 tags
    var faqs = $("faqs");
    var h2Elements = document.getElementsByTagName("h3");

    // attach event handler for each h2 tag
    for (var i = 0; i < h2Elements.length; i++ ) {
    	h2Elements[i]/*.firstChild*/.onclick = toggle;
      //h2Elements[i].onclick = toggle;
    }
    // set focus on first h2 tag's <a> tag
    h2Elements[0].focus();
};
