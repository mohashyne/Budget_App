require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password')
    @group = Group.create(author: @user, name: 'My Expenses', icon: 'https://i.pravatar.cc/75?img=02%02')
  end

  describe 'validations' do
    it 'should include group name' do
      expect(@group.name).to eq('My Expenses')
    end

    it 'should not be valid if it doesn\'t include name' do
      @group.name = nil
      expect(@group).not_to be_valid
    end

    it 'should include icon url' do
      expect(@group.icon).to eq('https://i.pravatar.cc/75?img=02%02')
    end

    it 'icon should be an url' do
      expect(@group.icon).to include('http')
    end

    it 'should not be valid if it doesn\'t include icon' do
      @group.icon = nil
      expect(@group).not_to be_valid
    end
  end
end
