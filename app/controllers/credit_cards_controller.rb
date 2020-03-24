class CreditCardsController < ApplicationController
  
  def index
    @credit_card = CreditCard.all
  end

  def new
    redirect_to "/credit_cards" unless current_user && current_user.is_admin
    @credit_card = CreditCard.new
  end

  def create
    redirect_to "/credit_cards" unless current_user && current_user.is_admin
    @credit_card = CreditCard.new(credit_card_params)

    if @credit_card.save
      redirect_to "/credit_cards"
    else
      render 'new'      
    end
  end

  def show
    @credit_card = CreditCard.find_by(handle:params[:id])
  end    
    
  def edit
    @credit_card = CreditCard.find_by(handle:params[:id])
  end    

  def update
    @credit_card = CreditCard.find_by(card_name: credit_card_params[:card_name])

    if @credit_card.update(credit_card_params)
      redirect_to credit_card_path(@credit_card.handle)
    else
      redirect_to edit_credit_card_path(@credit_card.handle)      
    end
  end

  def destroy
    @credit_card = CreditCard.find_by(handle:params[:id])
    @credit_card.destroy

    redirect_to '/credit_cards'
  end

  def own_card
    @credit_card = CreditCard.find(params[:id])
    current_user.owned_cards << @credit_card unless current_user.owned_cards.include?(@credit_card)

    if current_user.save
      redirect_to credit_card_path(@credit_card.handle)
    else
      redirect_to '/credit_cards'
    end
  end

  def remove_owned_card
    @credit_card = CreditCard.find(params[:id])
    if current_user.owned_cards.delete(@credit_card)
      redirect_to credit_card_path(@credit_card.handle)
    else
      redirect_to user_path(current_user)
    end
  end

  def star_card
    @credit_card = CreditCard.find(params[:id])
    current_user.starred_cards << @credit_card unless current_user.starred_cards.include?(@credit_card)

    if current_user.save
      redirect_to credit_card_path(@credit_card.handle)
    else
      redirect_to '/credit_cards'
    end
  end

  def remove_starred_card
    @credit_card = CreditCard.find(params[:id])
    if current_user.starred_cards.delete(@credit_card)
      redirect_to credit_card_path(@credit_card.handle)
    else
      redirect_to user_path(current_user)
    end
  end

  def rewards_matrix
    @credit_card = CreditCard.all
  end

  private
    def credit_card_params
      params.require(:credit_card).permit(:card_provider, :card_name, :card_network, :rewards_category, :annual_fee, :signup_bonus, :signup_bonus_spending_requirement, :gas, :transit, :rideshare, :entertainment, :streaming, :dining, :grocery, :drugstore, :department_store, :clothing, :travel, :hotel, :other)
    end

end
