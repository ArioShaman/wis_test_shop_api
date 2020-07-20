json.extract! wish_el,
    :id,
    :created_at

json.phone do 
    json.partial! wish_el.phone, as: :phone
end