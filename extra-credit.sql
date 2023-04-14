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