//function() {var name=prompt("Hey there baby, what's your name?");
//var number=prompt("Yo girl, gimme your number. Cause uh, I lost mine.");
//     name}

//$('#game-grid').displayTile({
 //   alert("Awesome! I'll call you sometime, k?");
	//left: '-195px'
    //});

//$('#game-grid').html('<img src="http://i.imgur.com/8NArGWZ.gif" />')

//tiles change color on hover

$('#game-tile img').hover( function() {
    this.src = 'http://i.imgur.com/nTj3Fxx.gif'
}, function() {
    this.src = 'http://i.imgur.com/90Mmdcm.png'
})

function result(output){
    console.log(output);
}

$('#result') ( function() {
alert("Awesome! I'll call you sometime, k?");
}, function() {
    this.src = 'http://i.imgur.com/90Mmdcm.png'
})