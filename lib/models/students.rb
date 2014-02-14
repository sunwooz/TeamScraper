class Student
  attr_accessor :name, :bio, :profile_link
  def initialize(name, bio, profile_link)
    self.name = name
    self.bio = bio
    self.profile_link = profile_link
  end

  def save
    DB.execute("INSERT INTO students('name', 'bio', 'profile_link') VALUES(:name, :bio, :profile_link)", 
      {:name => name, :bio => bio, :profile_link => profile_link})
  end
end