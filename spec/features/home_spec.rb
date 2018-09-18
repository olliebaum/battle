feature "Something" do
  it 'displays test message' do
    visit '/'
    expect(page).to have_content 'Testing infrastructure working!'
  end
end
