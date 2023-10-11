require 'rest-client'
require 'json'

Player.delete_all
Team.delete_all
Division.delete_all
Conference.delete_all

response = RestClient.get('https://www.balldontlie.io/api/v1/teams')

teams_data = JSON.parse(response.body)

teams_data['data'].each do |team|
  conference = Conference.find_or_create_by(name: team['conference'])

  division = conference.divisions.find_or_create_by(name: team['division'])

  next unless conference.valid? && division.valid?

  division.teams.create(
    name: team['name'],
    abbreviation: team['abbreviation'],
    city: team['city']
  )
end

50.times do |index|
  value = index + 1
  response = RestClient.get("https://www.balldontlie.io/api/v1/players?page=#{value}")
  players_data = JSON.parse(response.body)

  players_data['data'].each do |player|
    Player.create(
      first_name: player['first_name'],
      last_name: player['last_name'],
      position: player['position'],
      height_feet: player['height_feet'],
      height_inches: player['height_inches'],
      weight_lbs: player['weight_pounds'],
      team: Team.find_by(name: player['team']['name'])
    )
  end

  # Uncomment the line below and change the number in line 27 to something higher,
  # if you would like to increase the players you see in the website.
  # sleep(1)
end

puts 'Database has been successfully seeded.'
