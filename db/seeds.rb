# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

iphones = [
    {
        name: 'Iphone 11, Pro Max, 64 ГБ, черный',
        price: '84000.00',
        image: 'iphone_11_pro_black.jpg'
    },
    {
        name: 'Iphone 11, Pro Max, 256 ГБ, черный',
        price: '92000.00',
        image: 'iphone_11_pro_black.jpg'
    },
    {
        name: 'Iphone 11, Pro Max, 512 ГБ, черный',
        price: '133000.00',
        image: 'iphone_11_pro_black.jpg'
    },
    {
        name: 'Iphone 11, Pro Max, 64 ГБ, серый',
        price: '84000.00',
        image: 'iphone_11_pro_grey.jpg'
    },
    {
        name: 'Iphone 11, Pro Max, 256 ГБ, серый',
        price: '91000.00',
        image: 'iphone_11_pro_grey.jpg'
    },
    {
        name: 'Iphone 11, Pro Max, 256 ГБ, золотой',
        price: '92000.00',
        image: 'iphone_11_pro_gold.jpg'
    },
    {
        name: 'Iphone 11, 128 ГБ, красный',
        price: '57000.00',
        image: 'iphone_11_red.jpg'
    },
    {
        name: 'Iphone 11, 256 ГБ, красный',
        price: '64000.00',
        image: 'iphone_11_red.jpg'
    },
    {
        name: 'Iphone 11, 64 ГБ, белый',
        price: '58000.00',
        image: 'iphone_11_white.jpg'
    },
    {
        name: 'Iphone 11, 128 ГБ, белый',
        price: '67000.00',
        image: 'iphone_11_white.jpg'
    },
    {
        name: 'Iphone 11, 256 ГБ, белый',
        price: '67000.00',
        image: 'iphone_11_white.jpg'
    },
    {
        name: 'Iphone 11, 512 ГБ, белый',
        price: '65000.00',
        image: 'iphone_11_white.jpg'
    },
    {
        name: 'Iphone 11, 64 ГБ, зеленый',
        price: '54000.00',
        image: 'iphone_11_green.jpg'
    },
    {
        name: 'Iphone 11, 128 ГБ, зеленый',
        price: '63000.00',
        image: 'iphone_11_green.jpg'
    },
    {
        name: 'Iphone 11, 256 ГБ, зеленый',
        price: '75000.00',
        image: 'iphone_11_green.jpg'
    },
    {
        name: 'Iphone 11, 256 ГБ, желтый',
        price: '75000.00',
        image: 'iphone_11_yellow.jpg'
    },
    {
        name: 'Iphone 7, 64 ГБ, черный',
        price: '34000.00',
        image: 'iphone_7_black.jpg'
    },
    {
        name: 'Iphone 7, 64 ГБ, золотой',
        price: '34000.00',
        image: 'iphone_7_black.jpg'
    },
    {
        name: 'Iphone 7, 128 ГБ, золотой',
        price: '39000.00',
        image: 'iphone_7_black.jpg'
    },
    {
        name: 'IphoneSE, 64 ГБ, черный',
        price: '43000.00',
        image: 'iphone_se_black.jpg'
    },
    {
        name: 'IphoneSE, 128 ГБ, черный',
        price: '43000.00',
        image: 'iphone_se_black.jpg'
    },
    {
        name: 'IphoneSE, 256 ГБ, черный',
        price: '49000.00',
        image: 'iphone_se_black.jpg'
    },
    {
        name: 'IphoneSE, 64 ГБ, красный',
        price: '43000.00',
        image: 'iphone_se_red.jpg'
    },
    {
        name: 'IphoneSE, 128 ГБ, красный',
        price: '49000.00',
        image: 'iphone_se_red.jpg'
    },
    {
        name: 'IphoneSE, 256 ГБ, красный',
        price: '54000.00',
        image: 'iphone_se_red.jpg'
    },
    {
        name: 'IphoneSE, 512 ГБ, красный',
        price: '65000.00',
        image: 'iphone_se_red.jpg'
    }
]

iphones.each do |iphone|
    phone = Phone.new(
        name: iphone[:name],
        price: iphone[:price]
    )
    File.open(File.join(Rails.root, 'load_images/'+iphone[:image]) ) do |f|
        phone.image = f
    end
    p phone
    phone.save!
end




