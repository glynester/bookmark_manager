feature 'Homepage' do
  scenario 'displays links' do
    visit '/'
    expect(page).to have_content "Makers Academy"
  end
end
