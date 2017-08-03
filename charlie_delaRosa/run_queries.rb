Task 1:
2.3.1 :009 > players = Player.all
  Player Load (4.8ms)  SELECT "players".* FROM "players"
2.3.1 :010 > players.each do |player|
2.3.1 :011 >     team = player.team
2.3.1 :012?>   puts "Player: #{player.name}, Team: #{team.name}, Mascot: #{team.mascot}, Stadium: #{team.stadium}"
2.3.1 :013?>   end

1 query to retrieve all players and a bunch to loop through the team info.

Task 2:
2.3.1 :014 > players = Player.includes(:team)
  Player Load (5.6ms)  SELECT "players".* FROM "players"
  Team Load (1.7ms)  SELECT "teams".* FROM "teams" WHERE "teams"."id" IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30)

2.3.1 :016 >     puts "Players: #{player.name}, Team: #{player.team.name}, Mascot: #{player.team.mascot}, Stadium: #{player.team.stadium}"
2.3.1 :017?>   end

Task 3:
2.3.1 :003 > Player.joins(:team).where("teams.name = 'Chicago Bulls'")
  Player Load (10.9ms)  SELECT "players".* FROM "players" INNER JOIN "teams" ON "teams"."id" = "players"."team_id" WHERE (teams.name = 'Chicago Bulls')
+----+-------------------+---------+-------------------+--------------------+
| id | name              | team_id | created_at        | updated_at         |
+----+-------------------+---------+-------------------+--------------------+
| 68 | Ryan Arcidiacono  | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 69 | Antonio Blakeney  | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 70 | Kris Dunn         | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 71 | Cristiano Felicio | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 72 | Jerian Grant      | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 73 | Justin Holiday    | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 74 | Zach LaVine       | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 75 | Robin Lopez       | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 76 | Lauri Markkanen   | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 77 | Nikola Mirotic    | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 78 | Anthony Morrow    | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 79 | David Nwaba       | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 80 | Cameron Payne     | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 81 | Bobby Portis      | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 82 | Denzel Valentine  | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 83 | Dwyane Wade       | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
| 84 | Paul Zipser       | 5       | 2017-08-03 05:... | 2017-08-03 05:3... |
+----+-------------------+---------+-------------------+--------------------+
17 rows in set
2.3.1 :004 >

Task 4:
2.3.1 :018 > Player.joins(:team).where("teams.stadium = 'Staples Center'")
  Player Load (3.0ms)  SELECT "players".* FROM "players" INNER JOIN "teams" ON "teams"."id" = "players"."team_id" WHERE (teams.stadium = 'Staples Center')
2.3.1 :019 >

2.3.1 :047 > Player.joins(:team).select('players.*', 'teams.name as franchise', 'teams.stadium as stadium').where("teams.stadium = 'Staples Center'")
  Player Load (2.5ms)  SELECT players.*, teams.name as franchise, teams.stadium as stadium FROM "players" INNER JOIN "teams" ON "teams"."id" = "players"."team_id" WHERE (teams.stadium = 'Staples Center')
2.3.1 :048 >

Task 5:
2.3.1 :091 > Player.joins(:team).where("players.name LIKE 'Z%'").select("players.*", "players.name", "teams.name")

2.3.1 :093 > Team.joins(:players).where("players.name LIKE 'Z%'").select("teams.name as team_name", "teams.*", "players.*")
  Team Load (2.4ms)  SELECT teams.name as team_name, teams.*, players.* FROM "teams" INNER JOIN "players" ON "players"."team_id" = "teams"."id" WHERE (players.name LIKE 'Z%')
