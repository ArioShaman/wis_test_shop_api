json.extract! basket_el, 
    :id,
    :count,
    :created_at

json.phone do 
    json.partial! basket_el.phone, as: :phone
end