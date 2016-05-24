class AtpRankings::Athlete
  attr_accessor :name, :rank, :age, :points, :tourn_played, :url, :current_atp_rank, :turned_pro, :overall_record, :overall_titles, :overall_prize_money_earned, :orientation, :birthplace, :coach

  @@all = []

  def initialize(rank=nil, name=nil, age=nil, points=nil, tourn_played=nil, url=nil)
    @rank = rank
    @name = name
    @age = age
    @points = points
    @tourn_played = tourn_played
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end


  def self.find_by_name(name)
    self.all.detect do |athlete|
      athlete.name.downcase.strip == name.downcase.strip ||
      athlete.name.split(" ").first.strip.downcase == name.downcase.strip
    end
  end

  def current_atp_rank
    @atp_rank = doc.search("div .data_number").text.strip
  end

  def turned_pro
    @turned_pro = doc
  end

  def orientation
    @orientation = doc
  end

  def birthplace
    @birthplace = doc
  end

  def coach
    @coach = doc
  end

  def overall_record
    @overall_record = doc
  end

  def overall_prize_money_earned
    @overall_prize_money_earned = doc
  end

  def overall_titles
    @overall_titles = doc
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
