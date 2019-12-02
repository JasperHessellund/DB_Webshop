var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var sassMiddleware = require('node-sass-middleware');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();
//Load views
app.use(express.static(path.join(__dirname, 'views')));
// Load public
app.use(express.static(path.join(__dirname,'/public')));
// Load bootstrap js
app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js')); // redirect bootstrap JS
// Load jquery
app.use('/js', express.static(__dirname + '/node_modules/jquery/dist')); // redirect JS jQuery
// Load bootstrap css
app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css')); // redirect CSS bootstrap


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(sassMiddleware({
  src: path.join(__dirname, 'public'),
  dest: path.join(__dirname, 'public'),
  indentedSyntax: true, // true = .sass and false = .scss
  sourceMap: true
}));


app.use('/', indexRouter);
app.use('/users', usersRouter);

module.exports = app;
