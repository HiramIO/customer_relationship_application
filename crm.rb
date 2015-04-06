require_relative "Contact"
require_relative "Rolodex"
#also load 'contact'
#also require './contact'


class CRM

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def self.run(name)
    crm = new(name)
    crm.main_menu
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display a contact"
    puts "[5] Display all contacts"
    puts "[6] Display an attribute"
    puts "[7] Exit"
    puts "Enter a number: "
  end

  def main_menu
        print_main_menu
        user_selected = gets.chomp.to_i
        puts "\e[H\e[2J"
        call_selection(user_selected)

  end

  def call_selection(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_contact if user_selected == 3
    display_contact if user_selected == 4
    display_all if user_selected == 5
    display_attribute if user_selected == 6
    exit if user_selected == 7
  end

#Build disp contact before modify contact, it is simpler and contains building blocks for modify
  def display_contact
    print "Input contact ID"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts "#{contact}" + "\n \n"
    puts "Push Return to continue"
    button = gets.chomp
    puts "\e[H\e[2J"
    main_menu

  end

  def display_all
    @rolodex.display_all
    puts "Press Return to continue"
    button = gets.chomp
    main_menu
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
    puts "\e[H\e[2J"
    main_menu
  end

  def modify_existing_contact
    puts "Input contact ID"
    modify_id = gets.chomp.to_i
        print "Enter First Name: "
        new_first = gets.chomp
        print "Enter Last Name: "
        new_last = gets.chomp
        print "Enter Email Address: "
        new_email = gets.chomp
        print "Enter a Note: "
        new_note = gets.chomp
        @rolodex.modify(modify_id, new_first, new_last, new_email, new_note)
        puts "\e[H\e[2J"
        main_menu
  end

  def display_attribute
    puts "What do you wish to search for?"
    contact_info = gets.chomp
    @rolodex.find_by(contact_info)
  end

  def delete_contact
    puts "Enter contact ID"
    delete_id = gets.chomp.to_i
    @rolodex.delete(delete_id)
    puts "\e[H\e[2J"
    main_menu
  end

  def exit
    puts "Goodbye!"
  end
end

CRM.run("robots")