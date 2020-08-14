Rails.application.routes.draw do
    # match '*path  ' => 'application#render_404', via: :all

    scope '/api', defaults: { format: :json } do
        
        resources :phones, only: [:index] do 
            resources :comments, only: [:index, :create]
        end
        resources :guest_users, only: [:show]
        resources :orders, only: [:create] do 
            resources :comments, only: [:index, :create]
        end

        post '/wish_lists/add_el/:guest_user_id' => 'wish_lists#add_to_wish_list'
        post '/wish_lists/remove_el/:guest_user_id' => 'wish_lists#remove_from_wish_list'

        post '/shoping_carts/add_el/:guest_user_id' => 'shoping_carts#add_to_shoping_cart'
        post '/shoping_carts/remove_el/:guest_user_id' => 'shoping_carts#remove_from_shoping_cart'
        post '/shoping_carts/decrement/:guest_user_id' => 'shoping_carts#decrement'
        post '/shoping_carts/increment/:guest_user_id' => 'shoping_carts#increment'
        
    end
end
