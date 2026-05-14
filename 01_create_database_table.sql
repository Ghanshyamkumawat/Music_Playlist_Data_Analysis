-- Music Playlist Analysis SQL Project
-- Database: MySQL

CREATE DATABASE IF NOT EXISTS music_playlist_db;
USE music_playlist_db;

DROP TABLE IF EXISTS spotify_tracks;

CREATE TABLE spotify_tracks (
    row_no INT,
    track_id VARCHAR(50),
    artists TEXT,
    album_name TEXT,
    track_name TEXT,
    popularity INT,
    duration_ms INT,
    explicit VARCHAR(10),
    danceability DECIMAL(6,4),
    energy DECIMAL(6,4),
    song_key INT,
    loudness DECIMAL(8,3),
    mode_value INT,
    speechiness DECIMAL(6,4),
    acousticness DECIMAL(6,4),
    instrumentalness DECIMAL(10,8),
    liveness DECIMAL(6,4),
    valence DECIMAL(6,4),
    tempo DECIMAL(8,3),
    time_signature INT,
    track_genre VARCHAR(100)
);
