require 'io/console'

namespace :hymnal do

  desc "create an admin user account"
  task :add_admin => :environment do
    email = get_input_from_user("E-mail Address")
    password = get_input_from_user("Password", echo: false)
    user = User.new(email: email, password: password)
    if user.save
      puts "Admin successfully created."
    else
      puts "Admin creation FAILED (#{user.errors.full_messages.to_sentence})!"
    end
  end

end

def get_input_from_user(prompt, echo: true, stream: STDIN)
  print "#{prompt}: "
  (echo ? stream.gets : stream.noecho(&:gets)).strip
end
