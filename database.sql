CREATE TABLE publishers (
    publisher_id bigserial,
    name varchar(100) NOT NULL,
    location varchar(100) NOT NULL,
    CONSTRAINT publisher_key PRIMARY KEY (publisher_id)
);

CREATE TABLE authors (
    author_id bigserial,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    gender varchar(20) NOT NULL,
    nationality varchar(50) NOT NULL,
    CONSTRAINT author_key PRIMARY KEY (author_id)
);

CREATE TABLE members (
    member_id bigserial,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    CONSTRAINT member_key PRIMARY KEY (member_id)
);

CREATE TABLE books (
    book_id bigserial,
    ISBN varchar(50),
    publisher_id integer REFERENCES publishers (publisher_id),
    author_id integer REFERENCES authors (author_id),
    book_name varchar(90) NOT NULL,
    book_genre varchar(50),
    total_copies integer CHECK (total_copies > 0),
    CONSTRAINT book_key PRIMARY KEY (book_id)
);

CREATE TABLE borrow_records (
    member_id integer REFERENCES members (member_id),
    book_id varchar(50) REFERENCES books (book_id),
    return_by date NOT NULL
);

INSERT INTO
    publishers (name, location)
VALUES
    ('Bloomsbury Publishing', 'London, England'),
    ('FreePress', 'New York, USA');

INSERT INTO
    authors (first_name, last_name, gender, nationality)
VALUES
    ('Joanne', 'Rowling', 'female', 'British'),
    ('Sam', 'Harris', 'male', 'American');

INSERT INTO
    members (first_name, last_name)
VALUES
    ('Chenglei', 'Si');

INSERT INTO
    books (
        ISBN,
        publisher_id,
        author_id,
        book_name,
        book_genre,
        total_copies
    )
VALUES
    (
        '978-3-16-148410-0',
        1,
        1,
        'Harry Potter and the Chamber of Secrets',
        'Fantasy Fiction',
        10
    ),
    (
        null,
        2,
        2,
        'Free Will',
        'nonfiction',
        3
    );

INSERT INTO
    borrow_records (member_id, book_id, return_by)
VALUES
    (1, 1, '2020-10-30'),
    (1, 2, '2020-12-29');