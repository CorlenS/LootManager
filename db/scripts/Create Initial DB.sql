CREATE DATABASE IF NOT EXISTS lootmanager;

USE lootmanager;

CREATE TABLE IF NOT EXISTS raids (
	id INT(10) NOT NULL AUTO_INCREMENT,
	event_name VARCHAR(150) COMMENT 'The full name of the event',
	short_name VARCHAR(50) COMMENT 'A short name identifying the event',
	expansion_name VARCHAR(10) COMMENT 'The abbreviation of the expansion',
	tier VARCHAR(5) COMMENT 'The tier of the event. This is a VARCHAR primarly because tiers could get screwy and not be a number',
	PRIMARY KEY(id),
	KEY(short_name)
);

CREATE TABLE IF NOT EXISTS items (
	id INT(10) NOT NULL AUTO_INCREMENT,
	item_name VARCHAR(150) COMMENT 'The name of the item',
	slot VARCHAR(20) COMMENT 'The slot this item goes in',
	raid_id INT(10) NOT NULL COMMENT 'The event this item comes from, references raid.id',
	is_special BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Flag signifying rare/special items',
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS roster (
	id INT(10) NOT NULL AUTO_INCREMENT,
	player_name VARCHAR(100) NOT NULL COMMENT 'The name of the player',
	class VARCHAR(30) NOT NULL COMMENT 'The class of the player',
	rank VARCHAR(20) NOT NULL COMMENT 'The rank of the player',
	active BOOLEAN NOT NULL COMMENT 'Is the player on the active roster or not',
	forum_username VARCHAR(100) COMMENT 'The username on the ROI Forums',
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS loot (
	loot_date DATE NOT NULL COMMENT 'The date the loot was awarded',
	roster_id INT(10) COMMENT 'The person who won the loot',
	raid_id INT(10) COMMENT 'The raid the loot came from',
	item_id INT(10) COMMENT 'The item won',
	rot BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Is this loot rot or not',
	alt BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Did this loot go to an alt'
);