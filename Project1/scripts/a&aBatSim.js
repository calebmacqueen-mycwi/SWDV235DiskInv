var attInf;
var attArt;
var attTnk;
var attFtr;
var attBmr;

var defInf;
var defArt;
var defTnk;
var defFtr;
var defBmr;

var attHasUnits = true;
var defHasUnits = true;

function rollDice(numDice, pow) {
  // roll dice equal to i
  var hits = 0;
  var die;

  for (var i = 0; i < numDice; i++) {
    die = 1 + Math.floor(Math.random() * 6);
    // hit if less that power
    if (die <= pow) {
      hits++;
    }
  }
  // return hits
  return hits;
}

// Selcts casualties for the attacker
function getAttCasualties(hits) {
  while (hits > 0) {
    if (hits > attInf) {
      hits -= attInf;
      attInf = 0;
    } else if (hits <= attInf) {
      attInf -= hits;
      hits = 0;
    }
    if (hits > attArt) {
      hits -= attArt;
      attArt = 0;
    } else if (hits <= attArt) {
      attArt -= hits;
      hits = 0;
    }
    if (hits > attTnk) {
      hits -= attTnk;
      attTnk = 0;
    } else if (hits <= attTnk) {
      attTnk -= hits;
      hits = 0;
    }
    if (hits > attFtr) {
      hits -= attFtr;
      attFtr = 0;
    } else if (hits <= attFtr) {
      attFtr -= hits;
      hits = 0;
    }
    if (hits > attBmr) {
      hits -= attBmr;
      attBmr = 0;
    } else if (hits <= attBmr) {
      attBmr -= hits;
      hits = 0;
    }
    if(hits > 0 && attInf == 0 && attArt == 0 && attTnk == 0 && attFtr == 0 && attBmr == 0 ){
      hits = 0;
    }
  }
  //alert('determined att casualties');
}

//Selcts casualties for the defenders
function getDefCasualties(hits) {
  //alert('made it into function'); //debugging alert
  while (hits > 0) {
    if (hits > defBmr) {
      hits -= defBmr;
      defBmr = 0;
    } else if (hits <= defBmr) {
      defBmr -= hits;
      hits = 0;
    }
    if (hits > defInf) {
      hits -= defInf;
      defInf = 0;
    } else if (hits <= defInf) {
      defInf -= hits;
      hits = 0;
    }
    if (hits > defArt) {
      hits -= defArt;
      defArt = 0;
    } else if (hits <= defArt) {
      defArt -= hits;
      hits = 0;
    }
    if (hits > defTnk) {
      hits -= defTnk;
      defTnk = 0;
    } else if (hits <= defTnk) {
      defTnk -= hits;
      hits = 0;
    }
    if (hits > defFtr) {
      hits -= defFtr;
      defFtr = 0;
    } else if (hits <= defFtr) {
      defFtr -= hits;
      hits = 0;
    }
    if(hits > 0 && defInf == 0 && defArt == 0 && defTnk == 0 && defFtr == 0 && defBmr == 0 ){
      hits = 0;
    }
  }
  //alert('Determined Def Casualties'); //debugging alert
}



function runSim() {
  var result = document.querySelector(".output");
  result.innerHTML = '';
  var outcome = '';
  var round = 1;
  attHasUnits = true;
  defHasUnits = true;
  //alert('button clicked'); //debugging alert
  //access info from text fields
  attInf = parseInt(document.getElementById("attInf").value);
  attArt = parseInt(document.getElementById("attArt").value);
  attTnk = parseInt(document.getElementById("attTnk").value);
  attFtr = parseInt(document.getElementById("attFtr").value);
  attBmr = parseInt(document.getElementById("attBmr").value);

  defInf = parseInt(document.getElementById("defInf").value);
  defArt = parseInt(document.getElementById("defArt").value);
  defTnk = parseInt(document.getElementById("defTnk").value);
  defFtr = parseInt(document.getElementById("defFtr").value);
  defBmr = parseInt(document.getElementById("defBmr").value);
  //alert('read fields'); //debugging alert
  do { //while(attHasUnits && defHasUnits);
    //alert('beginning loop'); //debugging alert
    //accumulates total hits for a single round of combat
    var attHits = 0;
    var defHits = 0;

    //get the attackers power
    var att1 = 0;
    var att2 = 0;
    if (attInf >= attArt) {
      att1 = attInf - attArt;
      att2 = attArt * 2;
      //alert('more inf'); //debugging alert
    } else if (attInf < attArt) {
      att2 = attInf + attArt;
      att1 = 0;
      //alert('less Inf'); //debugging alert
    }
    var att3 = attTnk + attFtr;
    var att4 = attBmr;

    //get the defenders power
    var def1 = defBmr;
    var def2 = defInf + defArt;
    var def3 = defTnk;
    var def4 = defFtr;
    //alert('Determined army composition'); //debugging alert
    // get hits
    attHits = rollDice(att1, 1) + rollDice(att2, 2) + rollDice(att3, 3) + rollDice(att4, 4);
    defHits = rollDice(def1, 1) + rollDice(def2, 2) + rollDice(def3, 3) + rollDice(def4, 4);
    //alert("The dice hav been rolled"); //debugging alert
    //select casualties
    getAttCasualties(defHits);
    //alert('got att casaulties'); //debugging alert
    getDefCasualties(attHits);
    //alert('got def casaulties'); //debugging alert
    //IN THE FUTURE: use logic statements to refine output
    outcome += '<strong>Round: ' + round + '</strong><br>The attacker got ' + attHits + ' hit(s)<br>The attacker has ' + attInf + ' inf and ' + attArt + ' art and ' + attTnk + ' tanks and ' + attFtr +
      ' Fighters and ' + attBmr + ' bombers<br>The defender got ' + defHits + ' hit(s)<br>The defender has ' + defInf + ' Inf and ' + defArt + ' art and ' + defTnk +
      ' tanks and ' + defFtr + ' Fighters and ' + defBmr + ' bombers<br>';

    //math stop me from making a ton of diffent tests in the if statement. It fixed a bug somewhere
    var numAttUnits = attInf + attArt + attTnk + attFtr + attBmr;
    var numDefUnits = defInf + defArt + defTnk + defFtr + defBmr;
    if (numAttUnits <= 0) {
      attHasUnits = false;
      //alert('The Defender won!'); //debugging alert
    }
    if (numDefUnits <= 0) {
      defHasUnits = false;
      //alert('The Attacker won!'); //debugging alert
    }
    round++;
  } while (attHasUnits == true && defHasUnits == true);
  //put the output here
  //alert('left loop'); //debugging alert
  //console.log(result);
  if (attHasUnits == false) {
    outcome = 'The Defender won! The defender has ' + defInf + ' Infantry, ' + defArt + ' Artillery, ' + defTnk + ' Tanks, ' + defFtr + ' Fighters, and ' + defBmr + ' Bombers remaining.<br>' + outcome;
    //alert(outcome);
    result.innerHTML += outcome;
    //console.log(result);
  } else if(defHasUnits == false) {
    outcome = 'The Attacker won! The attacker has ' + attInf + ' Infantry, ' + attArt + ' Artillery, ' + attTnk + ' Tanks, ' + attFtr + ' Fighters, and ' + attBmr + ' Bombers remaining.<br>' + outcome;
    //alert(outcome);
    result.innerHTML += outcome;
    //console.log(result);
  }
}
