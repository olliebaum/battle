def sign_in_and_play
  visit '/'
  fill_in('name1', with: 'John')
  fill_in('name2', with: 'Mary')
  click_button('Submit')
end
