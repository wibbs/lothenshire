require 'methods'
initilizeLevel()

putsIt "Welcome to the land of Lothenshire #{$playerName}"
putsIt "Here you will see the tragic evil that rules this land"
putsIt "You must find the evil ruler and end him. We could easily have placed you in his castle, but instead we started you in a a creepy forest. It makes for a better adventure."
putsIt "Your journey begins...."
putsIt "\n\nnow!"

while $levelComplete == false
	if $currentGrid == 1
		continue = false;
		while continue == false
			puts "\n\nYou are in a field surrounded by tree's"
			puts "You wish to move forward but the path is blocked by a large branch"
			puts "What do you do?"
			input = gets.chomp.downcase
			case input
				when "use sword on branch"
					continue = true;
				when "poke branch"
					puts "Why would you poke a branch??"
				else
					inputCheck(input);
			end

			putsIt "\n\nNew skill aquired!"
			putsIt "You have learned the skill \"move up\""
			addToSkills("move up", "Moves you to the next grid")
			printSkills()
			input = gets.chomp.downcase
			case input
				when "move up"
					$currentGrid += 1
				else
					inputCheck(input);
			end
		end
	end
end

