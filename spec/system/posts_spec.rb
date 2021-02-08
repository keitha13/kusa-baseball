require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:post2) { create(:post, user: user2) }
  before do
    visit new_user_session_path
  	fill_in 'user[email]', with: user.email
  	fill_in 'user[password]', with: user.password
  	click_button 'ログイン'
  end
  describe '新規投稿のテスト' do
    context '新規投稿画面への遷移' do
      it '遷移できる' do
      	visit new_post_path
      	expect(current_path).to eq('/posts/new')
      end
    end
    context '表示の確認' do
      before do
        visit new_post_path
      end
      it '新規投稿と表示される' do
        expect(page).to have_content('新規投稿')
      end
    end
  end
end