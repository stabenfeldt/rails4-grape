class Customers < Thor

  desc "import <filename>", "Import customers from Excel"
  def import(filename)
    puts "Loading Rails environment..."
    require File.expand_path('config/environment.rb')
    require 'roo'

    if filename.match 'xlsx'
      s = Roo::Excelx.new(filename)
    else
      s = Roo::Excel.new(filename)
    end
    customers = []

    s.each {|hash| customers << hash}
    customers.shift # Remove header 
    customers.each do |e|
      customer_nr = e[0].to_s.strip
      name        = e[1].strip
      org_number  = e[2]
      address     = "#{e[3].strip rescue nil} #{e[4].strip rescue nil}"
      area        = e[5].strip.titleize rescue nil
      phone       = e[6].gsub!(/\s/, '') rescue nil

      c = Customer.new(customer_nr: customer_nr, name: name, org_number: org_number, 
                       address: address, area: area, phone: phone)
      if c.save
        puts "Importing #{name} #{address}"
      else
        puts "Could not save  #{name} #{address}"
        puts "c: #{c.inspect}"
        c.errors.each { |k,v| p "#{k} - #{v}" }
        raise "\n"
      end

    end



  end
end
