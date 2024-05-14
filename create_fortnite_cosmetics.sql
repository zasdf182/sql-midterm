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
	emote_name		VARCHAR(255)	PRIMARY KEY,
    emote_id		VARCHAR(255)	NOT NULL		UNIQUE,
    rarity			VARCHAR(15)		NOT NULL,
    cost			INT,
    bundle_name		VARCHAR(255)	DEFAULT NULL,
    skin_name		VARCHAR(255)	DEFAULT NULL,
    sync_status     BOOLEAN			NOT NULL		DEFAULT 0,
    CONSTRAINT emotes_fk_bundles
        FOREIGN KEY (bundle_name)
        REFERENCES bundles (bundle_name),
    CONSTRAINT emotes_fk_skins
        FOREIGN KEY (skin_name)
        REFERENCES skins (skin_name)
);

CREATE TABLE pickaxes(
	pickaxe_name		VARCHAR(255)	PRIMARY KEY,
    pickaxe_id			VARCHAR(255)	NOT NULL	    UNIQUE,
    rarity				VARCHAR(15)		NOT NULL,
    cost				INT,
    pickaxe_set_name	VARCHAR(255)	DEFAULT NULL,
    bundle_name			VARCHAR(255)	DEFAULT NULL,
    CONSTRAINT pickaxes_fk_bundles
        FOREIGN KEY (bundle_name)
        REFERENCES bundles (bundle_name)
);

CREATE TABLE music(
		music_name 	VARCHAR(255) 	PRIMARY KEY,
	music_id 		VARCHAR(255)	NOT NULL 	UNIQUE,
	rarity 			ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Dark Series', 'Frozen Series', 'Lava Series','Shadow Series','Slurp Series','Icon Series','Star Wars Series','DC Series','Marvel Series','Gaming Legends Series','Lamborghini','McLaren') DEFAULT NULL,
	set_name 		VARCHAR(255) 	DEFAULT NULL,
	song_length 	SMALLINT 		NOT NULL
);

CREATE TABLE loadouts(
	player_name		VARCHAR(255)	PRIMARY KEY,
    skin_name		VARCHAR(255)	DEFAULT NULL,
	emote_name		VARCHAR(255)	DEFAULT NULL,
	pickaxe_name	VARCHAR(255)	DEFAULT NULL,
	glider_name		VARCHAR(255)	DEFAULT NULL,
	music_name		VARCHAR(255)	DEFAULT NULL,
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
('John Wick', 'AssassinSuit_Bundle', 2400, 'LEGENDARY', 6),
('SypherPK Bundle', 'Headset_Bundle', 2800, 'ICON SERIES', 6),
('FNCS Invitational 2022 Bundle', 'FNCS22_Bundle', 2300, 'UNCOMMON', 6),
('Ariana Grande Bundle', 'Buffet_Bundle', 2800, 'ICON SERIES', 5);

INSERT INTO skins (skin_name, skin_id, rarity, cost, skin_set_name, bundle_name) VALUES
('Zuko', 'Character_TikiTorch', 'EPIC', 2000, 'Avatar', 'Zuko Pack'),
('The Weeknd Combat', 'Character_SpeedDialBattle', 'ICON SERIES', 1800, 'The Weeknd', 'The Weeknd Bundle'),
('Kenji', 'CID_361_Athena_Commando_M_BandageNinja', 'EPIC', 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Kuno', 'CID_362_Athena_Commando_F_BandageNinja', 'EPIC', 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('John Wick', 'CID_416_Athena_Commando_M_AssassinSuit', 'LEGENDARY', 2000, 'John Wick', 'John Wick'),
('Harpy Haze', 'Character_FabulousWind', 'RARE', NULL, 'ScreamingSun', NULL),
('Lavendra', 'Character_RetroPhotographer', 'EPIC', 1200, 'Flawless Flora', NULL);

INSERT INTO gliders (glider_name, glider_id, rarity, cost, glider_set_name, bundle_name) VALUES
('Falcon', 'Glider_ID_133_BandageNinja', 'LEGENDARY', 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Appa', 'Glider_DoubleDuty', 'EPIC', NULL, 'Avatar', NULL),
('Shugoki', 'Glider_Headset', 'ICON SERIES', 1200, 'SypherPK', 'SypherPK Bundle'),
('Champion Sail Shark', 'Glider_Shark_FNCS', 'RARE', 800, 'FNCS', 'FNCS Invitational 2022 Bundle'),
('Sweetner Sailshards', 'Glider_ID_304_BuffetFemale_AOF61', 'ICON SERIES', 1200, 'Ariana Grande', 'Ariana Grande Bundle');

INSERT INTO emotes (emote_name, emote_id, rarity, cost, bundle_name) VALUES
('Masked', 'EID_SpeedDial_Mask', 'ICON SERIES', 1800, 'The Weeknd Bundle'),
('Popular Vibe', 'EID_SpeedDial', 'ICON SERIES', 500, 'The Weeknd Bundle'),
('I''m Diamond', 'EID_KeeperDreamChorus', 'ICON SERIES', 800, 'BTS Dynamite Pack'),
('I''ts Dynamite!', 'EID_KeeperDreamHook', 'ICON SERIES', 800, 'BTS Dynamite Pack');

INSERT INTO pickaxes (pickaxe_name, pickaxe_id, rarity, cost, pickaxe_set_name, bundle_name) VALUES
('Zuko''s Broadswords', 'Pickaxe_TikiTorch', 'RARE', 2000, 'Avatar', 'Zuko Pack'),
('Axe-O', 'Pickaxe_SpeedDial', 'ICON SERIES', 500, 'The Weeknd', 'The Weeknd Bundle'),
('Quickstrike', 'Pickaxe_ID_172_BandageNinja', 'UNCOMMON', 500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Talons', 'Pickaxe_ID_219_BandageNinja1H', 'RARE', 800, 'Falcon Clan', 'Falcon Clan Bundle'),
('Simple Sledge', 'Pickaxe_ID_213_AssassinSuitSledgehammer', 'UNCOMMON', 500, 'John Wick', 'John Wick'),
('Wick''s Katana', 'Pickaxe_TracePaper', 'UNCOMMON', 500, 'John Wick', 'John Wick');

INSERT INTO music (music_name,music_id,rarity,set_name,song_length) VALUES
('Coral Chorus','MusicPack_008_Coral',3,'Fish Food',149),
('Loot In The Mountains','MusicPack_117_WinterFest2021',3,'Winterfest ''21',183),
('Somebody This Fly','MusicPack_122_Sleek_3ST6M',11,'Silk Sonic',219),
('Streets Igniite','MusicPack_200_JamTrack',3,'TMNT',173),
('Caped Crusader','MusicPack_030_BlackMonday_X91ZH',13, 'Gotham City',150),
('Silk & Cologne (EI8HT VERSION)','MusicPack_179_FearlessFlight',14,'Across the Spider-Verse',148),
('Breathing Underwater','MusicPack_061_RLxFN',15,'Rocket League',200),
('Flip Reset','MusicPack_073_RL2PromoTrack',3,'Rocket League',184)
