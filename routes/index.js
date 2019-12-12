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

router.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, '../views/users', 'login.html'));
});

router.get('/shop', function (req, res) {
  res.sendFile(path.join(__dirname, '../views/shop', 'shop.html'));
});



router.post('/createProduct', function (req, res) {
  const name = req.body.productName;
  const description = req.body.description;
  const price = req.body.price

  sql.connect(config).then(() => {
    return sql.query`EXEC sp_create_product ${name}, ${description}, ${price}, 
    ${1}, ${2}`;
  }).then(result => {
    console.dir(result)
    res.sendFile(path.join(__dirname, '../views/shop', 'shop.html'));
  }).catch(err => {
    console.log(err)
  })
  sql.on('error', err => {
    console.log(err)
  })
});

router.get('/create-product', function (req, res) {
  res.sendFile(path.join(__dirname, '../views/shop', 'create-product.html'));
});


router.get('/getProducts', function (req, res) {
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

router.get('/update-product', function (req, res) {
  res.sendFile(path.join(__dirname, '../views/shop', 'update-product.html'));
});

let productUpdate = {
  cName: '',
  cDescription: '',
  nPrice: ''
}

router.post('/setProduct', function (req, res) {
  console.log('PRODUCT::: ', req.body);
  // productUpdate.cName = req.body.productName;
  // productUpdate.cDescription = req.body.description;
  // productUpdate.nPrice = req.body.price
});


router.get('/getProduct', function (req, res) {
  console.log('ID: ', req.body.id); 
  sql.connect(config).then(() => {
    return sql.query`EXEC sp_get_product`;
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
