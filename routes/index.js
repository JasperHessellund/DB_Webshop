let express = require('express');
let router = express.Router();
var path = require("path");
let sql = require('mssql');
let bodyParser = require('body-parser');

const config = {
  user: 'test',
  password: 'test',
  database: 'webshop',
  server: 'localhost'
};

router.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '../views/users', 'login.html'));
});

router.get('/shop', function(req, res) {
  res.sendFile(path.join(__dirname, '../views/shop', 'shop.html'));
});

// router.get('/createProduct', function(req, res) {
//   res.send('Test');
// });

router.get('/create-product', function(req, res) {
  console.log('bliver ramt!');
  res.sendFile(path.join(__dirname, '../views/shop', 'create-product.html'));
});


router.get('/getProducts', function(req, res) {
  sql.connect(config).then(() => {
    return sql.query`EXEC sp_get_all_products`;
  }).then(result => {
    console.dir(result);
    res.send(result.recordset);
  }).catch(err => {
    console.log(err);
  })
  sql.on('error', err => {
    console.log(err);
  })
});

module.exports = router;
