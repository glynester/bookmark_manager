require 'spec_helper'

feature 'Adding new links' do
  scenario 'adding links' do
    visit '/links/new'
    fill_in('title', with: "Facebook")
    fill_in('url', with: "www.facebook.com")
    click_button('Save')
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end
end


  feature 'Adding a single tag to a link' do
    scenario 'adding tags' do
      visit '/links/new'
      fill_in('title', with: "BBC")
      fill_in('url', with: "wwww.BBC.co.uk")
      fill_in('tags', with: "News")
      click_button('Save')
      link = Link.first
      expect(link.tags.map(&:name)).to include('News')
    end
  end

  feature 'Adding multiple tags to a link' do
    scenario 'adding tags' do
      visit '/links/new'
      fill_in('title', with: "Google")
      fill_in('url', with: "wwww.google.co.uk")
      fill_in('tags', with: "Search Maps")
      click_button('Save')
      link = Link.first
      expect(link.tags.map(&:name)).to include('Search', 'Maps')
    end
  end
