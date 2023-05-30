class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.includes(:groups).where(author: current_user)
    @expenses = Expense.order(created_at: :desc)
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @expense.image.attach(params[:image])
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.author = current_user
    @expense.image.attach(params[:image])
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
    current_user.expenses << @expense
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    @expense.image.attach(params[:image])
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
    current_user.expenses << @expense
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.image.purge
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
    current_user.expenses.delete(@expense)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.includes(:groups).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id, :image, :group_id)
  end
end