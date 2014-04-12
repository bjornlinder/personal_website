//function() {var name=prompt("Hey there baby, what's your name?");
//var number=prompt("Yo girl, gimme your number. Cause uh, I lost mine.");
//     name}

//$('#game-grid').displayTile({
 //   alert("Awesome! I'll call you sometime, k?");
	//left: '-195px'
    //});

//$('#game-grid').html('<img src="http://i.imgur.com/8NArGWZ.gif" />')

//tiles change color on hover

// $('game-grid.game-tile').hover( function() {
//     this.src = 'http://i.imgur.com/nTj3Fxx.gif'
// }, function() {
//     this.src = 'http://i.imgur.com/90Mmdcm.png'
// })


// $('#result') ( function() {
// alert("Awesome! I'll call you sometime, k?");
// }, function() {
//     this.src = 'http://i.imgur.com/90Mmdcm.png'
// })

// $(document).ready(function(e) {
// 	var $tile = $('#tile-items');
// 	$('#tile-items').find('a').on('click', function(e) {
// 		e.preventDefault();
// 		
// 		switch($(this).attr('href')) {
// 			case 'button1':
// 				do shit;
// 				break;
// 			case 'button2':
// 				do other shit;
// 				break;
// 		}
// 		
// 		$('#move-button')
// 		$('flower-description').load('fragments/lilies.html');
// 	});
// });

 playerLocation = [0,0,0]; // Current playerLocation
// 
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
     // >= @dimensions[0]||@playerLocation[0]<0||@playerLocation[1]<0||@playerLocation[1]>=@dimensions[1])
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
// 
// // var north = document.getElementById('north');
// // north.onclick = North;
// 
// // var playerLocation = [0,0,0];
// return false;

