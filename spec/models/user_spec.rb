require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

 it 'is invalid without firstname' do
   user.firstname = nil
   expect(user).not_to be_valid
 end

 it 'is invalid without lastname' do
   user.lastname = nil
   expect(user).not_to be_valid
 end

 it 'is invalid without email' do
   user.email = nil
   expect(user).not_to be_valid
 end

 it 'is invalid without unique email' do
   user.save
   other_user = build(:user, email: user.email)

   expect(other_user.save).to eq(false)
 end

 it 'has many tasks' do
   expect(user.tasks.length).to eq(2)
 end

 it 'returns tasks due today' do
   task = user.tasks.first
   task.update(due_date: DateTime.now)
   expect(user.due_today.length).to eq(1)
 end
end
