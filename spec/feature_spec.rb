require 'spec_helper'

feature 'Homepage' do
  scenario 'displays links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'

    expect(page.status_code).to eq 200
    within 'ul#links' do
    expect(page).to have_content "Makers Academy"
    end
  end
end

  feature 'Viewing filtered links' do
    before(:each) do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags:[Tag.first_or_create(name: 'Education')])
      Link.create(url: 'http://www.google.com', title: 'Google', tags:[Tag.first_or_create(name: 'search')])
      Link.create(url: 'http://www.BBC.co.uk', title: 'BBC', tags:[Tag.first_or_create(name: 'News')])
      Link.create(url: 'http://www.facebook.com', title: 'Facebook', tags:[Tag.first_or_create(name: 'Social')])
      Link.create(url: 'http://www.CNN.com', title: 'CNN', tags:[Tag.first_or_create(name: 'News')])
    end
    scenario 'I can filter links by tag' do
      visit '/tags/News'
      expect(page.status_code).to eq(200)
      within'ul#links' do
        expect(page).not_to have_content('Maker Academy')
        expect(page).not_to have_content('Google')
        expect(page).to have_content('BBC')
        expect(page).to have_content('CNN')
      end
    end
end
