-- STUDENTS.SQL
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

--COURSES.SQL

CREATE TABLE courses (
  code TEXT(40) PRIMARY KEY NOT NULL,
  description TEXT(400),
  start DATE NOT NULL,
  end DATE NOT NULL,
  CHECK (length(code) >= 7), -- minimum length of 7
  CHECK (end > start)
);

INSERT INTO courses (code, start, end, description) VALUES
  ('INFO330A', '2023-04-01', '2023-06-01', 'Data and databases');

INSERT INTO courses (code, start, end, description) VALUES
  ('INFO314', '2023-04-01', '2023-06-01', 'Networking and distributed Systems'),
  ('INFO448A', '2023-09-25', '2023-12-19', 'Introduction to iOS'),
  ('INFO449A', '2023-09-25', '2023-12-19', 'Introduction to Android'),
  ('BAW0100', '2023-04-01', '2023-06-01', 'Introduction to Basket-Weaving'),
  ('BAW100A', '2023-04-01', '2023-06-01', 'Underwater Basket-Weaving')
  ;

-- BUILDINGS.SQL

CREATE TABLE buildings (
  name TEXT(80) NOT NULL,
  shortname TEXT(10) UNIQUE,
  id INTEGER PRIMARY KEY AUTOINCREMENT
);

INSERT INTO buildings (name, shortname) VALUES
('Suzallo', 'Suz'),
('Odegaard', 'Ode'),
('Population Health', 'PopHealth');

CREATE TABLE rooms (
    number INTEGER,
    buildingid INTEGER,
    seating INTEGER,
    FOREIGN KEY (buildingid) REFERENCES buildings(id)
);

INSERT INTO rooms VALUES
(230, (SELECT id FROM buildings WHERE name="Odegaard"), 30);

--REGISTRATIONS.SQL

CREATE TABLE registrations (
studentid INTEGER,
course TEXT(40),
grade REAL DEFAULT NULL,
FOREIGN KEY (studentid) REFERENCES students (id)
FOREIGN KEY (course) REFERENCES courses(code)
);

INSERT INTO registrations (studentid, course) VALUES
((SELECT id FROM students WHERE firstname = 'Fred' AND lastname = 'Flintstone'), 'INFO330A'),
((SELECT id FROM students WHERE firstname = 'Fred' AND lastname = 'Flintstone'), 'INFO448A'),
((SELECT id FROM students WHERE firstname = 'Fred' AND lastname = 'Flintstone'), 'INFO314');

INSERT INTO registrations (studentid, course) VALUES
((SELECT id FROM students WHERE firstname = 'Barney' AND lastname = 'Rubble'), 'INFO330A'),
((SELECT id FROM students WHERE firstname = 'Barney' AND lastname = 'Rubble'), 'INFO449A');

INSERT INTO registrations (studentid, course) VALUES
((SELECT id FROM students WHERE firstname = 'Wilma' AND lastname = 'Flintstone'), 'BAW010'),
((SELECT id FROM students WHERE firstname = 'Wilma' AND lastname = 'Flintstone'), 'BAW100A');

INSERT INTO registrations (studentid, course) VALUES
((SELECT id FROM students WHERE firstname = 'Betty' AND lastname = 'Rubble'), 'BAW010');

--Extra Credit 1
CREATE TABLE timeslots (
  id INTEGER PRIMARY KEY,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL
);

INSERT INTO timeslots (start_time, end_time) VALUES
  ('09:30', '10:30'),
  ('11:00', '12:15'),
  ('13:45', '14:30'),
  ('15:00', '16:15'),
  ('16:30', '18:00'),
  ('18:30', '19:45'),
  ('20:15', '21:30'),
  ('21:45', '23:45');

--Extra Credit 2
CREATE TABLE rooms_temp (
  id INTEGER PRIMARY KEY,
  number INTEGER,
  buildingid INTEGER,
  seating INTEGER
);

INSERT INTO rooms_temp SELECT * FROM rooms;

DROP TABLE rooms;

ALTER TABLE rooms_temp RENAME TO rooms;

INSERT INTO rooms (number, buildingid, seating) VALUES
  (101, 1, 30),
  (102, 1, 20),
  (201, 2, 25),
  (202, 2, 18),
  (301, 3, 15),
  (302, 3, 10);

--Extra Credit 3

CREATE TABLE schedule (
  id INTEGER PRIMARY KEY,
  coursecode TEXT,
  roomid INTEGER,
  timeslotid INTEGER,
  UNIQUE(roomid, timeslotid)
  );

  INSERT INTO schedule (coursecode, roomid, timeslotid) VALUES
  ('INFO330A', 1, 1),
  ('INFO314', 2, 2),
  ('INFO448A', 3, 3),
  ('INFO449A', 1, 4),
  ('BAW0100', 2, 5),
  ('BAW100A', 3, 6);