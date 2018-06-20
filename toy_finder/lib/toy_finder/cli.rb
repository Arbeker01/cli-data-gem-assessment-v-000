class ToyFinder::CLI
	def call
		ToyFinder::Toy.scrape_toys
		list_toys
		menu
	end

	def list_toys
		puts <<~DOC
           Hello and welcome to ToyFinder!
           Below is a list of specialized toys for your child.
          DOC
		    @toys = ToyFinder::Toy.all
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
							    Type "List" to show options again or "Exit" to quit.
							  DOC
					puts ''
	 	   input = gets.strip.downcase

           if input.to_i > @toys.length
					 	puts "Please choose from the given selection of toys."

				   elsif input.to_i > 0
            the_toy = @toys[input.to_i-1]
						puts "#{the_toy.description}"
						sleep 5.0
					elsif input == "list"
         		list_toys
						#puts "#{toy.name} - #{toy.price}"
						sleep 5.0
  		   	 else
						 goodbye
					 #puts "This is not part of the toy selection."
         end
       end
      end

     def goodbye
    	puts "Thanks and please visit us again soon."
     end
  end
