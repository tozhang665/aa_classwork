PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
CREATE TABLE users( 
    id INTEGER PRIMARY KEY, -- 1 2 3 4 5 6 7 8 9
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
    id INTEGER PRIMARY KEY, -- 1 2 3 4 5 6 7 8 9
    title TEXT NOT NULL,
    body  TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY(author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS questions_follows;
CREATE TABLE questions_follows(
    id INTEGER PRIMARY KEY,  -- 1 2 3 4 5 6 7 8 9
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(parent_id) REFERENCES replies(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,  -- 1 2 3 4 5 6 7 8 9
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
    users(fname,lname)
VALUES
    ('Kent','Zhang'),
    ('Tony','Zhang');
