feature 'Names' do
  scenario 'players enter names and appear on home page' do
    sign_in_and_play
    expect(page).to have_content 'Player 1: John', 'Player 2: Mary'
  end
end
