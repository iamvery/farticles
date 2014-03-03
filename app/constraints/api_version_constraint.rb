class ApiVersionConstraint
  def initialize(options)
    @version = options.fetch(:version)
  end

  def matches?(request)
    request.headers.fetch(:accept).include?("application/vnd.farticles.v#{version}")
  end

  private

  attr_reader :version
end
