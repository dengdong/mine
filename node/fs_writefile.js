var fs = require("fs");

fs.writeFile('test.txt','hello node',function (err){ 
	if(err) throw err;
	console.log("saved successfully");
})