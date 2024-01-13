require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ページ遷移確認' do
    context 'ログインしている場合' do
      before do
        @user = FactoryBot.create(:user)
        login(@user)
        visit root_path
      end

      it '撮影ページに遷移できる' do
        click_link '撮影'
        expect(current_path).to eq capture_path
      end

      it '投稿一覧ページに遷移できる' do
        click_link '投稿一覧'
        expect(current_path).to eq posts_path
      end
      
      it 'ユーザー詳細ページに遷移できる' do
        click_link 'マイヒストリー'
        expect(current_path).to eq user_path(@user.id)
      end

      it 'ユーザー情報詳細ページに遷移できる' do
        find("#hamburger-menu").click
        click_button 'アカウント管理'
        expect(current_path).to eq profile_path
      end

      it 'ユーザー情報編集ページに遷移できる' do
        find("#hamburger-menu").click
        click_button 'アカウント管理'
        click_link '編集'
        expect(current_path).to eq edit_profile_path
      end
    end

    context 'ログインしていない場合' do
      it 'ゲストログインできる' do
        visit root_path
        click_button 'ゲスト'
        expect(current_path).to eq capture_path
        expect(page).to have_content "ゲストユーザーとしてログインしました"
      end

      it 'ユーザー登録ページに遷移できる' do
        visit root_path
        click_link '撮影'
        visit login_path
        click_link '登録ページへ'
        expect(current_path).to eq step1_signup_index_path
      end
    end
  end

  describe 'ユーザー登録機能' do
  end

  describe 'ログイン機能' do
    it 'ログインできる' do
      @user = FactoryBot.create(:user)
      visit login_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'password'
      click_button 'ログイン'
      expect(current_path).to eq root_path
    end
  end

  describe 'ログアウト機能' do
    it 'ログアウトできる' do
      @user = FactoryBot.create(:user)
      login(@user)
      find("#hamburger-menu").click
      click_button 'ログアウト'
      expect(current_path).to eq root_path
    end
  end

  describe 'ユーザー情報編集機能' do
    it 'ユーザー情報を編集できる' do
      @user = FactoryBot.create(:user)
      login(@user)
      visit edit_profile_path
      fill_in 'user_email', with: 'test-email@example.com'
      fill_in 'user_name', with: 'test'
      click_button '更新'
      expect(current_path).to eq profile_path
      expect(page).to have_content 'プロフィールを更新しました'
    end
  end
end