
# Get top 3 players with the best win to lose ratio

select player_id, games_played, games_won, if(games_played != 0, games_won / games_played, 0) as win_to_lose_ratio
from player_stat
order by win_to_lose_ratio desc
limit 3;

# Generate resource winning statistics CTE

with resources_stat as (
select resource_name, used_count, games_used_in, games_won_with, 
if(games_used_in != 0, games_won_with / games_used_in, 0) as win_to_lose_ratio
from resource_usage
order by win_to_lose_ratio desc
)
# Get amount of resources used per game when the game is usually won with this resource
select win_to_lose_ratio, games_used_in,
if(games_used_in != 0, used_count / games_used_in, 0) as average_used_per_game
from resources_stat
where win_to_lose_ratio > 0.5

# Calculating total asset usage

with asset_usage as (
select resource_name as asset_name, games_used_in, games_won_with, "resource" as asset_type from resource_usage
union
select *, "unit" as asset_type from unit_usage
union
select *, "building" as asset_type from building_usage
)
# Counting total games won by asset type
select asset_type, sum(games_won_with) as total_games_won_with
from asset_usage 
where asset_name != ""
group by asset_type
having total_games_won_with > 50 # we are only interested in powerfull assets

# Finding whether each player_id has won or lost in each game

select p.player_id, p.player_id = if(g.side_won = true, g.player_a_id, g.player_b_id) as has_won
from player_stat p
join games g on player_a_id = player_id 

# Generating all possible asset combinations in each game which winning player_id MIGHT have used to achieve victory.

with asset_usage as (
select resource_name as asset_name, games_used_in, games_won_with, "resource" as asset_type from resource_usage
union
select *, "unit" as asset_type from unit_usage
union
select *, "building" as asset_type from building_usage
)
select p.player_id, asset_name from (select * from asset_usage where asset_name != "") clean
join games g
join player_stat p
on p.player_id = if(g.side_won = true, g.player_a_id, g.player_b_id)
order by player_id

