  class Rolodex

  def initialize
    @contacts = []
    @id = 0
  end

  def contacts
    @contacts
  end

  def display_all
    @contacts.each {|x| puts "#{x.to_s} \n" }
  end

  def find(contact_id)
    @contacts.each do |contact|
      return contact if contact.id == contact_id
    end
    return nil
  end

  def find_by(contact_info)
    @contacts.select do |contact|
      if contact.first_name == contact_info
        true
      elsif contact.last_name == contact_info
        true
      elsif contact.email == email
        true
      else
        false
      end
    end
  end

  def find_all(contact_info)
    @contacts.each do |all|
      if contact_info == "1"
        puts "First Name = #{all.first_name.to_s}, ID = #{all.id.to_s}"
      elsif contact_info == "2"
        puts "Last Name = #{all.last_name.to_s}, ID = #{all.id.to_s}"
      elsif contact_info == "3"
        puts "Email = #{all.email.to_s}, ID = #{all.id.to_s}"
      end
    end
  end

  def modify(modify_id, new_first, new_last, new_email, new_note)
    modify = find(modify_id)
    modify.first_name = new_first
    modify.last_name = new_last
    modify.email = new_email
    modify.note = new_note
  end

  def delete(delete_id)
    @contacts.select do |delete|
      delete.id == delete_id
      @contacts.delete(delete.id)
    end
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
    puts "Contact ID number #{contact.id.to_s} was added."
  end

end