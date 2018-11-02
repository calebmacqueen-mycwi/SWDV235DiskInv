"use strict";
var get = function (id) { return document.getElementById(id); };

var imageCache = [];
var imageCounter = 0;
var timer;
var interval;
var runSlideShow = function() {
    imageCounter = (imageCounter + 1) % imageCache.length;
    var image = imageCache[imageCounter];
    get("image").src = image.src;
    //get("caption").firstChild.nodeValue = image.title;
};

window.onload = function () {
    var listNode = get("image_list");    // the ul element
    var links = listNode.getElementsByTagName("a");

    // Preload image, copy title properties, and store in array
    var i, link, image;
    for ( i = 0; i < links.length; i++ ) {
        link = links[i];
        image = new Image();
        image.src = link.getAttribute("href");
        image.title = link.getAttribute("title");
        imageCache[imageCache.length] = image;
    }
    var start = get("start");
    var pause = get("pause");
    // Attach start and pause event handlers
    start.onclick = function() {
      runSlideShow();
        interval = setInterval(runSlideShow, 3000);
        start.setAttribute("disabled", "true");
        pause.removeAttribute("disabled");
    };
    pause.onclick = function() {
      clearInterval(interval);
      start.removeAttribute("disabled");
      pause.setAttribute("disabled", "true");
    };
};
