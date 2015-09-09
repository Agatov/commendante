class Account::OffersController < AccountsController
  def index
    @offers = current_user.account.widget.offers.order('id desc').limit(20)
  end

  def create
    @offer = current_user.account.widget.offers.build offer_params

    if @offer.save
      OfferMailer.offer_created(@offer).deliver_later
      render :show
    else
      render json: {status: :error}
    end
  end

  def destroy
    @offer = Offer.find params[:id]
    @offer.destroy
    render :show
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :email)
  end
end