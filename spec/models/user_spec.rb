require 'rails_helper'

RSpec.describe User, type: :model do
  context 'name is present' do 
    it 'should returns true' do
      user = User.new(name: 'John').save
      expect(user).to eq(true)
    end
  end

  context 'no name is provided' do
    it 'should returns false' do
      user = User.new(name: '').save
      expect(user).to eq(false)
    end
  end

  context 'name is too short' do
    it 'should returns false' do
      user = User.new(name: 't').save
      expect(user).to eq(false)
    end
  end

end
