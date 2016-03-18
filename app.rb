# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
require 'byebug'

case ARGV[0]
when "--list"
  Contact.everyone
when "--add"
  if ARGV.count != 4
    puts "Wrong number of arguments. Proper usage is --add \"<name>\" \"<phone no>\" \"<address>\"" 
  else
    Contact.new_contact(ARGV[1], ARGV[2], ARGV[3])
  end
when "--update"
  if ARGV.count != 5
    puts "Wrong number of arguments. Proper usage is --update <id> \"<name>\" \"<phone no>\" \"<address>\"" 
  elsif ARGV[1].to_i > Contact.all.count
    puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?"
  else
    id = Contact.all[(ARGV[1].to_i - 1)][:id]
    Contact.edit_contact(id, ARGV[2], ARGV[3], ARGV[4])
  end
when "--delete"
  if ARGV.count != 2
    puts "Wrong number of arguments. Proper usage is --delete <id>"
  elsif ARGV[1].to_i > Contact.all.count
    puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?"  
  else
  id = Contact.all[ARGV[1].to_i - 1][:id]
  Contact.delete_contact(id)
  end
else
  puts "Unrecognised command \"#{ARGV[0]}\". Possible commands are \"--list\", \"--add\", \"--update\", or \"--delete\"."
end