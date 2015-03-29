var fs = require('fs');

fs.exists('test.txt',function(exists){ 
	console.log(exists ? '存在':'不存在');
})