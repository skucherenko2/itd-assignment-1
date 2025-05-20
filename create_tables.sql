
create table games (
    game_id int primary key,
    side_won boolean not null,
    player_a_id int,
    player_b_id int    
);

create table player_stat (
    player_id int primary key,
    games_played int not null,
    games_won int not null
);

create table unit_usage (
	unit_name varchar(10) primary key,
	games_used_in int not null,
	games_won_with int not null
)

create table building_usage (
	building_name varchar(10) primary key,
	games_used_in int not null,
	games_won_with int not null
)

create table resource_usage (
	resource_name varchar(10) primary key,
	used_count int not null,
	games_used_in int not null,
	games_won_with int not null
)