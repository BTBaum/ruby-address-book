require "./contact"


class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

jerry = Contact.new
jerry.first_name = "Jerry"
jerry.last_name = "Garcia"
jerry.add_phone_number("Home", "234-234-2345")
jerry.add_phone_number("Cell", "934-934-9345")
jerry.add_address("Home", "400 Main St", "", "Chattanooga", "TN", "30740")

jon = Contact.new
jon.first_name = "Jon"
jon.last_name = "Fishman"
jon.add_phone_number("Home", "234-234-2345")
jon.add_phone_number("Cell", "934-934-9345")
jon.add_address("Home", "400 Main St", "", "Burlington", "VT", "12345")

address_book.contacts.push(jerry)
address_book.contacts.push(jon)
address_book.print_contact_list
