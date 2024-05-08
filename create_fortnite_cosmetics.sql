DROP DATABASE IF EXISTS fortnite_cosmetics;
CREATE DATABASE fortnite_cosmetics;
USE fortnite_cosmetics;


/* TABLES */

CREATE TABLE bundles(
	bundle_name		VARCHAR(255)	PRIMARY KEY,
    bundle_id		VARCHAR(255)	NOT NULL		UNIQUE,
    bundle_cost		INT,
    rarity			VARCHAR(15)		NOT NULL, -- I'll have to decide later if we need to change other varchar() amounts
    item_amount		INT				NOT NULL
);

CREATE TABLE skins(
	skin_name		VARCHAR(255)	PRIMARY KEY,
    skin_id			VARCHAR(255)	NOT NULL		UNIQUE,
    rarity			VARCHAR(15)		NOT NULL,
    cost			INT,
    skin_set_name	VARCHAR(255)					DEFAULT NULL,
    bundle_name		VARCHAR(255)					DEFAULT NULL,
    CONSTRAINT skins_fk_bundles
		FOREIGN KEY (bundle_name)
		REFERENCES bundles (bundle_name)
);

CREATE TABLE gliders(
	glider_name		VARCHAR(255)	PRIMARY KEY,
    glider_id		VARCHAR(255)	NOT NULL		UNIQUE,
    rarity			VARCHAR(15)		NOT NULL,
    cost			INT,
    glider_set_name	VARCHAR(255)					DEFAULT NULL,
    bundle_name		VARCHAR(255)					DEFAULT NULL,
    CONSTRAINT gliders_fk_bundles
		FOREIGN KEY (bundle_name)
		REFERENCES bundles (bundle_name)
);

CREATE TABLE emotes(
	emote_name				VARCHAR(255)		PRIMARY KEY,
    emote_id				VARCHAR(255)		NOT NULL				UNIQUE,
    rarity					VARCHAR(15)			NOT NULL,
    cost						INT,
    bundle_name			VARCHAR(255)		DEFAULT NULL,
    skin_name				VARCHAR(255)		DEFAULT NULL,
    sync_status     BOOLEAN					NOT NULL				DEFAULT 0,

    CONSTRAINT emotes_fk_bundles
    FOREIGN KEY (bundle_name)
    REFERENCES bundles (bundle_name),

    CONSTRAINT emotes_fk_skins
    FOREIGN KEY (skin_name)
    REFERENCES skins (skin_name)
);

CREATE TABLE pickaxes(
	pickaxe_name					VARCHAR(255)		PRIMARY KEY,
    pickaxe_id					VARCHAR(255)		NOT NULL				UNIQUE,
    rarity							VARCHAR(15)			NOT NULL,
    cost								INT,
    pickaxe_set_name		VARCHAR(255)		DEFAULT NULL,
    bundle_name					VARCHAR(255)		DEFAULT NULL,

    CONSTRAINT pickaxes_fk_bundles
    FOREIGN KEY (bundle_name)
    REFERENCES bundles (bundle_name)
);

CREATE TABLE loadouts(
	player_name					VARCHAR(255)		PRIMARY KEY,
    skin_name					VARCHAR(255)		PRIMARY KEY,
	  emote_name				VARCHAR(255)		PRIMARY KEY,
	  pickaxe_name			VARCHAR(255)		PRIMARY KEY,
		glider_name				VARCHAR(255)		PRIMARY KEY,
		music_name				VARCHAR(255)		PRIMARY KEY,

    CONSTRAINT loadouts_fk_skins
    FOREIGN KEY (skin_name)
    REFERENCES skins (skin_name),

    CONSTRAINT loadouts_fk_emotes
    FOREIGN KEY (emote_name)
    REFERENCES emotes (emote_name),

    CONSTRAINT loadouts_fk_pickaxes
    FOREIGN KEY (pickaxe_name)
    REFERENCES pickaxes (pickaxe_name),

    CONSTRAINT loadouts_fk_gliders
    FOREIGN KEY (glider_name)
    REFERENCES gliders (glider_name),

    CONSTRAINT loadouts_fk_music
    FOREIGN KEY (music_name)
    REFERENCES music (music_name)
);

/* DATA */

INSERT INTO bundles (bundle_name, bundle_id, bundle_cost, rarity, item_amount) VALUES
('Zuko Pack', 'TikiTorch_Bundle', 2000, 'UNCOMMON', 3),
('The Weeknd Bundle', 'SpeedDial_Bundle', 3500, 'ICON SERIES', 8),
('Falcon Clan Bundle', 'Architect_BandageNinja_Bundle', 2800, 'EPIC', 7),
('BTS Dynamite Pack', 'KeeperDreamBundle', 800, 'ICON SERIES', 2),
('John Wick', 'AssassinSuit_Bundle', 2400, 'LEGENDARY', 6);

INSERT INTO skins (skin_name, skin_id, rarity, cost, skin_set_name, bundle_name) VALUES
('Zuko', 'Character_TikiTorch', 'EPIC', 2000, 'Avatar', 'Zuko Pack'),
('The Weeknd Combat', 'Character_SpeedDialBattle', 'ICON SERIES', 1800, 'The Weeknd', 'The Weeknd Bundle'),
('Kenji', 'CID_361_Athena_Commando_M_BandageNinja', 'EPIC', 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Kuno', 'CID_362_Athena_Commando_F_BandageNinja', 'EPIC', 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('John Wick', 'CID_416_Athena_Commando_M_AssassinSuit', 'LEGENDARY', 2000, 'John Wick', 'John Wick'),
('Harpy Haze', 'Character_FabulousWind', 'RARE', NULL, 'ScreamingSun', NULL), -- Example of a cosmetic paid with real currency
('Lavendra', 'Character_RetroPhotographer', 'EPIC', 1200, 'Flawless Flora', NULL);

INSERT INTO gliders (glider_name, glider_id, rarity, cost, glider_set_name, bundle_name) VALUES
('Falcon', 'Glider_ID_133_BandageNinja', 'LEGENDARY', 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Appa', 'Glider_DoubleDuty', 'EPIC', NULL, 'Avatar', NULL),
('Shugoki', 'Glider_Headset', 'ICON SERIES', 1200, 'SypherPK', 'SypherPK Bundle'),
('Champion Sail Shark', 'Glider_Shark_FNCS', 'RARE', 800, 'FNCS', 'FNCS Invitational 2022 Bundle'),
('Sweetner Sailshards', 'Glider_ID_304_BuffetFemale_AOF61', 'ICON SERIES', 1200, 'Ariana Grande', 'Ariana Grande Bundle');

INSERT INTO emotes (emote_name, emote_id, rarity, cost, bundle_name, skin_name) VALUES
('Masked', 'EID_SpeedDial_Mask', 'ICON SERIES', 1800, 'The Weeknd Bundle'),
('Popular Vibe', 'EID_SpeedDial', 'ICON SERIES', 500, 'The Weeknd Bundle'),
('I''m Diamond', 'EID_KeeperDreamChorus', 'ICON SERIES', 800, 'BTS Dynamite Pack'),
('I''ts Dynamite!', 'EID_KeeperDreamHook', 'ICON SERIES', 800, 'BTS Dynamite Pack')