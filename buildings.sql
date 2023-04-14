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