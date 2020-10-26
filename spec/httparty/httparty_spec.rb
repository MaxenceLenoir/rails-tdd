describe 'HTTPaty' do
  it 'HTTParty', vcr: { cassette_name: 'jsonplaceholder/posts', record: :new_episodes } do
    # stub_request(:get, "http://jsonplaceholder.typicode.com/posts/2").
    #  to_return(status: 200, body: '', headers: {'content-type': 'application/json: Chaset etc..'})

    response = HTTParty.get('http://jsonplaceholder.typicode.com/posts/3')
    content_type = response.headers['content-type']
    p content_type
    expect(content_type).to match(%r{application\/json})
  end
end
