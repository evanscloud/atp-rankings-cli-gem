class AtpRankings::Scraper
  def get_page
    Nokogiri::HTML(open("http://www.atpworldtour.com/en/rankings/singles-race-to-london"))
    html = Nokogiri::HTML(open("http://www.atpworldtour.com/en/players/novak-djokovic/d643/overview"))
    binding.pry
  end

  def scrape_athletes_index
    self.get_page.search("#singlesRanking")
  end

  def create_athletes
    i = 1
    while i < 21 do
      scrape_athletes_index.each do |a|
        athlete = AtpRankings::Athlete.new
        athlete.rank = a.search("tr[#{i}] .rank-cell").text.strip
        athlete.name = a.search("tr[#{i}] .player-cell").text.strip
        athlete.age = a.search("tr[#{i}] .age-cell").text.strip
        athlete.points = a.search("tr[#{i}] .points-cell").text.strip
        athlete.tourn_played = a.search("tr[#{i}] .tourn-cell").text.strip
        athlete.url = "http://www.atpworldtour.com" + a.search("tr[#{i}] .player-cell a").attr("href").text
        i += 1
      end
    end
  end
end
