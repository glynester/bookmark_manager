feature "creating links with tags" do
  scenario " " do
    visit '/links/new'
    fill_in "title", :with => "Ruby Gems"
    fill_in "url", :with => "https://rubygems.org"
    fill_in "tags", :with => "ruby reference"
    click_button "Add Link"

    link = Link.first
    expect(link.tags.map(&:name)).to include('ruby reference')
  end
end
