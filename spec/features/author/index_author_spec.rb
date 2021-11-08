require 'rails_helper'

describe 'Author index page', type: :feature do
  it "should exist at 'authors_path' and render without error" do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
    expect(page).to have_link 'Show', href: author_path(@alan)
  end

  it 'should contain a link to add new authors' do
   visit authors_path
   expect(page).to have_link 'New', href: new_author_path
  end
end
