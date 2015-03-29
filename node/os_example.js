
var os = require('os');

var result = os.platform();//查看操作系统平台 
var release = os.release(); //查看操作系统版本
var type = os.type();//查看操作系统名称
var arch = os.arch();//查看操作系统CPU架构

console.log(result);
console.log(release);
console.log(type);
console.log(arch);