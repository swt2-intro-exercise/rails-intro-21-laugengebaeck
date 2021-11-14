require 'rails_helper'

describe 'Author edit page', type: :feature do
  it "should exist at 'edit_author_path' and render without error" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it 'should change displayed information on edit' do
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text('Alan')
    expect(page).to have_text('Turing')
    expect(page).to have_text('http://wikipedia.de/Alan_Turing')
    visit edit_author_path(@alan)
    page.fill_in 'author[first_name]', with: 'Edsger'
    page.fill_in 'author[last_name]', with: 'Dijkstra'
    page.fill_in 'author[homepage]', with: 'https://homepages.cwi.nl/~storm/teaching/reader/Dijkstra68.pdf'
    find('input[type="submit"]').click
    @alan.reload
    expect(page).to have_text('Edsger')
    expect(page).to have_text('Dijkstra')
    expect(page).to have_text('https://homepages.cwi.nl/~storm/teaching/reader/Dijkstra68.pdf')
  end
end
