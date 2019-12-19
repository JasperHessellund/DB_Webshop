let express = require('express');
let router = express.Router();
let bodyParser = require('body-parser');
let sql = require('mssql');
var path = require("path");

const config = {
  user: 'sa',
  password: 'Password123',
  database: 'webshop',
  server: 'localhost',
};
const pool = new sql.ConnectionPool(config);
const poolConnect = pool.connect();
// Sign up a user to the database
router.post('/signup', async function (req, res) {

  // Taking all the fields from the form in signup.html where name=""
  try {
    const pool = await poolConnect;
    const ps = await new sql.PreparedStatement(pool);
    ps.input('firstName', sql.VarChar);
    ps.input('lastName', sql.VarChar);
    ps.input('address', sql.VarChar);
    ps.input('zipCode', sql.VarChar);
    ps.input('phoneNumber,', sql.VarChar);
    ps.input('email', sql.VarChar);
    ps.input('password', sql.VarChar);
    ps.prepare(`EXEC sp_create_user @firstName, @lastName, @address, @zipCode, @phoneNumber, @email, @password, 0`, err => {
      if (err) console.log(err);

      ps.execute({
        firstName: req.body.inputFirstName,
        lastName: req.body.inputLastName,
        address: req.body.inputAddress,
        zipCode: req.body.inputZipCode,
        phoneNumber: req.body.inputPhoneNumber,
        email: req.body.inputEmail,
        password: req.body.inputPassword
          }, (err, result) => {
            console.log(result) // return 12345
            console.log(result.rowsAffected) // Returns number of affected rows in case of INSERT, UPDATE or DELETE statement.

            if (err) {
              console.dir(err);
            }
            if (result.rowsAffected[0] === undefined || result.rowsAffected[0] ===0) {
              res.redirect("/users/login.html")
            }

            else {
              res.redirect("/");
            }
          }
      )

    })
  } catch (err) {
    console.dir(err)
  }
});

let user = {
  id: '',
  email: ''
}
router.get('/getUser', function (req, res) {
  res.send(user);
});

router.get('/getCard', async function (req, res) {
  console.log('bliver ramt!');
  try {
    const pool = await poolConnect;
    const ps = await new sql.PreparedStatement(pool);
    ps.input('user', sql.Int);

    ps.prepare(`SELECT * FROM TCard WHERE nUserID = @user`, err => {
      if (err) console.log(err);

      ps.execute({
            user: user.id
          }, (err, result) => {
            const card = result.recordsets[0];
            res.send(card);
          }
      )

    })
  } catch (err) {
    console.dir(err)
  }
  sql.connect(config).then(() => {
    return sql.query`SELECT * FROM TCard WHERE nUserID = ${user.id}`;
  }).then(result => {
    console.log(result);
    const card = result.recordsets[0];
    res.send(card);
    // sql.close();
  }).catch(err => {
    console.log(err);
  })
  sql.on('error', err => {
    console.log(err)
  })
});

router.post('/login', async function (req, res, next) {

  try {
    const pool = await poolConnect;
    const ps = await new sql.PreparedStatement(pool);
    ps.input('email', sql.VarChar);
    ps.input('password', sql.VarChar);
    ps.prepare(`EXEC sp_login @email, @password`, err => {
      if (err) console.log(err);

      ps.execute({
        email: req.body.inputEmail,
        password: req.body.inputPassword
      }, (err, result) => {
            if (err) {
              console.dir(err);
            }
            if (result.rowsAffected[0] === undefined || result.rowsAffected[0] ===0) {
              res.redirect("/users/login.html")
            }

            else {
              res.sendFile(path.join(__dirname, '../views/shop', 'shop.html'));
            }
          }
          )

    })
  } catch (err) {
    console.dir(err)
  }
});
module.exports = router;
