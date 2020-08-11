require 'rails_helper'

describe 'HTTParty' do
  xit 'Content type' do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/users/2')
    content_type = response.headers['content-type']

    expect(content_type).to match(/json/)
  end

  it 'Content type - stub' do
    stub_request(:get, "https://jsonplaceholder.typicode.com/users/2").
      to_return(status: 200, body: '', headers: {'content-type': 'application/json'})

      response = HTTParty.get('https://jsonplaceholder.typicode.com/users/2')
    content_type = response.headers['content-type']

    expect(content_type).to match(/json/)
  end
end
