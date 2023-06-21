-- Create the Table Teams from the steel data
CREATE TABLE Teams (
team_id INT PRIMARY KEY,
team_name VARCHAR(50) NOT NULL,
country VARCHAR(50),
captain_id INT
);

-- Insert the data into the Table Teams
INSERT INTO Teams (team_id, team_name, country, captain_id)
VALUES (1, 'Cloud9', 'USA', 1),
(2, 'Fnatic', 'Sweden', 2),
(3, 'SK Telecom T1', 'South Korea', 3),
(4, 'Team Liquid', 'USA', 4),
(5, 'G2 Esports', 'Spain', 5);

-- Create the Table Players from the steel data
CREATE TABLE Players (
player_id INT PRIMARY KEY,
player_name VARCHAR(50) NOT NULL,
team_id INT,
role VARCHAR(50),
salary INT,
FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
-- Insert the data into the Players Teams
INSERT INTO Players (player_id, player_name, team_id, role, salary)
VALUES (1, 'Shroud', 1, 'Rifler', 100000),
(2, 'JW', 2, 'AWP', 90000),
(3, 'Faker', 3, 'Mid laner', 120000),
(4, 'Stewie2k', 4, 'Rifler', 95000),
(5, 'Perkz', 5, 'Mid laner', 110000),
(6, 'Castle09', 1, 'AWP', 120000),
(7, 'Pike', 2, 'Mid Laner', 70000),
(8, 'Daron', 3, 'Rifler', 125000),
(9, 'Felix', 4, 'Mid Laner', 95000),
(10, 'Stadz', 5, 'Rifler', 98000),
(11, 'KL34', 1, 'Mid Laner', 83000),
(12, 'ForceZ', 2, 'Rifler', 130000),
(13, 'Joker', 3, 'AWP', 128000),
(14, 'Hari', 4, 'AWP', 90000),
(15, 'Wringer', 5, 'Mid laner', 105000);

-- Create the Table Matches from the steel data
CREATE TABLE Matches (
match_id INT PRIMARY KEY,
team1_id INT,
team2_id INT,
match_date DATE,
winner_id INT,
score_team1 INT,
score_team2 INT,
FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
FOREIGN KEY (winner_id) REFERENCES Teams(team_id)
);

-- Insert the data into the Table Matches
INSERT INTO Matches (match_id, team1_id, team2_id, match_date, winner_id, score_team1, score_team2)
VALUES (1, 1, 2, '2022-01-01', 1, 16, 14),
(2, 3, 5, '2022-02-01', 3, 14, 9),
(3, 4, 1, '2022-03-01', 1, 17, 13),
(4, 2, 5, '2022-04-01', 5, 13, 12),
(5, 3, 4, '2022-05-01', 3, 16, 10),
(6, 1, 3, '2022-02-01', 3, 13, 17),
(7, 2, 4, '2022-03-01', 2, 12, 9),
(8, 5, 1, '2022-04-01', 1, 11, 15),
(9, 2, 3, '2022-05-01', 3, 9, 10),
(10, 4, 5, '2022-01-01', 4, 13, 10);


-- NAME OF THE PERSON WHOSE SALARY IS GREATER THAN 100000

SELECT player_name FROM Players
WHERE salary > 100000;

-- FIND THE NAME OF TEAM OF THE PLAYER WITH TEAM_ID 3

SELECT t.team_name
FROM Players p
JOIN Teams t
ON p.team_id=t.team_id
WHERE player_id=3;

-- WHAT ARE THE TOTAL NUMBER OF PLAYERS IN EACH TEAM

SELECT t.team_name,count(t.team_id) AS total_players
FROM Players p
JOIN Teams t
ON p.team_id=t.team_id
GROUP BY t.team_name

-- FIND THE NAME OF THE TEAM AND CAPTAIN WITH ID 2

SELECT t.team_name,p.player_name AS captain
FROM Players p
JOIN Teams t
ON p.team_id=t.team_id
WHERE t.captain_id=2
LIMIT 1;



-- TO FIND THE PLAYER NAME,TEAM NAME AND THEIR ROLE WITH TEAM_ID 1

SELECT p.player_name,p.role,t.team_name
FROM Players p
JOIN Teams t
ON p.team_id=t.team_id
WHERE t.team_id=1; 

--  TO FIND THE NAME OF THE TEAM AND MATCHES IT WON

SELECT t.team_name,m.winner_id,count(m.winner_id) AS times_won
FROM Teams t
JOIN Matches m
ON t.team_id=m.winner_id
GROUP BY m.winner_id;

-- FIND THE SALARY THE PLAYERS IN COUNTRY USA

SELECT p.player_name,p.salary
FROM Players p
JOIN Teams t
ON p.team_id=t.team_id
WHERE country LIKE 'USA';

-- FIND THE NAME OF THE TEAM WHO WON MOST OF THE MATCHES

SELECT t.team_name,count(m.winner_id) AS matches_won
FROM Matches m
JOIN Teams t
ON t.team_id=m.winner_id
GROUP BY m.winner_id
ORDER BY matches_won DESC
LIMIT 1;

-- FIND THE TEAM NAMES WITH NUMBER OF PLAYERS WITH SALARY GREATER THAN 100000

SELECT t.team_name,count(p.player_id) AS no_of_players
FROM Players p
JOIN Teams t
ON p.team_id=t.team_id
WHERE p.salary>100000
GROUP BY t.team_name
ORDER BY no_of_players DESC;

-- FIND THE DATE AND SCORE OF THE MATCH WITH MATCH_ID 3

SELECT match_date,score_team1,score_team2
FROM Matches
WHERE match_id=3;




























