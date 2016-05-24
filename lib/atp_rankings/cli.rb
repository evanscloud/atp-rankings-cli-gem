class AtpRankings::CLI
  def call
    AtpRankings::Scraper.new.create_athletes
    puts "Welcome to Emirates ATP World Tour Race to London Rankings!"
    puts "Below are the current top 25 players in contention for a top 8 spot."
    puts ""
    list_athletes
    start
  end

  def start
    puts ""
    puts "Please select a player based on ranking number:"
    input = gets.strip.to_i

    if input != 0 && input.between?(1, 25)
      athlete = AtpRankings::Athlete.find(input)
      print_athlete(athlete)
    else
      puts "Hey, something went wrong... Let's try again."
      start
    end

    puts ""
    puts "View another player? Enter Y/N:"
    input = gets.strip.downcase

    if input == "y"
      start
    else
      puts ""
      puts "Idemo!"
      puts ""
      exit
    end
  end

  def list_athletes
    format = '%-12s %-25s %-8s %-10s %-10s'
    puts format % ['RACE RANK', 'NAME', 'AGE', 'POINTS', 'TOURNAMENTS PLAYED']
    AtpRankings::Athlete.all.each_with_index do |athlete, i|
      puts format % [ athlete.rank, athlete.name, athlete.age, athlete.points, athlete.tourn_played ]
    end
  end

  def print_athlete(athlete)
    puts ""
    puts "--- #{athlete.name} ----------------------"
    puts ""
    puts "Current ATP Rank:             #{athlete.current_atp_rank}"
    puts "Turned Pro:                   #{athlete.turned_pro}"
    puts "Plays:                        #{athlete.orientation}"
    puts "Birthplace:                   #{athlete.birthplace}"
    puts "Coach(es):                    #{athlete.coach}"
    puts "Current ATP Record:           #{athlete.overall_record}"
    puts "Total # of Titles Won:        #{athlete.overall_titles}"
    puts "Total Prize Money Earned:     #{athlete.overall_prize_money_earned}"
    puts ""
  end
end
