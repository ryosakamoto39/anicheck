require "rails_helper"

RSpec.describe "CommentLikes", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "#create" do
    before do
      @comment = FactoryBot.create(:comment)
    end

    context "未ログインの場合" do
      it "正常にレスポンスを返すこと" do
        get "/users/sign_in"
        expect(response).to have_http_status "200"
      end
    end

    context "一般ユーザー" do
      before do
        sign_in user
      end

      it "正常にレスポンスを返すこと" do
        post "/comment_likes?comment_id=#{@comment.id}", xhr: true
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        post "/comment_likes?comment_id=#{@comment.id}", xhr: true
        expect(response).to have_http_status "200"
      end
    end
  end

end
