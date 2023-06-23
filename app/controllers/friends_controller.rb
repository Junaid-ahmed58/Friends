class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]

  def index
    @friends = Friend.all
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def edit
  end

  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to friends_url(@friend), notice: "Friend was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friends_url(@friend), notice: "Friend was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
    end
  end

  private
    def set_friend
      @friend = Friend.find(params[:id])
    end

    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :instagram)
    end
end
