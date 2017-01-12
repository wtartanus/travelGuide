CREATE TABLE inspirations (
	id SERIAL4 primary key,
	city VARCHAR(255),
	country VARCHAR(255),
	description VARCHAR(255)
)

CREATE TABLE photos (
    id SERIAL4 primary key,
    city_id INT4 references inspirations (id) ON DELETE CASCADE,
    link VARCHAR(255)
)

CREATE TABLE temperatures (
    id SERIAL4 primary key,
    city_id INT4 references inspirations (id) ON DELETE CASCADE,
    Jan INT 4,
    Feb INT 4,
    Mar INT 4,
    Apr INT 4,
    May INT 4,
    June INT 4,
    July INT 4,
    Aug  INT 4,
    Sept INT 4,
    Oct INT 4,
    Nov INT 4,
    Dec INT 4
)

CREATE TABLE activities (

)


 things to do