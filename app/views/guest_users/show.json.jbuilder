json.id @guest_user.token

# Здесь сразу подгрузаются все необходимые данные юзера
# Может быть проблема с тем, что количество может перевалить за сотню, вплоть до 1000 элементов,
# что сказится на скорости загрузки
# в таком случае можно выгружать обьект содержащий первые 10 элементов
# и количество всех элементов, после чего с фронта постепенно програжать остальные элементы

json.wish_list @guest_user.wish_lists do |wish_el|
    json.partial! wish_el, as: :wish_el, partial: 'wish_lists/wish_list'
end

# Здесь то же самое
json.basket @guest_user.baskets.not_ordered do |basket_el|
    json.partial! basket_el, as: :basket_el, partial: 'baskets/basket'
end