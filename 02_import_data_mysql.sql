-- Put Music_playlist(4).csv in C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/
-- Then run this command. Change path if needed.

USE music_playlist_db;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Music_playlist(4).csv'
INTO TABLE spotify_tracks
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(row_no, track_id, artists, album_name, track_name, popularity, duration_ms, explicit,
 danceability, energy, song_key, loudness, mode_value, speechiness, acousticness,
 instrumentalness, liveness, valence, tempo, time_signature, track_genre);

SELECT COUNT(*) AS total_rows FROM spotify_tracks;
