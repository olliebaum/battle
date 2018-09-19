feature 'HP' do
  scenario 'each player has full hp' do
    sign_in_and_play
    expect(page).to have_content '60 HP', '60 HP'
  end
end
