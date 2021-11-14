require 'rails_helper'

describe 'Show author page', type: :feature do
  it "should exist at 'author_path' and render without error" do
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
  end
end
