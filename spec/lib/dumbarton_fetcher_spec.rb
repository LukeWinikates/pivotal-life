require 'spec_helper'
require 'webmock'
include WebMock::API

describe DumbartonFetcher do
  let(:token) { "random-letters" }
  let(:url) {"http://services.my511.org/Transit2.0/GetNextDeparturesByStopCode.aspx?token=#{token}&stopCode=58409"}
  let(:dumbarton_fetcher) { DumbartonFetcher.new(token) }

  before(:each) do
    stub_request(:get, url).to_return(:body => File.read('spec/fixtures/dumbarton_palo_alto.xml'))
  end

  it 'collects the dumbarton data for Palo Alto' do
    expected = [
      4,
      14
    ]
    expect(dumbarton_fetcher.data).to eq(expected)
  end
end
