require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { FactoryBot.build(:user) }

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(user1).to be_valid
      end

      it 'emailに重複がなければ登録できる' do
        user1.save
        user2 = FactoryBot.build(:user, email: user1.email)
        expect(user2).not_to be_valid
      end
    end
  end
end
