class ChatboxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatbox, only: [:edit, :update, :destroy]

  # GET /chatboxes
  # GET /chatboxes.json
  def index
    @chatboxes = Chatbox.all
  end

  # GET /chatboxes/1
  # GET /chatboxes/1.json
  def show
    @messages = Message.all
  end

  # GET /chatboxes/new
  def new
    @chatbox = Chatbox.new
  end

  # GET /chatboxes/1/edit
  def edit
  end

  # POST /chatboxes
  # POST /chatboxes.json
  def create
    @chatbox = Chatbox.new(chatbox_params)

    respond_to do |format|
      if @chatbox.save
        format.html { redirect_to @chatbox, notice: 'Chatbox was successfully created.' }
        format.json { render :show, status: :created, location: @chatbox }
      else
        format.html { render :new }
        format.json { render json: @chatbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatboxes/1
  # PATCH/PUT /chatboxes/1.json
  def update
    respond_to do |format|
      if @chatbox.update(chatbox_params)
        format.html { redirect_to @chatbox, notice: 'Chatbox was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatbox }
      else
        format.html { render :edit }
        format.json { render json: @chatbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatboxes/1
  # DELETE /chatboxes/1.json
  def destroy
    @chatbox.destroy
    respond_to do |format|
      format.html { redirect_to chatboxes_url, notice: 'Chatbox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatbox
      @chatbox = Chatbox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatbox_params
      params.fetch(:chatbox, {})
    end
end
