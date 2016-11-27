class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to @comment.post
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
