require 'sqlite3'
require 'spec_helper.rb'

describe "Student" do

  let(:student) { Student.new('William', 'My bio', 'www.students.flatironschool.com/students/william') }


  context "profile" do

    it "should be able to create new students" do
      expect(student).to be_kind_of(Student)
    end

    it "has a name" do
      expect(student.name).to eq('William')
    end

    it "has a bio" do
      expect(student.bio).to eq('My bio')
    end

    it "has a profile link" do
      expect(student.profile_link).to eq('www.students.flatironschool.com/students/william')
    end
  end

  context "active record" do

    it "should be able to save" do
      student.save
      results = DB.execute("SELECT count(*) FROM students WHERE name = 'William'")

      expect(results[0][0]).to eq(1)
    end

  end


end
