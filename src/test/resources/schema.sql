--drop table  if exists users, requests, items,  bookings, comments;
CREATE  TABLE IF NOT EXISTS users(
id INTEGER generated BY DEFAULT AS IDENTITY PRIMARY KEY,
name VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE);


CREATE  TABLE IF NOT EXISTS requests(
id INTEGER generated BY DEFAULT AS IDENTITY PRIMARY KEY,
description VARCHAR(4000) NOT NULL,
user_id INTEGER NOT NULL  REFERENCES users(id),
created  TIMESTAMP WITHOUT TIME ZONE NOT NULL);

CREATE  TABLE IF NOT EXISTS items(
id INTEGER generated BY DEFAULT AS IDENTITY PRIMARY KEY,
name VARCHAR(40) NOT NULL,
description VARCHAR(4000) NOT NULL,
available boolean NOT NULL,
user_id INTEGER NOT NULL  REFERENCES users(id),
request_id INTEGER REFERENCES requests(id));


CREATE  TABLE IF NOT EXISTS bookings(
id INTEGER generated BY DEFAULT AS IDENTITY PRIMARY KEY,
starting TIMESTAMP WITHOUT TIME ZONE NOT NULL,
ending TIMESTAMP WITHOUT TIME ZONE  NOT NULL,
item_id INTEGER NOT NULL  REFERENCES items(id),
booker_id INTEGER NOT NULL   REFERENCES users(id),
status VARCHAR(40) NOT NULl);

CREATE  TABLE IF NOT EXISTS comments(
id INTEGER generated BY DEFAULT AS IDENTITY PRIMARY KEY,
text VARCHAR(4000)  NOT NULL,
created TIMESTAMP WITHOUT TIME ZONE  NOT NULL,
author_id INTEGER NOT NULL REFERENCES users(id),
item_id INTEGER NOT NULL REFERENCES items(id));