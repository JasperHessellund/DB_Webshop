let express = require('express');
let app = express();
let path = require('path');
let cookieParser = require('cookie-parser');
let logger = require('morgan');
let sassMiddleware = require('node-sass-middleware');
// Body parser for forms
let bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
let indexRouter = require('./routes/index');
let usersRouter = require('./routes/users');


//Load views
app.use(express.static(path.join(__dirname, '/views')));
app.use(express.static(path.join(__dirname, '/views/users')));
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
