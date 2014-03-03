module JsonHelpers
  %i(get post put patch delete).each do |verb|
    define_method "#{verb}_json" do |action, options={}|
      options[:format] ||= :json
      send(verb, action, options)
    end
  end

  def json
    @json ||= JSON.parse(response.body)
  end
end
