var http = require('http');
var Emailplate = require('..');

var emailplate = new Emailplate({
  views: __dirname + '/emailplates'
});

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  emailplate.render('blueprint', function(err, html){
    res.write(html);
    res.end();
  });
}).listen(1337);

console.log('Server running at http://0.0.0.0:1337');