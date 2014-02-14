class StudentScraper

  attr_accessor :profile_links, :doc

  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def scrape
    scrape_profile_links
    scrape_tagline
    scrape_index_bio
  end

  def scrape_profile_links
    profile_links = doc.search("ul li.home-blog-post h3 a").attribute('href').map do |student_link|
      "http://students.flatironschool.com/#{student_link}"
    end
  end

  def scrape_tagline
    taglines = doc.search("ul li.home-blog-post div.blog-title p.home-blog-post-meta").map do |string|
      string.text
    end
  end

 def scrape_index_bio
    bio = doc.search("ul li.home-blog-post div.excerpt p").map do |string|
      string.text
    end
    doc.search("ul li.home-blog-post div.except p").each do |string|
      bio << string.text
    end
    bio
  end

end