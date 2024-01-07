# Channels
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Channel_ID | int |   | primary |   | YES |   |  
Channel_Name | varchar(50) |   | INDEX |   |   |   |  

# Channel_Timetable
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Timetable | datetime |   | primary |   |   |   |  
Channel_ID | int |   | primary |   |   | Channelsから |  
Program_ID |   |   |   |   |   | Programsから |  

# Programs
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Program_ID | int |   | primary |   | YES |   |  
Program_Title | varchar(50) |   | INDEX |   |   |   |  
Program_Desc | text |   |   |   |   |   |  

# Program_Genre
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Program_ID | int |   | primary |   |   | Programsから |  
Genre_ID | int |   | primary |   |   | Genresから |  

# Genres
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Genre_ID | int |   | primary |   | YES |   |  
Genre_Name | varchar(20) |   |   |   |   |   | YES

# Seasons
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Season_ID | int |   | primary |   | YES |   |  
Season_Num | int | YES |   |   |   |   |  
Program_ID | int |   |   |   |   | Programsから |  

# Episodes
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Episode_ID | int |   | primary |   | YES |   |  
Season_ID | int |   |   |   |   | Seasonsから |  
Episode_Num | int | YES |   |   |   |   |  
Episode_Title | varchar(50) |   | INDEX |   |   |   |  
Episode_Desc | text |   |   |   |   |   |  
Duration | time |   |   |   |   |   |  
Release_Date | date |   | INDEX |   |   |   |  

# Episode_Views
カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT | 外部キー制約 | ユニークキー制約
-- | -- | -- | -- | -- | -- | -- | --
Views | int | YES |   | 0 |   |   |  
Channel_ID | int |   | primary |   |   | Channelsから |  
Episode_ID | int |   | primary |   |   | Episodesから |  
Timetable | datetime |   | primary |   |   | Channel_Timetableから |  
