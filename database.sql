CREATE TABLE publishers (
    id bigserial,
    name varchar(100),
    location varchar(100)
);

INSERT INTO
    publishers (name, location)
VALUES
    ('Bloomsbury Publishing', 'London, England');

CREATE TABLE authors (
    id bigserial,
    first_name varchar(50),
    last_name varchar(50),
    gender varchar(20),
    nationality varchar(50)
);

INSERT INTO
    authors (first_name, last_name, gender, nationality)
VALUES
    ('Joanne', 'Rowling', 'female', 'British');

CREATE TABLE members (
    id bigserial,
    first_name varchar(50),
    last_name varchar(50)
);

INSERT INTO
    members (first_name, last_name)
VALUES
    ('Chenglei', 'Si');

CREATE TABLE borrow_records (
    member_id integer,
    book_id varchar(50),
    return_by date
);

INSERT INTO
    borrow_records (member_id, book_id, return_by)
VALUES
    (1, '978-3-16-148410-0', '2020-10-30');

CREATE TABLE books (
    ISBN varchar(50),
    publisher_id integer,
    author_id integer,
    book_name varchar(90),
    book_genre varchar(50),
    total_copies integer
);

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