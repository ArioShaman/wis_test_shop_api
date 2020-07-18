json.id wish_el.id
json.phone do 
    json.partial! wish_el.phone, as: :phone
end
json.created_at wish_el.created_at