require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @photo = FactoryBot.create(:photo)
    @analyse_face_emotion = FactoryBot.create(:analyse_face_emotion)
    @analyse_face_detail = FactoryBot.create(:analyse_face_detail)
    @post = FactoryBot.build(:post, user_id: @user.id, photo_id: @photo.id, analyse_face_emotion_id: @analyse_face_emotion.id, analyse_face_detail_id: @analyse_face_detail.id)
  end

  describe '投稿機能' do
    context '投稿がうまくいくとき' do
      it 'user_id, photo_id, analyse_face_emotion_id, analyse_face_detail_idが存在すれば登録できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'user_idが存在しなければ登録できない' do
        @post.user_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Userを入力してください")
      end

      it 'photo_idが存在しなければ登録できない' do
        @post.photo_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Photoを入力してください")
      end

      it 'analyse_face_emotion_idが存在しなければ登録できない' do
        @post.analyse_face_emotion_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Analyse face emotionを入力してください")
      end

      it 'analyse_face_detail_idが存在しなければ登録できない' do
        @post.analyse_face_detail_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Analyse face detailを入力してください")
      end
    end
  end
end
