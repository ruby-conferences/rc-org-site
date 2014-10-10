require 'date'
require 'active_support'
require 'dotenv'
Dotenv.load

desc "Deploy site"
task :deploy do
  system "middleman build --clean"
  system "rsync -av -e ssh --delete build/ #{ENV['DEPLOY_TARGET']}"
end

desc "Create CFP posts, date should be yyyy-mm-dd"
task :cfp, :name, :date do |t, args|
  event_name = args[:name]
  cfp_date = Date.parse args[:date]
  deadline = ActiveSupport::Inflector.ordinalize cfp_date.strftime("%B %d")

  [
    { when: 'Soon', date: cfp_date - 7 },
    { when: 'Tomorrow', date: cfp_date - 1 }
  ].each do |post|
    output = `middleman article '#{event_name} CFP Closes #{post[:when]}' --date #{post[:date]}`
    filename = output.split.last
    File.open(filename, 'a') do |f|
      f << <<HERE

The #{event_name} [call for proprosals][cfp] closes #{deadline}.

[cfp]: LINK
HERE
    end
  end
end
