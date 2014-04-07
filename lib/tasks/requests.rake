namespace :request do
  namespace :articles do
    %w(v1 v2).each do |v|
      desc "Request #{v} articles representation"
      task v do
        headers = "accept: application/vnd.farticles.#{v}"
        puts "Sending headers: #{headers}"
        puts `curl -H '#{headers}' http://localhost:3000/api/articles.json`
      end
    end
  end
end
