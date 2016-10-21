feature 'Resetting Password' do

  before do
    sign_up
    Capybara.reset!
  end
  let(:user) { User.first }

  def recover_password
    visit '/users/recover'
    fill_in :email, with: "alice@example.com"
    click_button "Submit"
  end

  scenario 'When I forget my password I can see a link to reset' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content("Please enter your email address")
  end

  scenario 'When I enter my email I am told to check my inbox' do
    visit '/users/recover'
    fill_in :email, with: "alice@example.com"
    click_button "Submit"
    expect(page).to have_content "Thanks, Please check your inbox for the link."
  end

  scenario 'it doesn\'t allow you to use the token after an hour' do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end
end
