class ToyFinder::CLI

	def call
    list_toys
		menu
    goodbye
	end

	def list_toys
		puts "Hello and welcome to ToyFinder!"
		@toys = ToyFinder::Toy.today
        @toys.each.with_index(1) do |toy, i|
            puts "#{i}. #{toy.name} - #{toy.price} - #{toy.url}"
        end
	end

	def menu
		input = nil
		  while input != "exit"
		      puts "Type the number, list or exit"
	 	   input = gets.strip.downcase


         if input.to_i > 0
            the_toy = @toys[input.to_i]
            puts "#{toy.name} - #{toy.price} - #{toy.url}"
        elsif input == "list"
         list_toys    
  		  else
    	     puts "Please choose from the given selection of toys."
        end
     end
    end

    def goodbye
    	puts "Please visit us again soon."
    end
end
