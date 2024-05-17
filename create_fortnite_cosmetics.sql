DROP DATABASE IF EXISTS fortnite_cosmetics;
CREATE DATABASE fortnite_cosmetics;
USE fortnite_cosmetics;


/* TABLES */

CREATE TABLE bundles(
	bundle_name		VARCHAR(255),
    bundle_id		VARCHAR(255)	NOT NULL		UNIQUE,
    bundle_cost		INT,
    rarity			ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Dark Series', 'Frozen Series', 'Lava Series', 'Shadow Series', 'Slurp Series', 'Icon Series', 'Star Wars Series', 'DC Series', 'Marvel Series', 'Gaming Legends Series', 'Lamborghini', 'McLaren')		NOT NULL, 
    item_amount		INT				NOT NULL
);

CREATE TABLE skins(
	skin_name		VARCHAR(255),
    skin_id			VARCHAR(255)	NOT NULL		UNIQUE,
    rarity			ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Dark Series', 'Frozen Series', 'Lava Series', 'Shadow Series', 'Slurp Series', 'Icon Series', 'Star Wars Series', 'DC Series', 'Marvel Series', 'Gaming Legends Series', 'Lamborghini', 'McLaren')		NOT NULL,
    cost			INT,
    skin_set_name	VARCHAR(255)					DEFAULT NULL,
    bundle_name		VARCHAR(255)					DEFAULT NULL
);

CREATE TABLE gliders(
	glider_name		VARCHAR(255),
    glider_id		VARCHAR(255)	NOT NULL		UNIQUE,
    rarity			ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Dark Series', 'Frozen Series', 'Lava Series', 'Shadow Series', 'Slurp Series', 'Icon Series', 'Star Wars Series', 'DC Series', 'Marvel Series', 'Gaming Legends Series', 'Lamborghini', 'McLaren')		NOT NULL,
    cost			INT,
    glider_set_name	VARCHAR(255)					DEFAULT NULL,
    bundle_name		VARCHAR(255)					DEFAULT NULL
);

CREATE TABLE emotes(
	emote_name		VARCHAR(255),
    emote_id		VARCHAR(255)	NOT NULL		UNIQUE,
    rarity			ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Dark Series', 'Frozen Series', 'Lava Series', 'Shadow Series', 'Slurp Series', 'Icon Series', 'Star Wars Series', 'DC Series', 'Marvel Series', 'Gaming Legends Series', 'Lamborghini', 'McLaren')		NOT NULL,
    cost			INT,
    bundle_name		VARCHAR(255)	DEFAULT NULL
);

CREATE TABLE pickaxes(
	pickaxe_name		VARCHAR(255),
    pickaxe_id			VARCHAR(255)	NOT NULL	    UNIQUE,
    rarity				ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Dark Series', 'Frozen Series', 'Lava Series', 'Shadow Series', 'Slurp Series', 'Icon Series', 'Star Wars Series', 'DC Series', 'Marvel Series', 'Gaming Legends Series', 'Lamborghini', 'McLaren')		NOT NULL,
    cost				INT,
    pickaxe_set_name	VARCHAR(255)	DEFAULT NULL,
    bundle_name			VARCHAR(255)	DEFAULT NULL
);

CREATE TABLE music(
	music_name 			VARCHAR(255),
	music_id 			VARCHAR(255)	NOT NULL 	UNIQUE,
	rarity 				ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Dark Series', 'Frozen Series', 'Lava Series', 'Shadow Series', 'Slurp Series', 'Icon Series', 'Star Wars Series', 'DC Series', 'Marvel Series', 'Gaming Legends Series', 'Lamborghini', 'McLaren') NOT NULL,
	set_name 			VARCHAR(255) 	DEFAULT NULL,
	song_length 		SMALLINT 		NOT NULL
);


CREATE TABLE players (
	player_name 	VARCHAR(255),
    player_id		VARCHAR(255)	NOT NULL
);

CREATE TABLE loadouts(
	loadout_id		INT,
	player_name		VARCHAR(255),
    skin_name		VARCHAR(255)	DEFAULT NULL,
	emote_name		VARCHAR(255)	DEFAULT NULL,
	pickaxe_name	VARCHAR(255)	DEFAULT NULL,
	glider_name		VARCHAR(255)	DEFAULT NULL,
    music_name		VARCHAR(255)	DEFAULT NULL
);
																			
                                                                            
                                                                            
/* TABLE CONTRAINTS -- PRIMARY/FOREIGN KEYS */
                                                                            
                                                                            -- Bundles constraints
                                                                            
ALTER TABLE bundles ADD CONSTRAINT bundles_pk
PRIMARY KEY (bundle_name), MODIFY bundle_name VARCHAR(255);

																			-- Skins constraints

