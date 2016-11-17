require 'rails_helper'

RSpec.describe Task, type: :model do

  it 'has a valid factory' do
    expect(build(:email)).to be_valid
  end

  it 'is invalid without a name' do
    task = build(:homework, name: nil)

    expect(task).not_to be_valid
  end

  it 'is invalid without a priority' do
    task = build(:email, priority: nil)
    task.valid?

    expect(task.errors[:priority]).to include("can't be blank")
  end

  it 'is invalid without a due date' do
    task = build(:email, due_date: nil)
    expect(task.save).to eq(false)
  end

  it 'belongs to User' do
    expect(Task.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
end
