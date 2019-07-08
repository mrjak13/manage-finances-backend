class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    
    
    if @user.save
      user_json = UserSerializer.new(@user).serialized_json

      session[:user_id] = @user.id

      render json: user_json
    else
      
      render json: {
        errors: @user.errors.full_messages
      }
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
