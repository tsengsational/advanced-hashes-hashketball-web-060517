require 'pry'
# Write your code here!

def game_hash
  hash = {
  home: {
    team_name: "Brooklyn Nets" ,
    colors: ['Black', 'White'],
    players: {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },

  away: {
    team_name: "Charlotte Hornets" ,
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
    }
  }
}
end

def team_location(team)
  game_hash.each { |location, team_data| return location if team_data[:team_name] == team}
end

def player_location(player)
  game_hash.each { |location, team_data| team_data[:players].each{ |player_name, player_stats|return location if player_name == player}}
end

def num_points_scored(playerName)
  game_hash[player_location(playerName)][:players][playerName][:points]
end

def shoe_size(player)
  game_hash[player_location(player)][:players][player][:shoe]
end

def team_colors(team)
  game_hash[team_location(team)][:colors]
end

def team_names
  game_hash.map { |location, team_data| team_data[:team_name] }
end

def player_numbers(team)
  game_hash[team_location(team)][:players].map { |player_name, player_stats| player_stats[:number]}
end

def player_stats(player)
  game_hash[player_location(player)][:players][player]
end

def big_shoe_rebounds
  big_shoe = 0
  big_shoe_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |playerName, player_stats|
      if player_stats[:shoe] > big_shoe
        big_shoe = player_stats[:shoe]
        big_shoe_rebounds = player_stats[:rebounds]
      end
    end
  end
  big_shoe_rebounds
end
