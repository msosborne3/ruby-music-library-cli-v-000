class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new(name).tap{|genre| genre.save}
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def to_s
    self.name
  end

end