USE music_playlist_db;

-- 1. Total songs
SELECT COUNT(*) AS total_songs FROM spotify_tracks;

-- 2. Total genres
SELECT COUNT(DISTINCT track_genre) AS total_genres FROM spotify_tracks;

-- 3. Top 10 most popular songs
SELECT track_name, artists, track_genre, popularity
FROM spotify_tracks
ORDER BY popularity DESC
LIMIT 10;

-- 4. Top 10 genres by average popularity
SELECT track_genre, ROUND(AVG(popularity),2) AS avg_popularity, COUNT(*) AS total_songs
FROM spotify_tracks
GROUP BY track_genre
ORDER BY avg_popularity DESC
LIMIT 10;

-- 5. Most danceable songs
SELECT track_name, artists, danceability, track_genre
FROM spotify_tracks
ORDER BY danceability DESC
LIMIT 10;

-- 6. High-energy songs
SELECT track_name, artists, energy, popularity
FROM spotify_tracks
WHERE energy >= 0.90
ORDER BY popularity DESC
LIMIT 10;

-- 7. Explicit vs non-explicit songs
SELECT explicit, COUNT(*) AS total_songs, ROUND(AVG(popularity),2) AS avg_popularity
FROM spotify_tracks
GROUP BY explicit;

-- 8. Average song duration by genre in minutes
SELECT track_genre,
       ROUND(AVG(duration_ms)/60000,2) AS avg_duration_minutes
FROM spotify_tracks
GROUP BY track_genre
ORDER BY avg_duration_minutes DESC
LIMIT 10;

-- 9. Top artists by number of songs
SELECT artists, COUNT(*) AS total_songs, ROUND(AVG(popularity),2) AS avg_popularity
FROM spotify_tracks
GROUP BY artists
ORDER BY total_songs DESC
LIMIT 10;

-- 10. Songs with high positivity/valence
SELECT track_name, artists, valence, popularity
FROM spotify_tracks
ORDER BY valence DESC, popularity DESC
LIMIT 10;

-- 11. Genre-wise audio features
SELECT track_genre,
       ROUND(AVG(danceability),3) AS avg_danceability,
       ROUND(AVG(energy),3) AS avg_energy,
       ROUND(AVG(acousticness),3) AS avg_acousticness,
       ROUND(AVG(tempo),2) AS avg_tempo
FROM spotify_tracks
GROUP BY track_genre
ORDER BY avg_energy DESC;

-- 12. Find duplicate track IDs
SELECT track_id, COUNT(*) AS duplicate_count
FROM spotify_tracks
GROUP BY track_id
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- 13. Null or blank value check
SELECT
SUM(track_id IS NULL OR track_id='') AS missing_track_id,
SUM(artists IS NULL OR artists='') AS missing_artists,
SUM(track_name IS NULL OR track_name='') AS missing_track_name,
SUM(track_genre IS NULL OR track_genre='') AS missing_genre
FROM spotify_tracks;

-- 14. Create view for clean dashboard data
CREATE OR REPLACE VIEW vw_music_dashboard AS
SELECT track_id, artists, album_name, track_name, popularity,
       ROUND(duration_ms/60000,2) AS duration_minutes,
       explicit, danceability, energy, loudness, speechiness,
       acousticness, instrumentalness, liveness, valence, tempo, track_genre
FROM spotify_tracks;

SELECT * FROM vw_music_dashboard LIMIT 20;