ALTER TABLE skins ADD CONSTRAINT skin_pk
PRIMARY KEY (skin_name), MODIFY skin_name VARCHAR(255);

ALTER TABLE skins ADD CONSTRAINT skin_fk
FOREIGN KEY (bundle_name) REFERENCES bundles (bundle_name);

																			-- Gliders constraints	

ALTER TABLE gliders ADD CONSTRAINT glider_pk
PRIMARY KEY (glider_name), MODIFY glider_name VARCHAR(255);

ALTER TABLE gliders ADD CONSTRAINT glider_fk
FOREIGN KEY (bundle_name) REFERENCES bundles (bundle_name);

																			-- Emotes constraints

ALTER TABLE emotes ADD CONSTRAINT emote_pk
PRIMARY KEY (emote_name), MODIFY emote_name VARCHAR(255);

ALTER TABLE emotes ADD CONSTRAINT emote_fk
FOREIGN KEY (bundle_name) REFERENCES bundles (bundle_name);

																			-- Pickaxes constraints

ALTER TABLE pickaxes ADD CONSTRAINT pickaxe_pk
PRIMARY KEY (pickaxe_name), MODIFY pickaxe_name VARCHAR(255);

ALTER TABLE pickaxes ADD CONSTRAINT pickaxe_fk
FOREIGN KEY (bundle_name) REFERENCES bundles (bundle_name);

																			-- Music constraints

ALTER TABLE music ADD CONSTRAINT music_pk
PRIMARY KEY (music_name), MODIFY music_name VARCHAR(255);

																			-- Players constraints

ALTER TABLE players ADD CONSTRAINT player_pk
PRIMARY KEY (player_name), MODIFY player_name VARCHAR(255);

																			-- Loadout constraints

ALTER TABLE loadouts ADD CONSTRAINT loadout_pk
PRIMARY KEY (loadout_id), MODIFY loadout_id INT AUTO_INCREMENT;

ALTER TABLE loadouts ADD CONSTRAINT loadouts_fk_players
FOREIGN KEY (player_name) REFERENCES players (player_name);

ALTER TABLE loadouts ADD CONSTRAINT loadouts_fk_skins
FOREIGN KEY (skin_name) REFERENCES skins (skin_name);

ALTER TABLE loadouts ADD CONSTRAINT loadouts_fk_gliders
FOREIGN KEY (glider_name) REFERENCES gliders (glider_name);

ALTER TABLE loadouts ADD CONSTRAINT loadouts_fk_emotes
FOREIGN KEY (emote_name) REFERENCES emotes (emote_name);

ALTER TABLE loadouts ADD CONSTRAINT loadouts_fk_pickaxes
FOREIGN KEY (pickaxe_name) REFERENCES pickaxes (pickaxe_name);

ALTER TABLE loadouts ADD CONSTRAINT loadouts_fk_music
FOREIGN KEY (music_name) REFERENCES music (music_name);


/* DATA */

INSERT INTO bundles (bundle_name, bundle_id, bundle_cost, rarity, item_amount) VALUES
('Zuko Pack', 'TikiTorch_Bundle', 2000, 2, 3),
('The Weeknd Bundle', 'SpeedDial_Bundle', 3500, 11, 8),
('Falcon Clan Bundle', 'Architect_BandageNinja_Bundle', 2800, 4, 7),
('BTS Dynamite Pack', 'KeeperDreamBundle', 800, 11, 2),
('John Wick', 'AssassinSuit_Bundle', 2400, 5, 6),
('SypherPK Bundle', 'Headset_Bundle', 2800, 11, 6),
('FNCS Invitational 2022 Bundle', 'FNCS22_Bundle', 2300, 2, 6),
('Ariana Grande Bundle', 'Buffet_Bundle', 2800, 11, 5);

