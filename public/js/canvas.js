var canvasElement=document.getElementById("myCanvas");
var ctx=canvasElement.getContext("2d");
canvasElement.width=window.innerWidth;
canvasElement.height=window.innerHeight;
ctx.lineWidth="5";
ctx.strokeStyle="blue";
var isDrawing = false;

canvasElement.addEventListener("mousedown",function(event){
	isDrawing = true;
	ctx.beginPath();
})
console.log(isDrawing)

canvasElement.addEventListener("mousemove",function(event){
	if(!isDrawing){ return }
	ctx.lineTo(event.clientX,event.clientY);
	ctx.stroke();
})

canvasElement.addEventListener("mouseup",function(){
	isDrawing = false;	
})