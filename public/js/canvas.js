var canvasElement=document.getElementById("myCanvas");
var ctx=canvasElement.getContext("2d");

canvasElement.width=window.innerWidth;
canvasElement.height=window.innerHeight;

ctx.lineWidth="1";
ctx.strokeStyle="black";

var isDrawing = false;

var drawing = function() {

	canvasElement.addEventListener("mousedown",function(event){
		isDrawing = true;
		ctx.beginPath();
	})

	canvasElement.addEventListener("mousemove",function(event){
		if(!isDrawing){ return }
		ctx.lineTo(event.clientX,event.clientY);
		ctx.stroke();
	})

	canvasElement.addEventListener("mouseup",function(){
		isDrawing = false;	
	})

	$('#myForm').on('submit',function(e){
		e.preventDefault();
		console.log($('#myForm').serialize());
		// $.ajax({
		// 	url: '/changecolor',
		// 	type: 'post',
		// 	data: 
		// })
		console.log("submit clicked");
	})
}
drawing();	