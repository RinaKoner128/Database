USE vk;

DROP TABLE IF EXISTS city;
CREATE TABLE city (
	id serial primary key,
	Name varchar(100) not null
);


DROP TABLE IF EXISTS performer;
CREATE TABLE performer (
	id serial primary key,
	Name varchar(100) not null
);

DROP TABLE IF EXISTS country;
CREATE TABLE country (
	id serial primary key,
	id_city BIGINT UNSIGNED NOT NULL,
	Name varchar(100) not null,
	FOREIGN KEY (id_city) REFERENCES city(id)
);

DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist (
	id serial primary key,
	Name varchar(100) not null,
    description text
);

DROP TABLE IF EXISTS song;
CREATE TABLE song (
	id serial primary key,
    id_performer BIGINT UNSIGNED NOT NULL,
	Name varchar(100) not null,
    song_time time,
    file BLOB not null,
    FOREIGN KEY (id_performer) REFERENCES performer(id)
);

DROP TABLE IF EXISTS playlist_song;
CREATE TABLE playlist_song (
	id_playlist BIGINT UNSIGNED NOT NULL,
    id_song BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_playlist, id_song),
	FOREIGN KEY (id_playlist) REFERENCES playlist(id),
    FOREIGN KEY (id_song) REFERENCES song(id)
);

DROP TABLE IF EXISTS playlist_likes;
CREATE TABLE playlist_likes (
	id_playlist BIGINT UNSIGNED NOT NULL,
    id_likes BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_playlist, id_likes),
	FOREIGN KEY (id_playlist) REFERENCES playlist(id),
    FOREIGN KEY (id_likes) REFERENCES likes(id)
);

DROP TABLE IF EXISTS playlist_users;
CREATE TABLE playlist_users (
	id_playlist BIGINT UNSIGNED NOT NULL,
    id_users BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_playlist, id_users),
	FOREIGN KEY (id_playlist) REFERENCES playlist(id),
    FOREIGN KEY (id_users) REFERENCES users(id)
);

ALTER TABLE users ADD COLUMN id_country BIGINT UNSIGNED NOT NULL;
ALTER TABLE users ADD COLUMN id_city BIGINT UNSIGNED NOT NULL;
ALTER TABLE users ADD FOREIGN KEY (id_country) REFERENCES country(id);
ALTER TABLE users ADD FOREIGN KEY (id_city) REFERENCES city(id);
