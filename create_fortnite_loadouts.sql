USE fortnite_cosmetics;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM loadouts;
SET SQL_SAFE_UPDATES = 1;


/* Free Temporary Event Loadouts */
/* April 2069 Holiday Event */

INSERT INTO loadouts (player_name, skin_name, emote_name, pickaxe_name, glider_name) VALUES
('ZukoGamer182', 'Zuko', NULL, 'Zuko''s Broadswords', NULL),
('WeekndGamer182', 'The Weeknd Combat', 'Masked', 'Axe-O', NULL),
('FalconClanGamer182', 'Kenji', NULL, 'Quickstrike', 'Falcon'),
('BTSGamer182', NULL, 'I''m Diamond', NULL, NULL),
('KeanuReeves', 'John Wick', NULL, 'Wick''s Katana', NULL),
('ArianaGrande', 'John Wick', 'Popular Vibe', 'Wick''s Katana', 'Sweetner Sailshards');