INSERT INTO skins (skin_name, skin_id, rarity, cost, skin_set_name, bundle_name) VALUES
('Zuko', 'Character_TikiTorch', 4, 2000, 'Avatar', 'Zuko Pack'),
('The Weeknd Combat', 'Character_SpeedDialBattle', 11, 1800, 'The Weeknd', 'The Weeknd Bundle'),
('Kenji', 'CID_361_Athena_Commando_M_BandageNinja', 4, 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Kuno', 'CID_362_Athena_Commando_F_BandageNinja', 4, 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('John Wick', 'CID_416_Athena_Commando_M_AssassinSuit', 5, 2000, 'John Wick', 'John Wick'),
('Harpy Haze', 'Character_FabulousWind', 3, NULL, 'ScreamingSun', NULL),
('Lavendra', 'Character_RetroPhotographer', 4, 1200, 'Flawless Flora', NULL);

INSERT INTO gliders (glider_name, glider_id, rarity, cost, glider_set_name, bundle_name) VALUES
('Falcon', 'Glider_ID_133_BandageNinja', 5, 1500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Appa', 'Glider_DoubleDuty', 4, NULL, 'Avatar', NULL),
('Shugoki', 'Glider_Headset', 11, 1200, 'SypherPK', 'SypherPK Bundle'),
('Champion Sail Shark', 'Glider_Shark_FNCS', 3, 800, 'FNCS', 'FNCS Invitational 2022 Bundle'),
('Sweetner Sailshards', 'Glider_ID_304_BuffetFemale_AOF61', 11, 1200, 'Ariana Grande', 'Ariana Grande Bundle');

INSERT INTO emotes (emote_name, emote_id, rarity, cost, bundle_name) VALUES
('Masked', 'EID_SpeedDial_Mask', 11, 1800, 'The Weeknd Bundle'),
('Popular Vibe', 'EID_SpeedDial', 11, 500, 'The Weeknd Bundle'),
('I''m Diamond', 'EID_KeeperDreamChorus', 11, 800, 'BTS Dynamite Pack'),
('I''ts Dynamite!', 'EID_KeeperDreamHook', 11, 800, 'BTS Dynamite Pack');

INSERT INTO pickaxes (pickaxe_name, pickaxe_id, rarity, cost, pickaxe_set_name, bundle_name) VALUES
('Zuko''s Broadswords', 'Pickaxe_TikiTorch', 3, 2000, 'Avatar', 'Zuko Pack'),
('Axe-O', 'Pickaxe_SpeedDial', 11, 500, 'The Weeknd', 'The Weeknd Bundle'),
('Quickstrike', 'Pickaxe_ID_172_BandageNinja', 2, 500, 'Falcon Clan', 'Falcon Clan Bundle'),
('Talons', 'Pickaxe_ID_219_BandageNinja1H', 3, 800, 'Falcon Clan', 'Falcon Clan Bundle'),
('Simple Sledge', 'Pickaxe_ID_213_AssassinSuitSledgehammer', 2, 500, 'John Wick', 'John Wick'),
('Wick''s Katana', 'Pickaxe_TracePaper', 2, 500, 'John Wick', 'John Wick');

INSERT INTO music (music_name, music_id, rarity, set_name, song_length) VALUES
('Coral Chorus', 'MusicPack_008_Coral', 3 , 'Fish Food', 149),
('Loot In The Mountains', 'MusicPack_117_WinterFest2021', 3, 'Winterfest ''21', 183),
('Somebody This Fly', 'MusicPack_122_Sleek_3ST6M', 11, 'Silk Sonic', 219),
('Streets Ignite', 'MusicPack_200_JamTrack', 3, 'TMNT', 173),
('Caped Crusader', 'MusicPack_030_BlackMonday_X91ZH', 13, 'Gotham City', 150),
('Silk & Cologne (EI8HT VERSION)', 'MusicPack_179_FearlessFlight', 14, 'Across the Spider-Verse', 148),
('Breathing Underwater', 'MusicPack_061_RLxFN', 15, 'Rocket League', 200),
('Flip Reset', 'MusicPack_073_RL2PromoTrack', 3, 'Rocket League', 184);

INSERT INTO players (player_name, player_id) VALUES
('ZukoGamer182', 'PID_2265_Z'),
('WeekndGamer182', 'PID_6766_E'),
('FalconClanGamer182', 'PID_5727_D'),
('BTSGamer182', 'PID_7884_R'),
('KeanuReeves', 'PID_8291_P'),
('ArianaGrande', 'PID_0882_U');

INSERT INTO loadouts (loadout_id, player_name, skin_name, emote_name, pickaxe_name, glider_name, music_name) VALUES
(1, 'ZukoGamer182', 'Zuko', NULL, 'Zuko''s Broadswords', NULL, NULL),
(2, 'ZukoGamer182', 'Kenji', 'Masked', 'Axe-O', NULL, 'Somebody This Fly'),
(3, 'ZukoGamer182', 'Kuno', 'Popular Vibe', 'Talons', 'Falcon', 'Coral Chorus'),
(4, 'WeekndGamer182', 'The Weeknd Combat', 'Masked', 'Axe-O', NULL, NULL),
(5, 'FalconClanGamer182', 'Kenji', NULL, 'Quickstrike', 'Falcon', 'Flip Reset'),
(6, 'BTSGamer182', NULL, 'I''m Diamond', NULL, NULL, 'Caped Crusader'),
(7, 'KeanuReeves', 'John Wick', NULL, 'Wick''s Katana', NULL, 'Streets Ignite'),
(8, 'ArianaGrande', 'John Wick', 'Popular Vibe', 'Wick''s Katana', 'Sweetner Sailshards', 'Somebody This Fly');
