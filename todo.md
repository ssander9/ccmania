### Issues
* [ ] Credit Card edit form
  * Rewards points not saving correctly
  * Defaults to cash_back
* [ ] credit_cards.include? not working
  
### Moving Forward
* [ ] Add in credits
  * Travel Credit
  * Airline incidental
  * Doordash
  * Uber/Lyft
  * Etc.
* [ ] Value other perqs
  * Lounge
  * Rental car
  * Trip coverage
  * Extended warranty
  * Purchase protection

Things I want to do
* [ ] Linking table for cards and users (optimal wallet)
* [ ] Linking table for cards and users (constrained optimization, like 3 cards only etc.)
* [ ] Error Messages
  *  Duplicate requests
  *  Invalid username
  *  Etc.
* [ ] Dropdown menu for credit cards
  * Point and rewards
  * Explore
  * Card reward matrix
  * Card combinations
  * Card reviews
*  [ ] Account button in nav bar with dropdown
   *  My account
   *  My wallet
   *  My spending
*  [ ] Rewards Calculator
   *  [ ] User selects budget
   *  [ ] display top 3 cards based off budget
   *  [ ] display optimal wallet
   *  [ ] breakdown of savings?

#### Optimization thoughts


Thinking through the card optimization problem there are a few different solutions...

First (and probably dumbest way - does not scale well with num cards or num users)..

Join table where each user has every single combination of cards. Calculate the rewards for all of these combinations and then pick out the maximum

Second...
Just like excel solver iterate through every possible wallet and then pick the best one.

start with wallet 1 and apply rewards to user spending and save a vector of rewards, wallet id, and sum of rewards. Iterate through the wallets and then when done spit out the wallet id and vector of cards. Can set up parameters for acceptable wallets like max cards = 3 or max annual fee = 400. Can maybe scale the credits although this is tough.

Something like..

```
max_reward = 0
max_card = ""
    CreditCard.all.each do |card|
        total_reward = 0
        CreditCard::CATEGORIES.each do |category|
            total_reward += User.first.public_send(category) * card.public_send(category)
            if total_reward > max_reward
                max_reward = total_reward
                max_card = card.card_name
            end
        end
    end
print max_card, max_reward
```
but iterating through wallets not cards.

Build a "Potential Wallet" table with every combination of cards that spits out all the modded rewards for a given set of cards (scales better with users but not necessarily with cards)

Third...

Matrix math-based solution?

<!-- Index

<div>
  <% @credit_card.each do |credit_card| %>
    <div class="flex mt-6 mb-6 rounded-lg border border-gray-400 bg-white w-1/2">
      <div class="p-4 w-1/3 h-64">
        <p class="text-blue-500 hover:text-blue-300 font-semibold"><%= link_to "#{credit_card.card_provider.to_s.titlecase} #{credit_card.card_name.titlecase}", credit_card_path(credit_card.handle) %></p>
        <img class="mt-4 rounded shadow-lg" src="<%="img/cards/#{credit_card.card_provider.to_s.downcase.parameterize}-#{credit_card.card_name.downcase.parameterize}.png"%>" alt="Credit Card">
      </div>

      <div class="text-gray-700 p-4 w-1/3">
        <h1 class="text-gray-800 font-semibold">Points & Rewards</h1>
        <% credit_card.categories.each do |category| %>
          <% if credit_card.public_send(category)>=2 %>
            <p class="py-1"> <%= "#{credit_card.public_send(category).to_s.sub(/\.?0+$/,'')}X"%> Points on <%=category.to_s.capitalize%> </p>
          <% end %>
        <% end %>
        <p class="py-1"> <%= "#{credit_card.other.to_s.sub(/\.?0+$/,'')}X"%> Points on All Purchases </p>
      </div>

      <div class="p-4 w-1/3">
        <p class="font-semibold">Highlights</p>
      </div>
    </div>
  <% end %>
</div>

<li class="w-1/8 px-8 py-4 text-right">
          <%= link_to 'My Profile', user_path(current_user.id), class: 'text-blue-500 hover:text-blue-300 text-lg' %>
        </li>
        <li class="w-1/8 px-8 py-4 text-right">
          <%= link_to 'Log out', logout_path, method: :delete, class: 'text-blue-500 hover:text-blue-300 text-lg' %>
        </li>

dropdown menu attempt
 <li class="px-2">
          <div class="relative">
            <button class="block h-8 w-8 rounded-full overflow-hidden border-2 border-gray-600 focus:outline-none focus:border-white">
              <img class = "h-full w-full object-cover" src="img/icons/bookmark_star_fill.png" alt="star">
            </button>
            <div v-if="isOpen" class="absolute right-0 mt-2 py-2 w-48 bg-white rounded-lg shadow-xl">
              <a href="#" class="block py-2 px-4 text-gray-800 hover:bg-blue-500 hover:text-white ">Account Settings</a>
              <a href="#" class="block py-2 px-4 text-gray-800 hover:bg-blue-500 hover:text-white ">Support</a>
              <a href="#" class="block py-2 px-4 text-gray-800 hover:bg-blue-500 hover:text-white ">Sign Out</a>
            </div>
          </div>
        </li>

<% @user.starred_cards.each do |starred_card| %>
        <p><%= starred_card.card_name %></p>
      <% end %> 

 -->