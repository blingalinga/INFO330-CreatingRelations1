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