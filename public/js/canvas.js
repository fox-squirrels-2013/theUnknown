$( document ).ready(function() {

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
	
	var logInButton = $('#log_in')
	var logInFunction = function() {
		logInButton.on('click', function(e){
			// this is where you pop up the log in shit
			var username = window.prompt('Enter your username')
			var password = window.prompt('Enter your password')
			$.ajax
		})
	}
	logInFunction();

	var createAccountButton = $('#create_account')
	var createAccountFunction = function() {
		createAccountButton.on('click', function(e){
			// this is where you pop up the log in shit
			var username = window.prompt('Enter a username')
			var password = window.prompt('Enter a password')
			debugger
		})
	}
	createAccountFunction();

});

