require 'rails_helper'

RSpec.describe Paper, type: :model do
  it 'should not validate without title' do
    paper = Paper.new(title: nil, venue: "mind 49: 433-460", year: 1950)
    expect(paper).to_not be_valid
  end

  it 'should not validate without venue' do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: nil, year: 1950)
    expect(paper).to_not be_valid
  end

  it 'should not validate without year' do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "mind 49: 433-460", year: nil)
    expect(paper).to_not be_valid
  end

  it 'should not validate with non-numerical year' do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "mind 49: 433-460", year: "1950A")
    expect(paper).to_not be_valid
  end

  it 'should have an empty list of authors when created' do
    paper = Paper.new
    expect(paper.authors).to be_empty
  end
end
