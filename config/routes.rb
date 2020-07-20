Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    scope '/api', defaults: {format: :json} do
        
        resources :phones, only: [:index]
        resources :guest_users, only: [:show]

        post '/wish_lists/add_el/:guest_user_id' => 'wish_lists#add_to_wish_list'
        post '/wish_lists/remove_el/:guest_user_id' => 'wish_lists#remove_from_wish_list'

        post '/baskets/add_el/:guest_user_id' => 'baskets#add_to_basket'
        post '/baskets/remove_el/:guest_user_id' => 'baskets#remove_from_basket'
        post '/baskets/decrement/:guest_user_id' => 'baskets#decrement'
        post '/baskets/increment/:guest_user_id' => 'baskets#increment'
        
    end
end
