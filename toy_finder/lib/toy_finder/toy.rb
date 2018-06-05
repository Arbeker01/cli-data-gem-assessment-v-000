require "pry"
class ToyFinder::Toy
	attr_accessor :name, :price, :url

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
			toy.name = doc.search("h2.product-name").text
			toy.price = doc.search("span.price").text
		
			#toy.url = doc.search("hardcoded -https://funandfunction.com/dragon-egg-pendant.html")

			toy
		end

        def self.scrape_agitated
			doc = Nokogiri::HTML(open("https://funandfunction.com/therapist-picks/agitated.html"))

			toy = self.new
			toy.name = doc.search("h2.product-name").text
			toy.price = doc.search("span.price").text.strip
			#toy.url = doc.search("hardcoded - https://funandfunction.com/cocoon-climbing-swing.html")

			toy
		end

		def self.scrape_sleep_challenged
			doc = Nokogiri::HTML(open("https://funandfunction.com/therapist-picks/sleep-challenged.html"))

			toy = self.new
			toy.name = doc.search("h2.product-name").text.strip
			toy.price = doc.search("span.price").text.strip
			#toy.url = doc.search("hardcoded - https://funandfunction.com/bubble-blanket.html")

			toy
		end
end
