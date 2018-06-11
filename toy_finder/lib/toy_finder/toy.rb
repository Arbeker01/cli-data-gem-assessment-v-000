require "pry"
class ToyFinder::Toy
	attr_accessor :name, :price, :description

	def self.today
		self.scrape_toys
	end


	def self.scrape_toys
		toys = []
		toys << self.scrape_chewy
		toys << self.scrape_agitated
		toys << self.scrape_sleep_challenged

		toys
	end

	def self.scrape_chewy
		doc = Nokogiri::HTML(open("https://funandfunction.com/therapist-picks/chewer-or-biter.html"))

		toy = self.new
		toy.name = doc.search("h2.product-name").first.text
		toy.price = doc.search("span.price").first.text
		toy.description = doc.search("div.desc-text")[0].text.strip

		toy
	end

	def self.scrape_agitated
		doc = Nokogiri::HTML(open("https://funandfunction.com/therapist-picks/agitated.html"))

		toy = self.new
		toy.name = doc.search("h2.product-name").first.text
		toy.price = doc.search("span.price").first.text.strip
		toy.description = doc.search("div.desc-text")[0].text.strip

		toy
	end

	def self.scrape_sleep_challenged
		doc = Nokogiri::HTML(open("https://funandfunction.com/therapist-picks/sleep-challenged.html"))

		toy = self.new
		toy.name = doc.search("h2.product-name")[0].text.strip
		toy.price = doc.search("span.price")[0].text.strip
		toy.description = doc.search("div.desc-text")[0].text.strip

		toy
	end

end
