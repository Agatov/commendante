class Account::MassOfferTasksController < AccountsController 
  def index
  end

  def show
    @mot = MassOfferTask.find params[:id]
  end

  def create
    @mot = current_user.account.widget.mass_offer_tasks.build mot_params

    if @mot.save
      render :show
    else
      render json: {status: :erro}
    end
  end

  private 

  def mot_params
    params.require(:mass_offer_task).permit(:emails)
  end
end