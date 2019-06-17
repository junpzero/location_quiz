# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

if Location.count.zero?
  location = Location.new(name: '市役所',
                          longitude: 130.691098,
                          latitude: 33.646558,
                          image: open('db/fixtures/locations/1/location.jpg'),
                          hint: '8Fには食堂がある',
                          description: '2017年5月に新庁舎が開庁。\n8Fには一般の方でも利用できる食堂があり、\n飯塚市の景色を一望できる。')
  location.build_question(text: 'パスコードを入力せよ',
                          image: open('db/fixtures/locations/1/question.png'),
                          answer: 'IIZUKA')
  location.save!
end

