json.id @guest_user.token

json.wish_list @guest_user.wish_lists do |wish_el|
    json.partial! wish_el, as: :wish_el
end

json.basket @guest_user.baskets do |basket_el|
    json.partial! basket_el, as: :basket_el
end