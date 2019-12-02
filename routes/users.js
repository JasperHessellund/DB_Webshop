let express = require('express');
let router = express.Router();
let bodyParser = require('body-parser');
let sql = require('mssql');
//TODO: Check if email and password exists


// Sign up a user to the database
router.post('/signup', function(req, res, next) {
  const config = {
    user: 'sa',
    password: 'webshop',
    server: 'localhost',
    database: 'webshop',
  };
  // Taking all the fields from the form in signup.html where name=""
  let firstName = req.body.inputFirstName;
  let lastName = req.body.inputLastName;
  let gender = req.body.selectGender;
  let address = req.body.inputAddress;
  let zipCode = req.body.inputZipCode;
  let phoneNumber = req.body.inputPhoneNumber;
  let email = req.body.inputEmail;
  let password = req.body.inputPassword;
  sql.connect(config).then(pool => {

    return pool.request()
        .input('cFirstName',sql.VarChar(64), firstName)
        .input('cLastName',sql.VarChar(64), lastName)
        .input('cGender',sql.VarChar(6), gender)
        .input('cAddress',sql.VarChar(255), address)
        .input('nZipCode',sql.Int, zipCode)
        .input('nPhoneNumber',sql.Int, phoneNumber)
        .input('cEmail',sql.VarChar(255), email)
        .input('cPassword',sql.VarChar(255), password)
        .input('nTotalAmount',sql.Int, 0)
        .execute('sp_createUser')
  }).then(result => {
    console.dir(result);
    res.redirect('/')
    sql.close()
  }).catch(err => {
    console.log(err)
    sql.close()
  });
});
router.post('/login', function(req, res, next) {
  const config = {
    user: 'sa',
    password: 'webshop',
    server: 'localhost',
    database: 'webshop',
  };
  let email = req.body.inputEmail;
  let password = req.body.inputPassword;
  sql.connect(config).then(pool => {
    return pool.request()
        .input("cEmail", sql.VarChar(255), email)
        .input("cPassword", sql.VarChar(255), password)
        .execute("sp_login")
  }).then(result => {
    console.log(result);
    res.redirect('/');
    sql.close();
  }).catch(err => {
    console.log(err);
    sql.close();
  })
});
module.exports = router;
