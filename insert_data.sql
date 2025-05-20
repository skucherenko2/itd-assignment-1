# Filling tables with data

INSERT INTO player_stat VALUES
(player_id, games_played, games_won),
(1, 10, 0),
(2, 5, 5),
(3, 10, 5),
(4, 5, 0),
(5, 15, 5),
(6, 15, 10);

INSERT INTO games VALUES
(game_id, side_won, player_a_id, player_b_id),
(1, true, 1, 2),
(2, true, 1, 3),
(3, false, 5, 2),
(4, true, 1, 4),
(5, false, 4, 3),
(6, true, 5, 3),
(7, false, 1, 2);

INSERT INTO unit_usage VALUES
(unit_name, games_used_in, games_won_with),
("tank", 10, 2),
("drone", 6, 3),
("artillery", 10, 5),
("infantry", 100, 1),
("horses", 100, 5);

INSERT INTO building_usage VALUES
(building_name, games_used_in, games_won_with),
("factory", 10, 2),
("refinery", 15, 5),
("storage", 100, 95),
("watchtower", 10, 0),
("FOB", 10, 0);

INSERT INTO resource_usage VALUES
(resource_name, used_count, games_used_in, games_won_with),
("steel", 1000, 10, 9),
("gas", 50, 2, 2),
("oil", 200, 100, 95),
("horses", 2000, 10, 9),
("manpower", 10000, 10, 3);



