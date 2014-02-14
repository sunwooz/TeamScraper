# require 'environment'

require 'Nokogiri'
require 'open-uri'
require 'pry'
class StudentScraper

  attr_accessor :profile_links, :doc, :taglines, :bio, 
    :index_link_selector, :index_bio_selector, :index_tagline_selector,
    :student_name_selector, :student_links_selector, :url

  def initialize(url = "http://students.flatironschool.com/")
    self.doc = Nokogiri::HTML(open(url))
    self.url = url
    self.index_link_selector = "ul li.home-blog-post h3 a"
    self.index_bio_selector = "ul li.home-blog-post div.excerpt p"
    self.index_tagline_selector = "ul li.home-blog-post div.blog-title p.home-blog-post-meta"
    self.student_name_selector = "div.header-wrapper div.link-subs span"
    self.student_links_selector = "div.social-icons a"
  end

  def scrape
    scrape_profile_links
    scrape_tagline
    scrape_index_bio
  end

  def scrape_profile_links
    profile_links = doc.css(index_link_selector).attribute('href').map do |student_link|
      "http://students.flatironschool.com/#{student_link}"
    end
  end

  def scrape_index_bio
    bio = doc.search(index_bio_selector).map do |string|
      string.text
    end
    bio
  end

  def scrape_tagline
    taglines = doc.search(index_tagline_selector).map do |string|
      string.text
    end
  end

  def scrape_profiles_info()
    profile_links.each do |profile_link|
      raw_html = Nokogiri::HTML(open("#{url}#{profile_link}"))
      name = grab_name(raw_html)
      social_links = grab_social_links(raw_html)
      blogs = grab_blogs(raw_html)
      student = Student.new(name, bio, blogs)
      student.save
      sleep(1)
    end
  end

  def grab_name
    name_grab = doc.search(student_name_selector).map do |links|
      string.text
    end
  end
  
  def grab_social_links
    social_link_grab = doc.search(social_links_accessor).map do |social_link|
      social_link.attribute('href')
      binding.pry
    end
  end

  # @student.save

end