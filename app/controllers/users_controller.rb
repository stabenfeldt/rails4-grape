class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_department, only: [:new, :edit, :add_user, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @tasks = @current_user.tasks.where(accepted: true).order(created_at: :desc)
    @new_tasks = @current_user.tasks.where(accepted: nil).order(created_at: :desc)
  end

  # GET /users/new
  def new
    @form_action = add_user_users_path
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @form_action = user_path(@user)
  end

  # POST /users
  # POST /users.json
  def add_user
    @user = User.new(first_name: params[:user][:first_name],
                     last_name: params[:user][:last_name], 
                     mobile: params[:user][:mobile], 
                     department_id: params[:user][:department_id], 
                     roles: "{#{params[:user][:roles]}}", 
                     image: params[:user][:image], 
                     emp_id: params[:user][:emp_id],
                     password: "password")
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, 
                      notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, 
                    notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(first_name: params[:user][:first_name], 
                              last_name: params[:user][:last_name], 
                              mobile: params[:user][:mobile], 
                              department_id: params[:user][:department_id], 
                              roles: "{#{params[:user][:roles]}}", 
                              image: params[:user][:image], 
                              emp_id: params[:user][:emp_id])
        format.html { redirect_to users_url, 
                    notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.id == current_user.id
      redirect_to users_url, notice: 'This user cant be deleted.'
    else
      @user.destroy
      flash[:notice] = 'User was successfully deleted.'
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_department
      @department = Department.all
    end

    # Never trust parameters from the scary internet, 
    #only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, 
                                  :tasks_id, :mobile, :emp_id, 
                                  :department_id, :roles, :image)
    end
end
