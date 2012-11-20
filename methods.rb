def printSkills
	$skillsArray = []
	$skillsArray = "take\t Allows you to take something you've found", "use\t Allows you to use an item", "poke\t allows you to poke something", "skills\t shows this menu"
	puts "\n"
	$skillsArray.each { |x| puts x }
	sleep 1
	puts "\n"
end

def addToSkills(skill,description)
	$skillsArray << "#{skill}\t #{description}"
end

$itemsArray = []
def printItems
	puts "\n"
	$itemsArray.each { |x| puts x }
	sleep 1
	puts "\n"
end

def inputCheck(var)
	case var
		when "poke"
			puts "\nThe poke command works as follows --> poke <targetName>"
		when "use sword", "use"
			puts "\nthe use command works as follows --> use <item> on <targetName>"
		when "items"
			printItems()
		when "skills"
			printSkills()
	end
end

def putsIt(phrase)
	puts phrase
	gets
end

def initilizeLevel()
	$levelComplete = false
	File.open("saves/Wibbsy").each_line {|x|
		$currentGrid = 1	#Grid is the current location
		type, entry = x.split(":")
		case type
			when "items"
				$itemsArray << entry
			when "playerName"
				$playerName = entry
		end
	}	
end
