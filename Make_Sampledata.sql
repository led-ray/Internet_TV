-- Channels
INSERT INTO Channels (Channel_ID, Channel_Name) VALUES
(1, 'Channel 1'),
(2, 'Channel 2'),
(3, 'Channel 3');

-- Programs
INSERT INTO Programs (Program_ID, Program_Title, Program_Desc) VALUES
(1, 'Program 1', 'hoge'),
(2, 'Program 2', 'huga'),
(3, 'Program 3', 'hugo');

-- Channel_Timetable
INSERT INTO Channel_Timetable (Timetable, Channel_ID, Program_ID) VALUES
('2024-01-01 0:00:00', 1, 1),
('2024-01-01 1:00:00', 2, 1),
('2024-01-01 2:00:00', 3, 1),
('2024-01-08 0:00:00', 1, 2),
('2024-01-08 1:00:00', 2, 2),
('2024-01-08 2:00:00', 3, 2),
('2024-01-15 0:00:00', 1, 3),
('2024-01-15 1:00:00', 2, 3),
('2024-01-15 2:00:00', 3, 3);

-- Seasons
INSERT INTO Seasons (Season_ID, Season_Num, Program_ID) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 2),
(4, 2, 2),
(5, 1, 3);

-- Episodes
INSERT INTO Episodes (Episode_ID, Season_ID, Episode_Num, Episode_Title, Episode_Desc, Duration, Release_Date) VALUES
(1, 1, 1, 'Episode A', 'A', '00:30:00','2024-01-01 0:00:00'),
(2, 3, 1, 'Episode B', 'AA', '01:00:00','2024-01-01 1:00:00'),
(3, 5, 1, 'Episode C', 'AAA', '00:45:00','2024-01-01 2:00:00'),
(4, 1, 2, 'Episode D', 'AAAA', '00:30:00','2024-01-08 0:00:00'),
(5, 3, 2, 'Episode E', 'AAAAA', '01:00:00','2024-01-08 1:00:00'),
(6, 5, 2, 'Episode F', 'AAAAAA', '00:45:00','2024-01-08 2:00:00'),
(7, 2, 1, 'Episode G', 'AAAAAAA', '00:30:00','2024-01-15 0:00:00'),
(8, 4, 1, 'Episode H', 'AAAAAAAA', '01:00:00','2024-01-15 1:00:00'),
(9, 5, 3, 'Episode I', 'AAAAAAAAA', '00:45:00','2024-01-15 2:00:00');

-- Genres
INSERT INTO Genres (Genre_ID, Genre_Name) VALUES
(1, 'Genre 1'),
(2, 'Genre 2'),
(3, 'Genre 3');

-- Program_Genre
INSERT INTO Program_Genre (Program_ID, Genre_ID) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 3);

-- Episode_Views
INSERT INTO Episode_Views (Views, Channel_ID, Episode_ID, Timetable) VALUES
(50, 1, 1, '2024-01-01 0:00:00'),
(100, 2, 2, '2024-01-01 1:00:00'),
(150, 3, 3, '2024-01-01 2:00:00'),
(200, 1, 4, '2024-01-08 0:00:00'),
(250, 2, 5, '2024-01-08 1:00:00'),
(300, 3, 6, '2024-01-08 2:00:00'),
(350, 1, 7, '2024-01-15 0:00:00'),
(400, 2, 8, '2024-01-15 1:00:00'),
(450, 3, 9, '2024-01-15 2:00:00');