

var http = require('http');
var url = require('url');

/*
http.createServer(function(request,response){ 
	response.writeHead(200,{"Content-Type":"text/plain"});
	response.write("hello world");
	response.end();
}).listen(8888);
*/

function start(route,handle){ 
	function onRequest(request,response){ 
		
		var pathname = url.parse(request.url).pathname;
		console.log('Request '+ pathname+' received.');
		/*
		var content = route(handle,pathname);
		response.writeHead(200,{"Content-Type":"text/plain"});
		response.write(content );
		response.end();
		*/
		/*
		var postData="";
		request.setEncoding("utf8");
		request.addListener("data",function(postDataChunk){ 
			postData += postDataChunk;
			console.log('Received POST data check ' + postDataChunk +".");
		});
		request.addListener("end",function(){ 
			route(handle,pathname,response,postData);
		});
		*/
		route (handle,pathname,response,request);
	}
	http.createServer(onRequest).listen(8888);
	console.log("server has started.");
}

exports.start = start;