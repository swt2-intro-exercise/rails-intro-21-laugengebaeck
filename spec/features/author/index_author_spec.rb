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
  
  it 'should have a link to delete an author' do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_link 'Delete', href: author_path(@alan)
  end

  it 'should delete an author on clicking the link' do
    @alan = FactoryBot.create :author
    old_count = Author.count
    visit authors_path
    find("a[data-method='delete'][href='#{author_path(@alan)}']").click
    new_count = Author.count
    expect(new_count).to be < old_count
  end
end
