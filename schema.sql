CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(200) UNIQUE NOT NULL,
    password VARCHAR(230) NOT NULL
);

CREATE TABLE submissions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    text TEXT NOT NULL
);

CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    submission_id INTEGER REFERENCES submissions(id) ON DELETE CASCADE,
    rating_value INTEGER NOT NULL CHECK (rating_value >= 1 AND rating_value <= 10)
);
