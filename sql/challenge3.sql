---step1 
CREATE TABLE players (
  id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  age INTEGER,
  dominant_hand VARCHAR(20),
  active INTEGER,
  last_update DATE NOT NULL
);

CREATE TABLE sports (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  season VARCHAR(15),
  last_update DATE NOT NULL
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  last_update DATE NOT NULL
);


CREATE TABLE sport_categories (
  sport_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  last_update DATE NOT NULL,
  FOREIGN KEY (sport_id) REFERENCES sports(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE sport_players (
  player_id INTEGER NOT NULL,
  sport_id INTEGER NOT NULL,
  last_update DATE NOT NULL,
  FOREIGN KEY (player_id) REFERENCES players(id),
  FOREIGN KEY (sport_id) REFERENCES sports(id)
);
--step2 
CREATE TABLE sport_categories (
  sport_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  last_update DATE NOT NULL,
  PRIMARY KEY (sport_id, category_id),
  FOREIGN KEY (sport_id) REFERENCES sports(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE sport_players (
  player_id INTEGER NOT NULL,
  sport_id INTEGER NOT NULL,
  last_update DATE NOT NULL,
  PRIMARY KEY (player_id, sport_id),
  FOREIGN KEY (player_id) REFERENCES players(id),
  FOREIGN KEY (sport_id) REFERENCES sports(id)
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  last_update DATE NOT NULL
);

-- step3 
CREATE TABLE players2 (
  id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  age INTEGER DEFAULT 0,
  dominant_hand VARCHAR(20),
  active INTEGER,
  last_update DATE NOT NULL,
  CONSTRAINT age_check CHECK(age >= 0),
  CONSTRAINT dominant_hand_check CHECK(dominant_hand IN ("right","left","ambidexterity")),
  CONSTRAINT active_check CHECK(active IN (0, 1))
);


CREATE TABLE sports2 (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  season VARCHAR(15) DEFAULT "always",
  last_update DATE NOT NULL,
  CONSTRAINT season_check CHECK(season IN ("always", "spring", "summer", "autumn", "winter"))
);

--step4
INSERT INTO players2 (
  id,
  first_name,
  last_name,
  age,
  dominant_hand,
  active,
  last_update
)
SELECT
  id,
  first_name,
  last_name,
  age,
  dominant_hand,
  active,
  last_update
FROM players
WHERE
  age >= 0
  AND dominant_hand IN ("right","left","ambidexterity")
  AND active IN (0, 1);

INSERT INTO sports2 (
  id,
  name,
  season,
  last_update)
SELECT 
  id,
  name,
  season,
  last_update
 FROM SPORTS 
WHERE 
season IN ("always", "spring", "summer", "autumn", "winter")

--step5
CREATE INDEX idx_players_last_name ON players(last_name);
CREATE INDEX idx_sports_season ON sports(name);
CREATE INDEX idx_sport_categories_sport_id
ON sport_categories(category_id);
CREATE INDEX idx_sport_players_player_id
ON sport_players(player_id);
