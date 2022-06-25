class Public::ItemCommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    comment = current_customer.item_comments.new(item_comment_params)
    comment.item_id = item.id
    comment.save
    redirect_to item_path(item)
  end

  def destroy
    ItemComment.find(params[:id]).destroy
    redirect_to item_path(params[:item_id])
  end
  
  def comment_average
    if @item.item_comment.blank?
      @average_star = 0
    else
      @average_star = @item.item_comment.average(:star).round(2)
    end
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:comment, :name, :star)
  end
end