playerLocation = [0,0,0];
var validMoves = ["north","south","east","west","dig"];

function move(dir) {
  if ($.inArray(dir, validMoves) == -1) {
    alert("DOES NOT COMPUTE. REPORT CODE 00000000001011101111 TO ADMINISTRATOR.");
    return;
  }
  
  if ((playerLocation[0] == 0 && dir == 'north') || (playerLocation[1] == 0 && dir == 'west') || (playerLocation[1] == 3 && dir == 'east') || (playerLocation[0] == 3 && dir == 'south')) {
    alert("You have reached the edge of the world. You barely catch youself before falling off.");
    return;
  }
  if (dir == "dig") {
    dig(playerLocation[2]);
  }
  else {
   playerLocation[2] = 0;
    if (dir == "north") {
      playerLocation[0] -= 1 }
    else if (dir == "south") {
      playerLocation[0] += 1 }
    else if (dir == "east") {
      playerLocation[1] += 1 }
    else if (dir == "west") {
      playerLocation[1] -= 1 }

    updateGrid();
  }
}

function updateGrid() {
  var column = "div.game-column." + playerLocation[0]
  var row = "div.game-row." + playerLocation[1]
  
  $(".game-player").toggleClass("game-player");
  $(column).find(row).toggleClass("game-player");
}

$(":button").click(function() {
  move(this.id)
});

updateGrid();

function dig(depth) {
  console.log(playerLocation)
  console.log(dug)
  if (playerLocation[2] == 3) {
    alert("You find hard rock and can't dig any deeper. Try moving.")
  }
  else if (dug[playerLocation]) {
    playerLocation[2] += 1;
    dig(playerLocation[2]);
  }
  else {
    var result;
    dug[playerLocation] = true;
    $.get('/dig', function(data) { 
      console.log("request returned" + data);
      var result = data;
      var formatTreasure = "<li>" + result + "</li>"
      $('#current-treasure').text(data);
      if (data != "You found some crap. No really, it seems a dog conducted some business and cleaned up after itself." && data != "You find nothing.") {
        $("#treasure").append(formatTreasure);
      }
    });
  }
}

dug = {};
