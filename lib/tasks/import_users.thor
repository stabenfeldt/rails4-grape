class Users < Thor

  desc "import <filename>", "Import users from Excel"
  def import(filename)
    puts "Loading Rails environment..."
    require File.expand_path('config/environment.rb')
    require 'roo'

    if filename.match 'xlsx'
      s = Roo::Excelx.new(filename)
    else
      s = Roo::Excel.new(filename)
    end
    employees = []

    s.each {|hash| employees << hash}
    employees.shift # Remove header 
    employees.each do |e|
      employee_nr = e[0].to_s.strip
      first_name  = e[1].strip
      last_name   = e[2].strip
      position    = e[3].strip
      mobile      = e[4].gsub!(/\s/, '') rescue nil
      password    = 'lkjlkjlkj8kjsdfsdkfj8kjhskjdfkjsdf3n'

      u = User.new(employee_nr: employee_nr, first_name: first_name, 
                   last_name: last_name, position: position, mobile: mobile,
                   password: password, password_confirmation: password)
      if u.save
        puts "Importing #{first_name} #{last_name}"
      else
        puts "Could not save  #{first_name} #{last_name}"
        u.errors.each { |k,v| p "#{k} - #{v}" }
        puts "\n"
      end

    end



  end
end
