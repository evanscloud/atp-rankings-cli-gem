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
    puts "Please select a player based on ranking number or full name:"
    input = gets.strip
    i = input.to_i

    if i != 0 && i.between?(1, 25)
      rank = AtpRankings::Athlete.find(i)
      print_athlete(rank)
    elsif i == 0
      athlete = AtpRankings::Athlete.find_by_name(input)
      if athlete != nil
        print_athlete(athlete)
      else
        puts ""
        puts "Sorry, I think you may have misspelled that... Let's try again."
        start
      end
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
