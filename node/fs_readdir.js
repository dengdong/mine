var fs = require('fs');
fs.readdir('test',function(err,files){ 
	console.log(files);
})