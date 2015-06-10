require 'rails_helper'

describe Task do
  let(:task) {Task.new(body: "test")}

  it 'is valid with a body' do
    expect(task).to be_valid
  end

  it 'is invalid without a body' do
    task2 = Task.new(body: nil)
    task2.valid?
    expect(task2.errors[:body]).to include("can't be blank")
  end
end
