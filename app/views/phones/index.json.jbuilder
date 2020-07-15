json.boxes do
    json.partial! partial: 'phones/phone', collection: @phones, as: :phone
end