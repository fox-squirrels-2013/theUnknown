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

	$('#myForm').on('change', '.drawing-style', function(e){
		e.preventDefault();
		var form = $('#myForm')

		$.ajax({
			url: form.prop('action'),
			type: form.prop('method'),
			data: form.serialize()
		}).done(function(d){
			ctx.strokeStyle=d.color;
			ctx.lineWidth=d.line_width;
		})
	})

}
drawing();	