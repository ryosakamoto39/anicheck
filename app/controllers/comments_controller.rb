class CommentsController < ApplicationController
  def new
    @review_id = params[:review_id]
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = Comment.new(user_id: current_user.id, review_id: params[:review_id], content: params[:comment][:content])
    @comment.save
    @review = @comment.review
    @review.create_notification_comment!(current_user, @comment.id)
    @review_id = params[:review_id]
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(content: params[:comment][:content])
    respond_to do |format|
      format.js
    end
  end
end
