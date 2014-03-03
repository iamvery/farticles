require 'spec_helper'

describe ApiVersionConstraint do
  describe '#matches?' do
    it 'matches requests for api version' do
      version = 1
      accept = "application/vnd.farticles.v#{version}"
      request = double :request
      request.stub(headers: { accept: accept })
      constraint = described_class.new(version: version)

      expect(constraint.matches?(request)).to be_true
    end
  end
end
