# require 'faker'
#
# min = 0
# max = 10
#
# for index in min..max-1  # Products
#   code = Faker::Code.asin
#
#   name = loop do
#     name_temp = Faker::Beer.name
#     break name_temp unless Product.exists?(:name => name_temp)
#   end
#
#   Product.create(code: code, name: name)
# end
#
# @products = Product.all
#
# for index in min..max-1
#   email = loop do
#     email_temp = Faker::Internet.email
#     break email_temp unless Customer.exists?(:email => email_temp)
#   end
#
#   first_name = loop do
#     first_name_temp = Faker::Name.first_name
#     break first_name_temp unless Customer.exists?(:first_name => first_name_temp)
#   end
#
#   last_name = loop do
#     last_name_temp = Faker::Name.last_name
#     break last_name_temp unless Customer.exists?(:last_name => last_name_temp)
#   end
#
#   address = Faker::Address.street_address
#   phone_number = Faker::PhoneNumber.cell_phone
#   status = Faker::Team.state
#
#   customer_data = {
#     email: email,
#     first_name: first_name,
#     last_name: last_name,
#     address: address,
#     phone_number: phone_number,
#     status: status
#   }
#
#   Customer.create(customer_data)
# end
#
# @customers = Customer.all
#
# for index in min..max-1
#   customer_id = @customers[rand(min..max-1)].id
#   code = Faker::Code.imei
#   date = Faker::Date.between(100.days.ago, Date.today)
#   total_price = Faker::Number.number(8)
#   paid_amount = Faker::Number.number(4)
#   status = Faker::Team.state
#
#   data = {
#     customer_id: customer_id,
#     code: code,
#     date: date,
#     total_price: total_price,
#     paid_amount: paid_amount,
#     status: "Waiting"
#   }
#
#   Order.create(data)
# end
#
# @orders = Order.all
#
# for index in min..max-1
#   order_id = @orders[index].id
#   data_for_import_order = {
#     order_id: order_id
#   }
#
#   data_for_order_item = {
#     order_id: order_id,
#     product_id: @products[index].id,
#     number: rand(min..max-1),
#     price: rand(min..max-1)
#   }
#
#   ImportOrder.create(data_for_import_order)
#   OrderItem.create(data_for_order_item)
# end
#
# @import_orders = ImportOrder.all
#
# for index in min..max-1
#   date = Faker::Date.between(100.days.ago, Date.today)
#   total_price = Faker::Number.number(8)
#   status = Faker::Team.state
#
#   data = {
#     date: date
#   }
#
#   Container.create(data)
# end
#
# @containers = Container.all
#
# for index in min..max-1
#   product_id = @products[index].id
#   container_id = @containers[rand(min..max-1)].id
#   import_order_id = @import_orders[rand(min..max-1)].id
#   price = Faker::Number.number(4)
#   number = Faker::Number.between(min + 1, max)
#
#   data = {
#     product_id: product_id,
#     container_id: container_id,
#     import_order_id: import_order_id,
#     price: price,
#     number: number,
#     status: "Waiting"
#   }
#
#   ImportOrderItem.create(data)
# end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
#
# for index in min..max-1
#   product_id = @products[index].id
#   number = rand(min+1..max)
#   waiting = rand(min+1..max)
#   data = {
#     product_id: product_id,
#     number: number,
#     waiting: waiting
#   }
#   Repository.create(data)
# end
