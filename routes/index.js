let express = require('express');
let router = express.Router();
var path = require("path");
let sql = require('mssql');
let bodyParser = require('body-parser');
const urlencodedParser = bodyParser.urlencoded({ extended: false });
// app.use(bodyParser.json({limit: '50mb', extended: true}));
// app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));

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
    // console.dir(result);
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


router.post('/rateProduct', function (req, res) {
  const userID = parseInt(req.body.data.userID);
  const productID = parseInt(req.body.data.productID);
  const rating = parseInt(req.body.data.rating);
  const comment = req.body.data.comment;

  console.log(typeof userID);
  sql.connect(config).then(() => {
    return sql.query`EXEC sp_rate_product ${userID}, ${productID}, ${rating}, ${comment}`;
  }).then(result => {
    console.dir(result);
  }).catch(err => {
    console.log(err);
  })
  sql.on('error', err => {
    console.log(err);
  });
});

router.post('/buyProduct', function (req, res) {
  let products = req.body.data.products;
  let cardID = parseInt(req.body.data.card);
  let userID = parseInt(req.body.data.userID);
  let totalAmount = parseInt(req.body.data.totalAmount);
  let tax = 25;
  const jsonProducts = JSON.stringify(products);

  sql.connect(config).then(() => {
    return sql.query`EXEC sp_buy_product ${tax}, ${totalAmount}, ${cardID}, ${userID}, ${jsonProducts}`;
  }).then(result => {
    console.dir(result);
  }).catch(err => {
    console.log(err);
  });
  sql.on('error', err => {
    console.log(err);
  })
});

router.get('/getProduct', function (req, res) {
  sql.connect(config).then(() => {
    return sql.query`EXEC sp_get_product`;
  }).then(result => {
    res.send(result.recordset);
  }).catch(err => {
    console.log(err);
  })
  sql.on('error', err => {
    console.log(err);
  })
});

router.get('/searchProducts', function (req, res) {
  console.log("req.query", req.query);
  const filterName = req.query.filterName;
  const filterDescription = req.query.filterDescription;
  console.log("filterName", filterName);
  var pool = new sql.ConnectionPool(config);
  pool.connect().then(function () {
    const ps = new sql.PreparedStatement(pool)
    ps.input('filterName', sql.VarChar(255));
    ps.input('filterDescription', sql.Text);
    ps.prepare("SELECT * FROM tProduct WHERE (cName LIKE @filterName AND cDescription LIKE @filterDescription);", err => {

      if (err) console.log(err);
      ps.execute({ filterName: "%" + filterName + "%", filterDescription: "%" + filterDescription + "%" }, (err, result) => {

        if (err) console.log(err);
        res.status(200).json({
          products: result
        });

        ps.unprepare(err => {

          if (err) console.log(err);
        })
      })
    })
  }).catch(function (err) {
    console.log(err);
  });


})

module.exports = router;
