module UsersHelper

  def standalone_rewards(user, credit_card)
    spending_rewards = 0

    CreditCard::CATEGORIES.each do |category| 
      spending_rewards += credit_card.public_send(category) * user.public_send(category) 
    end

    spending_rewards -= credit_card.annual_fee*100
  end

  def standalone_bonus_rewards(user, credit_card)
    spending_rewards = 0
    owned_card_names = user.owned_cards.pluck(:card_name)

    CreditCard::CATEGORIES.each do |category| 
      spending_rewards += credit_card.public_send(category) * user.public_send(category)
    end

    if owned_card_names.include?("Sapphire Reserve")
      spending_rewards = spending_rewards*1.50
    elsif owned_card_names.include?("Sapphire Preferred")
      spending_rewards = spending_rewards*1.25 
    end

    spending_rewards -= credit_card.annual_fee*100
  end

end
