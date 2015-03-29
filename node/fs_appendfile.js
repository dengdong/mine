var fs = require('fs');

fs.appendFile('test.txt','data to append', function(err){ 
	if(err) throw err;
	console.log("The 'data to append' was append to file!");
})