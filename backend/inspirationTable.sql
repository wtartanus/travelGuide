CREATE TABLE inspirations (
	id SERIAL4 primary key,
	city VARCHAR(255),
	country VARCHAR(255),
	description TEXT,
	history TEXT
);

CREATE TABLE photos (
    id SERIAL4 primary key,
    city_id INT4 references inspirations (id) ON DELETE CASCADE,
    link VARCHAR(255)
);

CREATE TABLE temperatures (
    id SERIAL4 primary key,
    city_id INT4 references inspirations (id) ON DELETE CASCADE,
    Jan INT4,
    Feb INT4,
    Mar INT4,
    Apr INT4,
    May INT4,
    June INT4,
    July INT4,
    Aug  INT4,
    Sept INT4,
    Oct INT4,
    Nov INT4,
    Dec INT4
);

CREATE TABLE activities1 (
	id SERIAL4 primary key,
	city_id INT4 references inspirations (id) ON DELETE CASCADE,
	name VARCHAR(255),
	description TEXT,
	address TEXT,
	photo_link TEXT
);
