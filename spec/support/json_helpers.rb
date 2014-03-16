module JsonHelpers
  %i(get post put patch delete).each do |verb|
    api_versions = [1, 2]

    api_versions.each do |version|
      get_version = "#{verb}_v#{version}"

      define_method get_version do |path, parameters={}, headers={}|
        headers.merge!(HTTP_ACCEPT: "application/vnd.farticles.v#{version}")
        public_send(verb, path, parameters, headers)
      end
    end
  end

  def json
    @json ||= JSON.parse(response.body)
  end
end
