create schema librarymanagement;
use librarymanagement;

-- Create tables
create table authors (
    author_id int primary key auto_increment,
    author_name varchar(255) not null
);

create table genres (
    genre_id int primary key auto_increment,
    genre_name varchar(255) not null
);

create table books (
    book_id int primary key auto_increment,
    title varchar(255) not null,
    publication_year year,
    author_id int not null,
    genre_id int not null,
    foreign key (author_id) references authors(author_id),
    foreign key (genre_id) references genres(genre_id)
);

create table users (
    user_id int primary key auto_increment,
    username varchar(255) not null,
    email varchar(255) not null
);

create table borrowed_books (
    borrow_id int primary key auto_increment,
    book_id int not null,
    user_id int not null,
    borrow_date date not null,
    return_date date not null,
    foreign key (book_id) references books(book_id),
    foreign key (user_id) references users(user_id)
);



-- Insert dummy records into authors table
insert into authors (author_name) values ('Author One'), ('Author Two'), ('Author Three');

-- Insert dummy records into genres table
insert into genres (genre_name) values ('Fiction'), ('Non-Fiction'), ('Science Fiction');

-- Insert dummy records into books table
insert into books (title, publication_year, author_id, genre_id) values
('Book One', 2020, 1, 1),
('Book Two', 2021, 2, 2),
('Book Three', 2022, 3, 3);

-- Insert dummy records into users table
insert into users (username, email) values
('user1', 'user1@gmail.com'),
('user2', 'user2@gmail.com'),
('user3', 'user3@gmail.com');

-- Insert dummy records into borrowed_books table
insert into borrowed_books (book_id, user_id, borrow_date, return_date) values
(1, 1, '2024-01-01', '2024-01-15'),
(2, 2, '2024-02-01', '2024-02-15'),
(3, 3, '2024-03-01', '2024-03-15');