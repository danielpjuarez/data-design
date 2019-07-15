-- The statement below sets the collation of the database to utf8
ALTER DATABASE djuarez11 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS subreddit;
DROP TABLE IF EXISTS subscriptions;

-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileId BINARY(16) NOT NULL,
	profileHandle VARCHAR (32) NOT NULL,
	profileUsername VARCHAR(128) NOT NULL,
	-- to make something optional, exclude the not null
	profileHash CHAR(97) NOT NULL,
		-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(profileHandle),
	UNIQUE (profileUsername),
	-- this officiates the primary key for the entity
	PRIMARY KEY(profileId)
);

-- create the tweet entity
CREATE table subreddit (
	-- this is for yet another primary key...
	subredditId BINARY(16) NOT NULL,
	subredditName VARCHAR(21) NOT NULL,
-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(subredditId)
);

-- create the like entity (a weak entity from a 1-n for profile--> subscriptions and a
-- weak entity from 1-n for subreddit--> subscriptions)
CREATE TABLE subscriptions (
	subscriptionProfileId BINARY (16) NOT NULL,
	subscriptionSubredditId BINARY (15) NOT NULL,
	-- index the foreign keys
	INDEX(subscriptionProfileId),
	INDEX(subscriptionSubredditId),
	-- create the foreign key relations
	FOREIGN KEY(subscriptionProfileId) REFERENCES profile(profileId),
	FOREIGN KEY(subscriptionSubredditId) REFERENCES subreddit(subredditId),
	-- finally, create a composite foreign key with the two foreign keys
	PRIMARY KEY(subscriptionProfileId, subscriptionSubredditId)
);