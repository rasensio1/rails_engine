task :load_data do
  byebug
  file = File.readlines('data/items.csv').shift

  file.each do |data_line|
    line = data_ine.chomp

    Item.create(name: line[1], description: line[2],
                unit_price: line[3], merchant_id: line[4],
                created_at: line[4], updated_at: line[5])
  end
end
