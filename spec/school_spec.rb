require_relative '../config/environment.rb'

describe "School" do
  before(:each) do
    @school = School.new
  end

  it "should have a students table" do
    expect(DB.execute("SELECT * FROM students")).to be_kind_of(Array)
  end

end