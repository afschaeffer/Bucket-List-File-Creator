#--------------------------------------------------------------------------
# 
# Script Name: BucketList.rb
# Author:      Amy Schaeffer
# Date:        5/8/2021
# 
# Description: Takes a user entry for bucket list item and creates a file
#				in a specified directory containing the list
#
#--------------------------------------------------------------------------

# Main Script Logic -------------------------------------------------------

$path = "" #initializing path variable
$entry = "" #initializing entry variable
$count = 1 #initializing count variable
$see_items = "" #initializing see items variable

puts "Welcome to the Bucket List creator!" #Welcoming user
puts "Please enter a path and folder name to store the file." #Instructing user to enter path
print "Enter path: " #Prompt user to enter folder path

$path = STDIN.gets #Taking user entry
$path.chop! #Remove any extra characters appended to the string

if File.exist?($path) then #Testing to see if folder exists
	puts $path + " folder found." #If it exists, let user know it was found
else 
	puts $path + " folder created." #If folder not found, create folder. 
	Dir.mkdir($path) #Creating folder
end

Dir.chdir($path) #Change directory to path entered


puts "Type your bucket list items and press enter after each one. Type 'q' to quit." #Instruct user to type items

outFile = #Opening file 
	File.new("BucketList.txt", "w") #Creating new bucket list file
	loop do #Loop until user enters break token
		print "Enter a bucket list item then press enter: " #Prompt user for bucket list item
		$entry = STDIN.gets #Assinging user entry to variable
		$entry.chop! #Remove any extra characters appended to the string
		break if $entry == "q" #Break if user enters break key
		outFile.puts $count.to_s + ". " + $entry #Write user entry to the file
		$count += 1 #Increment count of items
	end #loop end
outFile.close #Closing file

until $see_items == "y" || $see_items == "n" #loop asking question until user enters y or n
	print "Would you like to view your bucket list items? (y/n): " #Ask user if they want to see their list
	$see_items = STDIN.gets #Assigning user entry to variable
	$see_items.chop! #Remove any extra characters appended to the string
	
end #loop end

if $see_items == "y" #If user chooses to view items
	File.new("BucketList.txt", "r").each do |line| #loop through each line of the file
		puts line #printing line to the screen
	end #loop end
else #if see items is not y
	puts "Okay, you can see your list another time."
end #End if statement

puts "Thank you for creating your bucket list, now go start living! Press enter to quit." #Thanking user forn using program

STDIN.gets #Pause in program before user exits
	

