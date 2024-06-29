const express = require('express')
const session = require('express-session');
const mysql = require("mysql2");

const app = express()
const conn = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "nodejs"
});
const urlencodedParser = express.urlencoded({ extended: false });

app.set('view engine', 'ejs');
app.use(express.static("public"))
app.use(session({
    secret: 'abcdefg',
    resave: false,
    saveUninitialized: true
}));


// Catalog
app.get("/", (req, res) => {
    conn.query("SELECT * FROM books", (_err, rows, _f) => {
        res.render('catalog.ejs', { books: rows, session: req.session });
    })
})


// Book page
app.get("/book/:id", (req, res) => {
    let b;
    conn.query("SELECT * FROM books WHERE id=?", [req.params.id], (_err, rows, _f) => {
        b = rows[0];
    })
    conn.query("SELECT * FROM rating WHERE book_id=? AND user_id=?", [req.params.id, req.session.user_id], (_err, rows, _f) => {
        res.render('book-page.ejs', { book: b, rating: rows[0], session: req.session });
    })
})

app.post("/rating", urlencodedParser, (req, res) => { 
    conn.query("insert into rating values(?,?,?) as data ON DUPLICATE KEY UPDATE rate=data.rate;",
                [req.body.book, req.session.user_id, req.body.rating], (_err, rows, _f) => {
        res.send("ok");
    })
})


// Feedback
app.get("/feedback", (req, res) => {
    res.render('feedback.ejs', { session: req.session });
})

app.post("/feedback", urlencodedParser, (req, res) => {
    const { name, email, comment } = req.body
    conn.query("INSERT INTO feedback(name, email, comment) VALUES(?,?,?)", [name, email, comment], (err, r, f) => {
        res.send(err ? err.message : "ok")
    })
})


// Login
app.get("/login", (req, res) => {
    res.render('login.ejs');
})

app.post("/login", urlencodedParser, (req, res) => {
    const { isLogin, login, pswd, name } = req.body;
    if (isLogin == "true") {
        // login
        conn.query('SELECT * FROM users WHERE login = ?', [login], (err, r, f) => {
            if (r.length > 0 && r[0].password == pswd) {
                req.session.isActive = true;
                req.session.user_id = r[0].id;
                req.session.name = r[0].name;
                req.session.login = r[0].login;
                req.session.role = r[0].role;

                res.send('ok');
            } else {
                res.send('Неправильный логин или пароль!');
            }
        });
    } else {
        // registration
        conn.query('SELECT * FROM users WHERE login = ?', [login], (err, r, f) => {
            if (r.length > 0) { // is login taken
                res.send('Пользователь с таким логином уже существует!');
                return;
            }
            //create user
            conn.query('INSERT INTO users(name, login, password) VALUES(?,?,?)', [name, login, pswd], (err, r, f) => {
                if (err) console.log(err.message);
                else {
                    conn.query('SELECT * FROM users WHERE login = ?', [login], (_e, r2, _f) => {
                        if (r.length > 0 && r[0].password == pswd) {
                            req.session.isActive = true;
                            req.session.user_id = r2[0].id;
                            req.session.name = r2[0].name;
                            req.session.login = r2[0].login;
                            req.session.role = r2[0].role;

                            res.send('ok');
                        }
                    })
                }
            })
        })
    }
})

app.get("/logout", (req, res) => {
    req.session.destroy((err) => { 
        if (err) {
            console.log(err);
            res.status(500).send('Ошибка при выходе');
        } else {
            res.writeHead(302, { 'Location': '/' })
            res.end()
        }
    });
})


// admin panel
let msg = ""

app.get("/admin-panel", (req, res) => {
    if (req.session.role != "A") {
        res.status(403).send("Access denied!")
        return
    }

    conn.query("SELECT * FROM books", (_err, rows, _f) => {
        res.render('admin-panel.ejs', { books: rows, session: req.session, msg });
        msg = ""
    })
})

app.post("/admin-panel/add", urlencodedParser, (req, res) => {
    const { name, author, img, descr } = req.body
    conn.query("INSERT INTO books(name, author, img, description) VALUES(?,?,?,?)", [name, author, img, descr], (err, r, f) => {
        msg = "Данные успешно добавлены!"
        res.writeHead(302, { 'Location': '/admin-panel' })
        res.end()
    })
})

app.post("/admin-panel/edit", urlencodedParser, (req, res) => {
    const { id, name, author, img, descr } = req.body
    conn.query("UPDATE books SET name=?, author=?, img=?, description=? WHERE id=?", [name, author, img, descr, id], (err, r, f) => {
        msg = "Данные успешно обновлены!"
        res.writeHead(302, { 'Location': '/admin-panel' })
        res.end()
    })
})

app.post("/admin-panel/delete", urlencodedParser, (req, res) => {
    let {books} = req.body
    if (typeof books === "string") {
        books = [books]
    }

    books.forEach(book => { conn.query("DELETE FROM books WHERE id=?", [book], (err, r, f) => {}) });

    msg = "Данные удалены!"
    res.writeHead(302, { 'Location': '/admin-panel' })
    res.end()
})


app.get("/admin-panel/feedback", (req, res) => {
    conn.query("SELECT * FROM feedback", (_err, rows, _f) => {
        res.render('feedback-show.ejs', { session: req.session, data: rows });
    })
})



// 404
app.use(function (req, res, next) {
    res.status(404).render('404.ejs');
});

app.listen(3000, () => { console.log("Server is running") })