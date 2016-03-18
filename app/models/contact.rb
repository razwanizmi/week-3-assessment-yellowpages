require_relative '../../config/application'

class Contact < ActiveRecord::Base

  def self.new_contact(name, phone, address)
    self.create(name: name, phone: phone, address: address)
  end

  def self.everyone
    everyone_array = self.all.select(:id, :name, :phone, :address)
    puts "List".ljust(5) + "Name".ljust(20) + "Phone No".ljust(20) + "Address".ljust(30)
    everyone_array.each_with_index do |row, index|
      puts (index + 1).to_s.ljust(5) + row[:name].to_s.ljust(20) + row[:phone].to_s.ljust(20) + row[:address].to_s.ljust(30)
    end
  end

  def self.edit_contact(id, name, phone, address)
    # everyone_count = self.all.count
    # return puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?" unless self.exists?(id: id)
    contact = self.find_by(id: id)
    contact[:name] = name
    contact[:phone] = phone
    contact[:address] = address
    contact.save
  end

  def self.delete_contact(id)
    # everyone_array = self.all
    # everyone_count = self.all.count
    # return puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?" unless self.exists?(id: id)
    contact = self.find_by(id: id)
    contact.destroy
  end
end

#   def self.new_contact(name, phone, address)
#     self.create(name: name, phone: phone, address: address)
#   end

#   def self.everyone
#     everyone_array = self.all.select(:id, :name, :phone, :address)
#     puts "List".ljust(5) + "Name".ljust(20) + "Phone No".ljust(20) + "Address".ljust(30)
#     everyone_array.each do |row|
#       puts row[:id].to_s.ljust(5) + row[:name].to_s.ljust(20) + row[:phone].to_s.ljust(20) + row[:address].to_s.ljust(30)
#     end
#   end

#   def self.edit_contact(id, name, phone, address)
#     everyone_count = self.all.count
#     return puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?" if id.to_i > everyone_count
#     contact = self.find_by(id: id)
#     contact[:name] = name
#     contact[:phone] = phone
#     contact[:address] = address
#     contact.save
#   end

#   def self.delete_contact(id)
#     everyone_array = self.all
#     everyone_count = self.all.count
#     return puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?" if id.to_i > everyone_count
#     contact = self.find_by(id: id)
#     contact.destroy
#     everyone_array[(id.to_i)..-1].each_with_index do |value, index|
#       value[:id] -= 1
#     end
#   end
# end