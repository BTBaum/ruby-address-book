require "./contact"


class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end
  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-","").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone Number search results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})", results)
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
jerry.add_phone_number("Home", "234-234-0000")
jerry.add_phone_number("Cell", "934-934-9345")
jerry.add_address("Home", "400 West Main St", "", "Chattanooga", "TN", "30740")

jon = Contact.new
jon.first_name = "Jon"
jon.last_name = "Fishman"
jon.add_phone_number("Home", "555-234-2345")
jon.add_phone_number("Cell", "934-934-9345")
jon.add_address("Home", "400 Hollow Woods St", "", "Burlington", "VT", "12345")

address_book.contacts.push(jerry)
address_book.contacts.push(jon)

# address_book.find_by_name("i")
# address_book.find_by_phone_number("0")
address_book.find_by_address("VT")
