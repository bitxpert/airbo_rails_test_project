puts "seeding customers"
customer1 = Customer.find_or_create_by!(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.find_or_create_by!(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.find_or_create_by!(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.find_or_create_by!(first_name: 'Mike', last_name: 'Smith')

puts " seeding transactions"

puts " 10 Should be successful transactions:"
	puts "- 5 Should be linked to Customer 1"
	puts "- 3 Should be linked to Customer 2"
	puts "- 1 Should be linked to Customer 3"
	puts "- 1 Should be linked to Customer 4"
5.times do
	customer1.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :successful )
end
3.times do
	customer2.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :successful )
end
1.times do
	customer3.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :successful )
end
1.times do
	customer4.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :successful )
end
puts " 5 Should be transactions that failed:"
	puts "- 3 Should be linked to Customer 3"
	puts "- 2 Should be linked to Customer 4"

3.times do
	customer3.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :failed )
end
2.times do
	customer4.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :failed )
end


puts " 5 should be disputed:"
	puts "- 3 should be linked to Customer 1"
	puts "- 2 should be linked to customer 2"

3.times do
	customer1.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :disputed )
end
2.times do
	customer2.charges.create!(amount: rand(1..1000)*100, currency: 'usd', state: :disputed )
end