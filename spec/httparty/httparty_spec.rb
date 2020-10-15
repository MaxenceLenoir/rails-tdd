describe 'HTTPaty' do
  it 'HTTParty' do
    response = HTTParty.get('http://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    p content_type
    expect(content_type).to match(%r{application\/json})
  end
end
