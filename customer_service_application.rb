require_relative "Contact"
require_relative "Rolodex"

class CRM

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def self.run(name)
    crm = CRM.new(name)
    crm.main_menu
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def main_menu
    print_main_menu
    user_selected = gets.chomp.to_i
    call_selection(user_selected)
  end

  def call_selection(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_contact if user_selected == 3
    display_contacts if user_selected == 4
    display_attribute if user_selected == 5
    exit if user_selected == 6
  end

  def add_new_contact
    print "Enter First Name: "
        first_name = gets.chomp
    print "Enter Last Name: "
        last_name = gets.chomp
    print "Enter Email Address: "
        email = gets.chomp
    print "Enter a Note: "
        note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add_contact(contact)
    self.main_menu
  end

  def modify_existing_contact
    puts "Input contact ID"
    id = gets.to_i
    puts = "You entered #{id} - is this correct? y or n"
    confirm = gets.chomp
        if confirm = "y"
            modify contact
        elsif confirm = "n"
            modify_existing_contact
        else "Please try again."
            modify_existing_contact
    end
  end

  def delete_contact
    puts "Enter Object Name"
    obj=gets
    obj = nil
    self.main_menu
  end

end

CRM.run("robots")