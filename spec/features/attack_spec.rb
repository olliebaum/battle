feature 'Attack' do
  before do
    sign_in_and_play
    click_button('Attack')
  end
  scenario 'P1 attacks P2, and receives confirmation' do
    expect(page).to have_content 'John attacks Mary for 10 damage!'
  end
  scenario 'P1 attacks P2, and receives confirmation' do
    expect(page).to have_content '50 HP'
  end
end
