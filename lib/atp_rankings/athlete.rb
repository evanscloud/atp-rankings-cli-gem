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
    name = name.split.map(&:capitalize).join(' ')
    self.all.detect do |athlete|
      athlete.name.strip == name.strip ||
      athlete.name.split(" ").first.strip == name.strip
    end
  end

  def current_atp_rank
    array = []
    info = doc.search("div.stat-value").text.strip
    array = info.split("\n")
    array[0].tr!("\t", "")
    array[0].tr!("\r", "")
    @atp_rank = array[0]
  end

  def turned_pro
    array = []
    info = doc.search("div.table-big-value").text.strip
    array = info.split("\n")
    array[6].tr!("\t", "")
    array[6].tr!("\r", "")
    @turned_pro = array[6]
  end

  def orientation
    array = []
    info = doc.search("div.table-value").text.strip
    array = info.split("\n")
    array[2].tr!("\t", "")
    array[2].tr!("\r", "")
    @orientation = array[2]
  end

  def birthplace
    array = []
    info = doc.search("div.table-value").text.strip
    array = info.split("\n")
    array[0].tr!("\t", "")
    array[0].tr!("\r", "")
    @birthplace = array[0]
  end

  def coach
    array = []
    info = doc.search("div.table-value").text.strip
    array = info.split("\n")
    if array[3] != nil
      array[3].tr!("\t", "")
      array[3].tr!("\r", "")
      @coach = array[3]
    else
      @coach = "No Coach"
    end
  end

  def overall_record
    array = []
    info = doc.search("div.stat-value").text.strip
    array = info.split("\n")
    array[12].tr!("\t", "")
    array[12].tr!("\r", "")
    @overall_record = array[12]
  end

  def overall_prize_money_earned
    array = []
    info = doc.search("div.stat-value").text.strip
    array = info.split("\n")
    array[16].tr!("\t", "")
    array[16].tr!("\r", "")
    @overall_prize_money_earned = array[16]
  end

  def overall_titles
    array = []
    info = doc.search("div.stat-value").text.strip
    array = info.split("\n")
    array[14].tr!("\t", "")
    array[14].tr!("\r", "")
    @overall_titles = array[14]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
