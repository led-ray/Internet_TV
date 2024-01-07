-- よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください

SELECT 
    Episodes.Episode_Title AS Title,
    Episode_Views.Views AS Views
FROM Episode_Views
JOIN Episodes ON Episode_Views.Episode_ID = Episodes.Episode_ID
ORDER BY Episode_Views.Views DESC
LIMIT 3;


-- よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください

SELECT
    Programs.Program_Title AS Program,
    Seasons.Season_Num AS Season,
    Episodes.Episode_Num AS "Episode Number",
    Episodes.Episode_Title AS Episode,
    SUM(Episode_Views.Views) AS Views
FROM Episode_Views
JOIN Episodes ON Episode_Views.Episode_ID = Episodes.Episode_ID
JOIN Seasons ON Episodes.Season_ID = Seasons.Season_ID
JOIN Programs ON Seasons.Program_ID = Programs.Program_ID
GROUP BY Programs.Program_ID, Seasons.Season_Num, Episodes.Episode_Num, Episodes.Episode_Title
ORDER BY SUM(Episode_Views.Views) DESC
LIMIT 3;


-- 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、
-- チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
-- なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします

SELECT
    Channels.Channel_Name AS Channel,
    Channel_Timetable.Timetable AS "Start",
    ADDTIME(Channel_Timetable.Timetable, Episodes.Duration) AS "End",
    Seasons.Season_Num AS Season,
    Episodes.Episode_Num AS "Episode Number",
    Episodes.Episode_Title AS Episode,
    Episodes.Episode_Desc AS "Description"
FROM Channel_Timetable
JOIN Channels ON Channel_Timetable.Channel_ID = Channels.Channel_ID
JOIN Programs ON Channel_Timetable.Program_ID = Programs.Program_ID
JOIN Episode_Views ON Channel_Timetable.Timetable = Episode_Views.Timetable
JOIN Episodes ON Episode_Views.Episode_ID = Episodes.Episode_ID
JOIN Seasons ON Episodes.Season_ID = Seasons.Season_ID
WHERE DATE(Channel_Timetable.Timetable) = DATE('2024-01-08'); --テスト用のクエリのため仮の日時を設定しています。実際にはNOW()を使ってください


-- ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
-- ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください

SELECT 
    Channels.Channel_Name AS Channel,
    Channel_Timetable.Timetable AS "Start",
    ADDTIME(Channel_Timetable.Timetable, Episodes.Duration) AS "End",
    Seasons.Season_Num AS Season,
    Episodes.Episode_Num AS "Episode Number",
    Episodes.Episode_Title AS Episode,
    Episodes.Episode_Desc AS "Description"
FROM Channel_Timetable
JOIN Channels ON Channel_Timetable.Channel_ID = Channels.Channel_ID
JOIN Programs ON Channel_Timetable.Program_ID = Programs.Program_ID
JOIN Episode_Views ON Channel_Timetable.Timetable = Episode_Views.Timetable
JOIN Episodes ON Episode_Views.Episode_ID = Episodes.Episode_ID
JOIN Seasons ON Episodes.Season_ID = Seasons.Season_ID
WHERE Channels.Channel_Name = 'Channel 1'--チャンネル名はサンプルデータに合わせて Channel 1 としています。適宜設定してください
AND DATE(Channel_Timetable.Timetable) BETWEEN DATE('2024-01-02')
AND DATE_ADD(DATE('2024-01-02'), INTERVAL 7 DAY); --テスト用のクエリのため仮の日時を設定しています。実際にはNOW()を使ってください
