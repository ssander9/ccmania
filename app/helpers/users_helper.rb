module UsersHelper

	def standalone_rewards(user, credit_card)
		spending_rewards = 0

		CreditCard::CATEGORIES.each do |category| 
			spending_rewards += credit_card.public_send(category) * user.public_send(category) 
		end
        spending_rewards = spending_rewards.round()

		spending_rewards -= credit_card.annual_fee*100
	end

	def standalone_bonus_rewards(user, credit_card)
		spending_rewards = 0
		credit_card_name = credit_card.card_name
        
        #Chase
        mod = 1
            if credit_card_name.include?("Sapphire Reserve")
        mod = 1.5
            elsif credit_card_name.include?("Sapphire Preferred")
        mod = 1.25
        end

        #Citi
        mod = 1
            if credit_card_name.include?("Prestige")
        mod = 1.5
            elsif credit_card_name.include?("Premier")
        mod = 1.25
        end

        CreditCard::CATEGORIES.each do |category| 
			spending_rewards += credit_card.public_send(category) * user.public_send(category) * mod
		end
        spending_rewards = spending_rewards.round()

		spending_rewards -= credit_card.annual_fee*100
	end

	def combined_rewards(user, owned_cards)
		spending_rewards = 0

		CreditCard::CATEGORIES.each do |category|
			spending_rewards += user.owned_cards.maximum(category) * user.public_send(category)
		end
        spending_rewards = spending_rewards.round()

        user.owned_cards.each do |owned_card|
			spending_rewards -= owned_card.annual_fee*100
		end
	end

	def combined_bonus_rewards(user)
		spending = []
		base_rewards = 0
		bonus_rewards = 0

		CreditCard::CATEGORIES.each do |category| 
			spending << user.public_send(category)
		end

		i = 0
		while i < spending.size
			base_rewards += spending[i]/100 * self.wallet_multipliers(user)[1][i]
			bonus_rewards += spending[i]/100 * self.wallet_multipliers(user)[3][i]
			i += 1
		end

		user.owned_cards.each do |owned_card|
			base_rewards -= owned_card.annual_fee
			bonus_rewards -= owned_card.annual_fee
		end

		return base_rewards, bonus_rewards
	end

	def wallet_multipliers(user)
		top_providers = []
		base_rewards = []
		bonus_mults = []
		bonus_rewards = []
		card_names = []
		owned_card_names = user.owned_cards.pluck(:card_name)

		#Chase
		chase_mod = 1
			if owned_card_names.include?("Sapphire Reserve")
		chase_mod = 1.5
			elsif owned_card_names.include?("Sapphire Preferred")
		chase_mod = 1.25
		end

		#Citi
		citi_mod = 1
			if owned_card_names.include?("Prestige")
		citi_mod = 1.5
			elsif owned_card_names.include?("Premier")
		citi_mod = 1.25
		end

		CreditCard::CATEGORIES.each do |category|
			top_provider = nil
			base_reward = 0
			bonus_mult = 1
			bonus_reward = 0
			card_name = nil

			user.owned_cards.each do |owned_card|
				if owned_card.card_provider == "Chase"
					mod = chase_mod
					if (owned_card.public_send(category) * mod) >= user.owned_cards.maximum(category) && (owned_card.public_send(category) * mod) > bonus_reward
						top_provider = "Chase"
						base_reward = owned_card.public_send(category)
						bonus_mult = mod
						bonus_reward = owned_card.public_send(category) * mod
						card_name = owned_card.public_send(:card_name)
					end
				elsif owned_card.card_provider == "Citi"
					mod = citi_mod
					if (owned_card.public_send(category) * mod) >= user.owned_cards.maximum(category) && (owned_card.public_send(category) * mod) > bonus_reward
						top_provider = "Citi"
						base_reward = owned_card.public_send(category)
						bonus_mult = mod
						bonus_reward = owned_card.public_send(category) * mod
						card_name = owned_card.public_send(:card_name)
					end
				end
			end

			top_providers << top_provider
			base_rewards << base_reward
			bonus_mults << bonus_mult
			bonus_rewards << bonus_reward
			card_names << card_name
		end

		return top_providers, base_rewards, bonus_mults, bonus_rewards, card_names
	end


end
