class Rolodex

  def initialize
    @contacts = []
    @id = 1000
  end

  def contacts
    @contacts
  end

  def display_all
    @contacts.each {|x| x.to_s}
  end

  def find(contact_id)
    @contacts.select do |contact|
      contact.id == contact_id
    end
  end

  def find_by(contact_info)
  end

  def modify(modify_id, new_first, new_last, new_email, new_note)
    @contacts.select do |modify|
      modify.id == modify_id
      modify.first_name = new_first
      modify.last_name = new_last
      modify.email = new_email
      modify.note = new_note
    end
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
  end

end