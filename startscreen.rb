puts '
.____           __  .__                         .__    .__                
|    |    _____/  |_|  |__   ____   ____   _____|  |__ |__|______   ____  
|    |   /  _ \   __\  |  \_/ __ \ /    \ /  ___/  |  \|  \_  __ \_/ __ \ 
|    |__(  <_> )  | |   Y  \  ___/|   |  \\___ \|   Y  \  ||  | \/\  ___/ 
|_______ \____/|__| |___|  /\___  >___|  /____  >___|  /__||__|    \___  >
        \/               \/     \/     \/     \/     \/                \/ 

		1. New Game
		2. Continue
		3. Launched game by accident. Have no interest in playing it.
'

puts "Select a Number: "
selection = gets.chomp

case selection
	when "1"
		`ruby level1.rb`
	when "2"
		puts "\n\nSelect a saved Game"
		Dir.chdir("saves")
		puts Dir.glob("*")
		puts "\n\n"
		selected = gets.chomp
end
