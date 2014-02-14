class School

  def initialize()
    DB.execute("
      CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        bio TEXT, 
        profile_link TEXT
        )
    ")
  end

end