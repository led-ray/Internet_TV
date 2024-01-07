-- Channels
CREATE TABLE Channels (
    Channel_ID INT PRIMARY KEY AUTO_INCREMENT,
    Channel_Name VARCHAR(50) NOT NULL
);
ALTER TABLE Channels ADD INDEX index_Channels_on_Channel_Name(Channel_Name);

-- Programs
CREATE TABLE Programs (
    Program_ID INT PRIMARY KEY AUTO_INCREMENT,
    Program_Title VARCHAR(50) NOT NULL,
    Program_Desc TEXT
);
ALTER TABLE Programs ADD INDEX index_Programs_on_Program_Title(Program_Title);

-- Channel_Timetable
CREATE TABLE Channel_Timetable (
    Timetable DATETIME NOT NULL,
    Channel_ID INT NOT NULL,
    Program_ID INT NOT NULL,
    PRIMARY KEY(Timetable,Channel_ID),
    FOREIGN KEY (Channel_ID) REFERENCES Channels(Channel_ID),
    FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID)
);

-- Seasons
CREATE TABLE Seasons (
    Season_ID INT PRIMARY KEY AUTO_INCREMENT,
    Season_Num INT,
    Program_ID INT NOT NULL,
    FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID)
);

-- Episodes
CREATE TABLE Episodes (
    Episode_ID INT PRIMARY KEY AUTO_INCREMENT,
    Season_ID INT NOT NULL,
    Episode_Num INT,
    Episode_Title VARCHAR(50) NOT NULL,
    Episode_Desc TEXT,
    Duration TIME,
    Release_Date DATE,
    FOREIGN KEY (Season_ID) REFERENCES Seasons(Season_ID)
);
ALTER TABLE Episodes ADD INDEX index_Episodes_on_Episode_Title(Episode_Title);
ALTER TABLE Episodes ADD INDEX index_Episodes_on_Release_Date(Release_Date);

-- Genres
CREATE TABLE Genres (
    Genre_ID INT PRIMARY KEY AUTO_INCREMENT,
    Genre_Name VARCHAR(20) NOT NULL,
    UNIQUE KEY (Genre_Name)
);

-- Program_Genre
CREATE TABLE Program_Genre (
    Program_ID INT NOT NULL,
    Genre_ID INT NOT NULL,
    PRIMARY KEY(Program_ID,Genre_ID),
    FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID)
);

-- Episode_Views
CREATE TABLE Episode_Views (
    Views INT DEFAULT 0,
    Channel_ID INT NOT NULL,
    Episode_ID INT NOT NULL,
    Timetable DATETIME NOT NULL,
    PRIMARY KEY(Channel_ID,Episode_ID,Timetable),
    FOREIGN KEY (Episode_ID) REFERENCES Episodes(Episode_ID),
    FOREIGN KEY (Channel_ID) REFERENCES Channels(Channel_ID)
);
