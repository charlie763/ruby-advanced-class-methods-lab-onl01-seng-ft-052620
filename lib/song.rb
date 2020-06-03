class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
  	song = Song.new
  	self.all << song
  	song
  end

  def self.new_by_name(name)
  	song = Song.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = Song.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	self.all.each do |song| 
  		return song if song.name == name
  	end
  	nil
  end

  def self.find_or_create_by_name(name)
  	existing_name = self.find_by_name(name)
  	existing_name ? existing_name : self.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
  	#ex. "Taylor Swift - Blank Space.mp3"
  	song = Song.new
  	song_ary = filename.split(" - ")
  	song.artist_name = song_ary[0]
  	song.name = song_ary[1].delete_suffix(".mp3")
  	song
  end

  def self.create_from_filename(filename)
  	self.all << self.new_from_filename(filename)	
  end

  def self.destroy_all
  	self.all.clear
  end

  def save
    self.class.all << self
  end

end
