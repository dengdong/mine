
//var exec = require('child_process').exec;
var querystring = require("querystring");
var fs = require('fs');
var formidable = require("formidable");

function start(response){ 
	console.log('Request handler "start" was called.');
	/*
	function sleep(milliSeconds){ 
		var startTIme = new Date().getTime();
		while(new Date().getTime() < startTIme + milliSeconds);
	}
	sleep(10000);
	*//*
	var content = "empty";
	exec('find /',
		{timeout:10000,maxBuffer:20000*1024},
		function(error,stdout,stderr){ 
		//console.log('ls -lah');
		response.writeHead(200,{"Content-Type":"text/plain"});
		response.write(stdout);
		response.end();
	})
	*/
	var body = '<html>'+
    '<head>'+
    '<meta http-equiv="Content-Type" content="text/html; '+
    'charset=UTF-8" />'+
    '</head>'+
    '<body>'+
    '<form action="/upload" enctype="multipart/form-data" method="post">'+
    '<input type="file" name="upload">'+
    '<input type="submit" value="UPload file" />'+
    '</form>'+
    '</body>'+
    '</html>';
    response.writeHead(200,{"Content-Type":"text/html"});
    response.write(body);
    response.end();
}

function upload(response,request){ 
	console.log('Request handler "upload" was called');
	/*
	response.writeHead(200,{"Content-Type":"text/plain"});
	//response.write("You've sent:" + postData);
	response.write("You've sent:" + querystring.parse( postData).text);
	response.end();
	*/
	var form = new formidable.IncomingForm();
	form.uploadDir = "tmp"
	console.log("about to parse");
	form.parse(request,function(error,fields,files){ 
		console.log("parsing done");
		fs.exists(files.upload.path,function(exists){ 
			if(exists){
				fs.renameSync(files.upload.path,"./tmp/test.png");
				response.writeHead(200,{"Content-type":"text/html"});
				response.write("received image:<br >");
				response.write("<img src='/show' />");
				response.end();
			}else{ 
				response.writeHead(200,{"Content-type":"text/html"});
				response.write("received image:<br >文件不存在");
				response.end();
			}
		})
		
		
		
	})
}


function show(response){ 
	console.log("Request handler 'show' was called");
	fs.readFile("./tmp/test.png","binary",function(error,file){ 
		if(error){ 
			response.writeHead(500,{"Content-Type":"text/plain"});
			response.write(error+"\n");
			response.end();
		}else{ 
			response.writeHead(200,{"Content-Type":"image/png"});
			response.write(file,"binary");
			response.end();
		}
	})

}

exports.start = start;
exports.upload = upload;
exports.show  = show;