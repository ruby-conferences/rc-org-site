require 'dotenv'
Dotenv.load

desc "Deploy site"
task :deploy do
  system "middleman build"
  system "rsync -av -e ssh --delete build/ #{ENV['DEPLOY_TARGET']}"
end
