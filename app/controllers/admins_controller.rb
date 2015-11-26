require 'ostruct'

class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy ]
  #before_filter :authorize
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json  
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  #POST /admins/signin
  def signin
      @admin= Admin.find_by_email(params[:email])
      @dashboard=OpenStruct.new(:NumBanks => Admin.count , :NumCitizens => Citizen.count , :NumTransactions => Transaction.count )
      @transactions=OpenStruct.new(:transactions =>  Transaction.all)
      @signin_data = OpenStruct.new( :admin => @admin , :dashboard => @dashboard , :transactions => @transactions , :token => "123456" , :status => 200 , :message => "successful")
      @signin_error =OpenStruct.new(:status => 401 , :message => "Access Denied" )
      
      respond_to do |format|
      if  @admin && @admin.authenticate(params[:password])  
        format.html { redirect_to @admin, notice: 'Admin was successfully login.' }
        #format.json { render :show, status: :show, location: @admin ,notice: 'login successful.' }
        format.json { render json: @signin_data, status: :unprocessable_entity }
      else  
        format.html { render :new }
        format.json { render json: @signin_error , status: :unprocessable_entity }
      end
    end

  end  
  # POST /admins
  # POST /admins.json
  def create
    @admin =  Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin  }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:username, :password, :name, :security_question, :security_answer, :email, :phone, :level)
    end

    def admin_id
      Admin.find_by_email(params[:email]).try(:valid_password?, params[:password])
    end
  end
