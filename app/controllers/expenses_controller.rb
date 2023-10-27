class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @path_description = 'NEW TRANSACTION'
    @author = current_user
    @groups = current_user.groups
    @group = @groups.find(params[:group_id])
    @arrow_path = group_path(@groups[0])
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.new(expense_params)
    @groups = params[:expense][:group_ids]

    if @expense.save
      @groups.each do |g|
        linked_groups = Group.find(g)
        ExpenseGroup.create(expense: @expense, group: linked_groups)
      end
      flash[:success] = 'The Expense was added successfully.'
      redirect_to group_path(@groups[0])
    else
      flash[:error] = 'Error occurred.'
      redirect_to new_group_path
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
