require 'rails_helper'
describe 'canary test' do
  it 'should work' do
    expect(true).to eq(true)
  end
end
describe List do
  let(:list) {List.new(title: "test")}

  it 'is valid with a title' do
    expect(list).to be_valid
  end

  it 'is invalid without a title' do
    list2 = List.new(title: nil)
    list2.valid?
    expect(list2.errors[:title]).to include("can't be blank")
  end
end
