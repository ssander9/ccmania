# README
# ccmania
Major Features in place:
Users can create an account
  Can indicate which credit cards they own
  Can bookmark credit cards

Admins can manage credit cards
  Create, Edit, Destroy

## Second most important

### Getting started

Make sure postgres is turned on by running: `sudo /etc/init.d/postgresql restart`

First time running the app, run the following:

- `rails db:create`
- `rails db:migrate`

#### Fourth
##### Code Snippets



###### Max 6th
Credit Card edit form
  Rewards points not saving right
  Defaults to cash_back

Can't get the credit_cards.include? to work

Credits
  Travel Credits
  Airline Incidental Credits
  Doordash Credits
  Uber Credits
  Lyft Credits
  Other Credits

Perqs
  Lounge Access
  Rental Car Insurance
  Trip Coverage / Insurance
  Extended Warranty
  Purchase Protection

Things I want to do..
Linking table for cards and users (optimal wallet)
Linking table for cards and users (constrained optimization such as only want 3 cards etc.)
  
Error Messages (Duplicate requests, invalid username, other weird stuff)

Dropdown menu for credit cards
  ?Points and rewards explanation page.. Not sure if I want this here or somewhere else
  Explore Cards - Card Summary Cards with pics and highlights
    ?Highlights vary across cards
    ?How to value annual credits
      ?Allow user to input the value of annual credits
    ?Credit rating approval odds
    Can sort cards by provider, etc.
  Card Reward Matrix - Table with complete summary by category (only available to users?)
    ?Company Specific Cards
  Card Combinations
  Card Reviews?

Account button in nav bar with dropdown menu
  My Account - Shows user details and information (user estimates credit rating?)
    User can estimate credit rating
    ?Qualifies for business card
  My Wallet - User is able to add their current cards to their wallet
  My Spending - User is able to input their current spending and perhaps store multiple spending scenarios
    If User doesn't know annual spend - can input estimated monthly spend
    User can update spending inline (wihtout going through entire form) and save changes

Rewards Calculator
  User selects (inputs saved?) budget - calculates current rewards based off their wallet
  Calculates rewards for all cards based off spending and displays the top 3?
  Calculates rewards for all card combinations based off spending and displays optimal combo (User can limit cards?)
  ?Breakdown of savings? Where is it coming from?
  ?Links to applications


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
