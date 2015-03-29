var fs = require('fs');

fs.unlink('11.txt',function(err){ 
	if(err) throw err;
	console.log('删除成功');
})