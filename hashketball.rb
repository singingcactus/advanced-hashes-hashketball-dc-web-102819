require "pry"

def game_hash
  game_stats = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: [{
        player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      }, {
        player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }]
      },

      away: {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise","Purple"],
        players: [{
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
          }, {
            player_name: "DeSagna Diop",
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          }, {
            player_name: "Ben Gordon",
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          }, {
            player_name: "Kemba Walker",
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 7,
            blocks: 5,
            slam_dunks: 12
          }]
        }
    }

game_stats
end

def num_points_scored(player_name)
  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
        team_hash[:players][player].each { | stat, result |
          if team_hash[:players][player][:player_name] == player_name
            return team_hash[:players][player][:points]
          end
        }
    }
  }
end


def shoe_size(player_name)
  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
        team_hash[:players][player].each { | stat, result |
          if team_hash[:players][player][:player_name] == player_name
            return team_hash[:players][player][:shoe]
          end
        }
      }
    }
end

def team_colors(team_name)
  game_hash.each { | home_away, team_hash |
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
    }
end

def team_names()
  result = []
  game_hash.each { | home_away, team_hash |
    result << team_hash[:team_name]
  }
  result
end

def player_numbers(team_name)
  result = []
  game_hash.each { | home_away, team_hash |
    if team_hash[:team_name] == team_name
      team_hash[:players].each_index { | player |
        result << team_hash[:players][player][:number]
      }
    end
    }
  result
end

def player_stats(player_name)
  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
        if team_hash[:players][player][:player_name] == player_name
          return team_hash[:players][player].slice(:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks)
        end
      }
    }
end

def big_shoe_rebounds
  all_shoe_sizes = []
  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
        all_shoe_sizes << team_hash[:players][player][:shoe]
        }
    }
  shoe_search = all_shoe_sizes.max

  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
          if team_hash[:players][player][:shoe] == shoe_search
            return team_hash[:players][player][:rebounds]
          end
      }
    }
end

def most_points_scored
  all_points = []
  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
        all_points << team_hash[:players][player][:points]
        }
    }
  point_search = all_points.max

  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
          if team_hash[:players][player][:points] == point_search
            return team_hash[:players][player][:player_name]
          end
      }
    }
end

def winning_team
  home_points_by_player = []
  away_points_by_player = []

  game_hash[:home][:players].each_index {| player |
    home_points_by_player << game_hash[:home][:players][player][:points]
  }

  game_hash[:away][:players].each_index {| player |
    away_points_by_player << game_hash[:away][:players][player][:points]
  }

  home_score = home_points_by_player.reduce { |sum , n| sum + n }
  away_score = away_points_by_player.reduce { |sum , n| sum + n }

  if home_score > away_score
    game_hash[:home][:team_name]
  elsif away_score > home_score
    game_hash[:away][:team_name]
  else
    "The game is tied"
  end
end

def player_with_longest_name
  all_player_names = []

  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
        all_player_names << team_hash[:players][player][:player_name]
        }
    }

    longest_name = all_player_names.max { |a, b| a.length <=> b.length }

    longest_name
end

def most_steals
  all_steals = []
  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
        all_steals << team_hash[:players][player][:steals]
        }
    }
  steal_search = all_steals.max

  game_hash.each { | home_away, team_hash |
    team_hash[:players].each_index { | player |
          if team_hash[:players][player][:steals] == steal_search
            return team_hash[:players][player][:player_name]
          end
      }
    }
end

def long_name_steals_a_ton?
  long_name_player = player_with_longest_name
  top_stealer = most_steals

  long_name_player == top_stealer
end
