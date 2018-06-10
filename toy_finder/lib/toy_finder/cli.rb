class ToyFinder::CLI

	def call
    list_toys
		menu
    goodbye
	end

	def list_toys
		puts <<~DOC
           Hello and welcome to ToyFinder!
           Below is a list of specialized toys for your child.
          DOC
		@toys = ToyFinder::Toy.today
        @toys.each.with_index(1) do |toy, i|
            #puts "#{i}. #{toy.name} - #{toy.price} - #{toy.url}"
						puts "#{i}. #{toy.name} - #{toy.price}"
        end
	end

	def menu
		input = nil
		  while input != "exit"
		      puts <<~DOC
					    Please choose the number of your desired toy for more information,
							Type List to show options again or Exit to quit
							DOC
	 	   input = gets.strip.downcase

         if input.to_i > 0
            the_toy = @toys[input.to_i]

            #puts "#{the_toy.name} - #{the_toy.price} - #{the_toy.url}"
						puts "#{the_toy.description}"

        elsif input == "list"
         list_toys
  		  else
    	     puts "Please choose from the given selection of toys."
        end
     end
    end

    def goodbye
    	puts "Thanks and please visit us again soon."
    end
end
