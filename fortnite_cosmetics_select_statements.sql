use fortnite_cosmetics;

SELECT player_name, skin_name 							-- Examples of multiple presets for one player
	FROM loadouts 
    WHERE player_name = "ZukoGamer182"; 

SELECT player_name, count(*) AS loadout_presets			-- Same as above
	FROM loadouts 
	GROUP BY player_name 
    ORDER BY loadout_presets DESC; 

/* MANY TO MANY RELATIONSHIP(S) */

SELECT p.player_name, e.emote_name 						-- Examples of Many-to-Many Relationships
	FROM loadouts l 											-- Between 'player_name' (of players)
	INNER JOIN players p 										-- and 'emote_name' (of emotes)
		ON l.player_name = p.player_name						-- ZukoGamer182 has multiple emotes assigned to ihm
	INNER JOIN emotes e											-- Popular Vibe/Masked has multiple players it's assigned to.
		ON e.emote_name = l.emote_name
	ORDER BY player_name ASC;

SELECT p.player_name, e.emote_name 						-- Same as above
	FROM loadouts l 											
	INNER JOIN players p 										
		ON l.player_name = p.player_name						
	INNER JOIN emotes e											
		ON e.emote_name = l.emote_name
	ORDER BY emote_name ASC; 

SELECT e.emote_name, count(*) AS players_assigned		-- Same as above, however this one utilises grouping to show the relations.		
	FROM loadouts l 											
	INNER JOIN players p 										
		ON l.player_name = p.player_name						
	INNER JOIN emotes e											
		ON e.emote_name = l.emote_name
	GROUP BY emote_name;

SELECT p.player_name, count(*) AS emotes_used			
	FROM loadouts l 											
	INNER JOIN players p 										
		ON l.player_name = p.player_name						
	INNER JOIN emotes e											
		ON e.emote_name = l.emote_name
	GROUP BY player_name;

/* OVERALL SELECT TABLES */

SELECT * FROM bundles;
SELECT * FROM skins;
SELECT * FROM gliders;
SELECT * FROM emotes;
SELECT * FROM pickaxes;
SELECT * FROM music;
SELECT * FROM players;
SELECT * FROM loadouts;

-- bundles, skins, gliders, emotes, pickaxes, players, lodaouts
