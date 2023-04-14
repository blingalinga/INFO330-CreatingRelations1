CREATE TABLE students (
  id INTEGER,
  firstname TEXT(40),
  lastname TEXT(80),
  age INTEGER
);

INSERT INTO students(id, firstname, lastname, age) VALUES
(1, 'Fred', 'Flintstone', 35),
(2, 'Wilma', 'Flintstone', 29),
(3, 'Barney', 'Rubble', 33),
(4, 'Betty', 'Rubble', 29),
(5, 'Pebbles', 'Flintstone', 1),
(6, 'Bam-Bam', 'Rubble', 1)
;

INSERT INTO students( id, firstname, lastname, age) VALUES
(7, 'Jeremy', 'Zucker', 27),
(8, 'Gloria', 'Tang', 31),
(9, 'Eric', 'Chou', 27),
(10, 'Felonius', 'Gru', 40)
;