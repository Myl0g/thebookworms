CREATE TABLE publishers (
    publisher_id bigserial,
    name varchar(100),
    location varchar(100),
    CONSTRAINT publisher_key PRIMARY KEY (publisher_id)
);

CREATE TABLE authors (
    author_id bigserial,
    first_name varchar(50),
    last_name varchar(50),
    gender varchar(20),
    nationality varchar(50),
    CONSTRAINT author_key PRIMARY KEY (author_id)
);

CREATE TABLE members (
    member_id bigserial,
    first_name varchar(50),
    last_name varchar(50),
    CONSTRAINT member_key PRIMARY KEY (member_id)
);

CREATE TABLE books (
    ISBN varchar(50),
    publisher_id integer REFERENCES publishers (publisher_id),
    author_id integer REFERENCES authors (author_id),
    book_name varchar(90),
    book_genre varchar(50),
    total_copies integer,
    CONSTRAINT book_key PRIMARY KEY (ISBN)
);

CREATE TABLE borrow_records (
    member_id integer REFERENCES members (member_id),
    ISBN varchar(50) REFERENCES books (ISBN),
    return_by date
);

INSERT INTO
    publishers (name, location)
VALUES
    ('Bloomsbury Publishing', 'London, England');

INSERT INTO
    authors (first_name, last_name, gender, nationality)
VALUES
    ('Joanne', 'Rowling', 'female', 'British');

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
    );

INSERT INTO
    borrow_records (member_id, ISBN, return_by)
VALUES
    (1, '978-3-16-148410-0', '2020-10-30');