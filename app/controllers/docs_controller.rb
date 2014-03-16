class DocsController < ActionController::Base
  include HighVoltage::StaticPage
  layout 'docs'

  private

  def version
    request.path[/doc\/(v\d)+/, 1]
  end
  helper_method :version
end
