require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe '新規投稿' do
    context "新規投稿ページが正しく表示される" do
      before do
        get new_post_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response,body).to include("新規投稿")
      end
    end
  end
end