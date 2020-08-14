Rails.application.routes.draw do
    scope '/api', defaults: { format: :json } do
        
        resources :guest_users, only: [:show]
        

        resources :phones, only: [:index] do 
            resources :comments, only: [:index, :create] do
                post '/add_sub_comment', to: 'comments#add_sub_comment'
            end
            
        end
        
        resources :orders, only: [:create] do 
            resources :comments, only: [:index, :create] do 
                post '/add_sub_comment', to: 'comments#add_sub_comment'
            end
            
        end

        post '/wish_lists/add_el/:guest_user_id' => 'wish_lists#add_to_wish_list'
        post '/wish_lists/remove_el/:guest_user_id' => 'wish_lists#remove_from_wish_list'

        post '/shoping_carts/add_el/:guest_user_id' => 'shoping_carts#add_to_shoping_cart'
        post '/shoping_carts/remove_el/:guest_user_id' => 'shoping_carts#remove_from_shoping_cart'
        post '/shoping_carts/decrement/:guest_user_id' => 'shoping_carts#decrement'
        post '/shoping_carts/increment/:guest_user_id' => 'shoping_carts#increment'
        
    end
end
