require 'methods'
class Player
	def initialize (name, purpose)
		@playerName = name
		@playerPurpose = purpose 
	end
	
	def getPlayerName
		return @playerName
	end
end

class Weapon
	def initialize (name, damage)
		@weaponName = name
		@weaponDamage = damage
	end

	def getWeaponName
		return @weaponName
	end

	def getWeaponDamage
		return @weaponDamage
	end
end

class Enemy
	def initialize (type, health)
		@enemyType = type
		@enemyHealth = health
	end

	def getenemyType
		return @enemyType
	end
end


puts "\nWelcome to the Game! Lets get started. What is your name?"
playersName = gets.chop
puts "\nAnd your purpose is to...?"
playersPurpose = gets.chop

thePlayer = Player.new(playersName, playersPurpose)

puts "\n\nExcellent! Your name is #{playersName} and your purpose is to #{playersPurpose}"
sleep 2
puts "NOTE: Your purpose is irrelevant to this game and our Artificial Intellegence bots are laughing at you"
sleep 4
puts "\nYou Sir #{playersName} have been chosen to save the land of Lothenshire! But to do so, you should probably first pick a weapon\n\n"
sleep 2

weaponSelected = false
triedShotgun = false
pickedWrong = 0
while weaponSelected == false
	puts "Sword of Destiny"
	puts "Bow of Truth"
	puts "Axe of Justice"
	puts "Shotgun of Judgement Day"
	puts "\ntype \"take <weapon>\" to select your weapon"
	selection = gets.chop.downcase

	case selection
	when "take sword of destiny"
		weaponSelected = true
	when "take bow of truth", "take axe of justice"
		puts "No.. Not that one\n\n"
		pickedWrong += 1
		sleep 2
	when "take shotgun of judgement day"
		puts "Yeah right. Like were going to give you a shotgun\n\n"
		sleep 3
		triedShotgun = true
	else
		puts "that is not an option\n"
		sleep 1
	end
end

playersWeapon = Weapon.new("sword", "15")
if triedShotgun == true
	puts "\nGreat! You've selected the Sword of Destiny. This was clearly an unguided decision made by you and you alone. The AI bots are pleased with you"
	sleep 3
	puts "\nHowever... Sword of Destiny is a really long name. So from now on lets just call it a Sword"
else
	puts "\n\nReally? We give you the option of a shotgun and you take a stupid sword?.. Your call"
end

$itemsArray << "sword"

sleep 3
puts "\n\nNow lets get started.  To test your abilities Sir #{playersName} we will be putting you up against Leo. Our pet Goblin"
puts "This is a text based game and therfore you must picture the goblin in your head as you fight him."
puts "Your imagination is important to the AI bots but we suggest you picture Leo like this... <press enter>"
garbage = gets

File.open('art/goblin.txt').each_line { |line| puts line }

sleep 4
puts "Since, you are brand new to the land of Lothenshire, Your skills are very little. type \"skills\" to view your available skills"

continue = false
while continue == false
	input = gets.chomp.downcase
	if input == "skills"
		printSkills()
		continue = true
	else 
		puts "Type \"Skills\" to view your skills\n\n"
	end
end
sleep 3
puts "\nGreat! You can use the skills command at any time during the game"
puts "\nYou can also use the \"items\" command to view your current items. Try it."

continue = false
while continue == false
	input = gets.chomp.downcase
	if input == "items"
		printItems
		continue = true
	else
		puts "Type \"items\" to view your items\n"
	end
end

sleep 3
puts "\nGreat! Now you may go about your training on Leo. Be careful. He's friendly but he won't go easy on you."
puts "\n#{playersName} vs. Leo the Goblin <Press Enter>"
garbage = gets
puts "\nFIGHT!"
puts "\n\nLeo moves right"
sleep 2
puts "Leo Moves left"
sleep 1
puts "Leo approaches you... Do something!"

continue = false
while continue == false
	userInput = gets.chomp.downcase
	case userInput
	when "poke leo"
		puts "\nLeo is confused by your poking. He pokes you back harder"
	when "use sword on leo"
		continue = true
	else
		inputCheck(userInput);
	end
end

puts "\You killed Leo. We told you earlier that he was friendly! Now we have to get a new pet Goblin"
sleep 4
puts "If you would have poked LEO 3,492 times he would have walked away. Why did you kill him?"
sleep 4
puts "\nThe AI bots must have a discussion of weather you may or may not continue..."
sleep 5
puts "\nAlright. Despite your slaying of our 1 of a kind friendly pet goblin, we have decided to let you continue"
puts "\nWe are putting you to sleep. When you awaken you will be in the land of Lothenshire. You are their last hope...."
puts "\nSaving game..."

File.open("saves/#{playersName}", 'w+') {|f| f.write("playerName:#{playersName}\n")}
File.open("saves/#{playersName}", 'a+') {|f| f.write("level:level2.rb\n")}
$itemsArray.each {|item| 
	File.open("saves/#{playersName}", 'a+') {|f| f.write("items:#{item}\n")}
}
$skillsArray.each {|skill|
	File.open("saves/#{playersName}", 'a+') {|f| f.write("skills:#{skill}\n")}
}
