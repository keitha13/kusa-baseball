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
      it 'コメントフォームが表示される' do
		  	expect(page).to have_field 'post[body]'
		  end
		  it 'youtubeフォームが表示される' do
		  	expect(page).to have_field 'post[youtube_url]'
		  end
      it '投稿するボタンが表示される' do
        expect(page).to have_button '投稿する'
      end
      it '投稿に成功する' do
		  	fill_in 'post[body]', with: Faker::Lorem.characters(number:20)
		  	click_button '投稿する'
		  	expect(page).to have_content '投稿に成功しました'
		  end
		  it '投稿に失敗する' do
		  	click_button '投稿する'
		  	expect(page).to have_content '1文字以上で入力してください'
		  	expect(current_path).to eq('/posts')
		  end
    end
  end
  
  describe '編集のテスト' do
    context '自分の投稿の編集画面への遷移' do
      it '遷移できる' do
        visit edit_post_path(post)
        expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
      end
    end
    context '他人の投稿の編集画面への遷移' do
      it '遷移できない' do
        visit edit_post_path(post2)
        expect(current_path).to eq('/posts')
      end
    end
    context '表示の確認' do
      before do
        visit edit_post_path(post)
      end
      it '投稿の編集と表示される' do
        expect(page).to have_content('投稿の編集')
      end
      it 'コメント編集フォームが表示される' do
		  	expect(page).to have_field 'post[body]', with: post.body
		  end
		  it 'youtube編集フォームが表示される' do
		  	expect(page).to have_field 'post[youtube_url]', with: post.youtube_url
		  end
    end
    context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_post_path(post)
				click_button '更新して投稿する'
				expect(current_path).to eq '/posts'
			end
			it '編集に失敗する' do
				visit edit_post_path(post)
				fill_in 'post[body]', with: ''
				click_button '更新して投稿する'
				expect(page).to have_content '1文字以上で入力してください'
				expect(current_path).to eq '/posts/' + post.id.to_s
			end
		end
  end
end