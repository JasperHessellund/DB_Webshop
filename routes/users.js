let express = require('express');
let router = express.Router();
let bodyParser = require('body-parser');
let sql = require('mssql');
var path = require("path");

const config = {
  user: 'test',
  password: 'test',
  database: 'webshop',
  server: 'localhost',
};

// Sign up a user to the database
router.post('/signup', function(req, res) {

  // Taking all the fields from the form in signup.html where name=""
  let firstName = req.body.inputFirstName;
  let lastName = req.body.inputLastName;
  let address = req.body.inputAddress;
  let zipCode = req.body.inputZipCode;
  let phoneNumber = req.body.inputPhoneNumber;
  let email = req.body.inputEmail;
  let password = req.body.inputPassword;

  sql.connect(config).then(() => {
    return sql.query`EXEC sp_create_user ${firstName}, ${lastName}, ${address}, 
    ${zipCode}, ${phoneNumber}, ${email}, ${password}, 0; `;

  }).then(result => {
    console.dir(result)

    if (result.rowsAffected[0]===undefined) {
      res.redirect("/users/signup.html")
      sql.close();
    }
    else {
      sql.close()
      res.redirect("/")
    }
  }).catch(err => {
    console.log(err)
  })
  sql.on('error', err => {
    console.log(err)
  })
});

router.post('/login', function(req, res, next) {

  let email = req.body.inputEmail;
  let password = req.body.inputPassword;
  sql.connect(config).then(() => {
    return sql.query`EXEC sp_login ${email}, ${password}; `;

  }).then(result => {
    console.dir(result)

    if (result.rowsAffected[0]===undefined || result.rowsAffected[0] === 0) {
      sql.close();
      console.log('test: 1');
      // res.sendFile(path.join(__dirname, '../views/users', 'login.html'));
    }
    else {
      sql.close()
      console.log('test: 2');
      // res.redirect("/shop");
      res.sendFile(path.join(__dirname, '../views/shop', 'shop.html'));
    }
  }).catch(err => {
    console.log(err)
  })
  sql.on('error', err => {
    console.log(err)
  })
});
module.exports = router;
