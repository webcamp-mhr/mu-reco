# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Administrator.create(email: 'masaki@gmail.com', password: 'masaki')

User.create(email: 'a@a', password: 'aaaaaa', user_lastname: 'masaki', user_firstname: 'matsumura', user_lastname_kana: 'マサキ', user_firstname_kana: 'マツムラ', phone_number: '08011110000')
User.create(email: 'b@b', password: 'bbbbbb', user_lastname: '太郎', user_firstname: '山田', user_lastname_kana: 'タロウ', user_firstname_kana: 'ヤマダ', phone_number: '08011112222')

Address.create(user_id: '1', postcode: '1000001', address: '東京都千代田区1-1', address_priority: '1')
Address.create(user_id: '1', postcode: '7777777', address: '東京都ラッキー7区1-1', address_priority: '2')
Address.create(user_id: '2', postcode: '9999999', address: '大阪府西成区ホームレス', address_priority: '1')

Genre.create!(
  [{
      genre_name: 'マサキ-POP'
    },
    {
      genre_name: 'マサキ-ROCK'
    }
  ]
)

Artist.create!(
  [{
      artist_name: 'MASAKIN'
    },
    {
      artist_name: 'マサKing gnu'
    },
    {
      artist_name: 'マサキ・インティライミ'
    },
    {
      artist_name: 'マサKinKi Kids'
    }
  ]
)

Label.create!(
  [{
      label_name: 'レーベル1'
    },
    {
      label_name: 'レーベル2'
    },
    {
      label_name: 'レーベル3'
    }
  ]
)

Disc.create!(
  [{
      disc_name: 'ディスク1',
      product_id: '1'
    },
    {
      disc_name: 'ディスク2',
      product_id: '1'
    },
    {
      disc_name: 'ディスク3',
      product_id: '2'
    },
    {
      disc_name: 'ディスク3',
      product_id: '3'
    },
    {
      disc_name: 'ディスク4',
      product_id: '4'
    },

  ]
)

SongTitle.create!(
  [{
      song_title: 'りんご',
      disc_id: '1',
      truck_number: '1'
    },
    {
      song_title: 'ゴリラ',
      disc_id: '1',
      truck_number: '1'
    },
    {
      song_title: 'ラッパ',
      disc_id: '2',
      truck_number: '1'
    },
    {
      song_title: 'パンツ',
      disc_id: '3',
      truck_number: '1'
    },
    {
      song_title: 'ツバメ',
      disc_id: '4',
      truck_number: '1'
    },
    {
      song_title: 'メンタイコ',
      disc_id: '5',
      truck_number: '1'
    }
  ]
)


[
  ['1', 'マサキアルバム1', '10000', '1', '1', '100', 'true'],
  ['2', 'マサキアルバム2', '10', '2', '2', '1000', 'true'],
  ['3', 'マサキアルバム3', '1000', '3', '1', '1', 'false'],
  ['4', 'マサキアルバム4', '3', '2', '2', '0', 'false']
].each do |art, single, price, label, genre, stock, sale|
  Product.create!(
    { artist_id: art, single_album_name: single, price: price, label_id: label, genre_id: genre, stock_quantity: stock, sales_status: sale }
  )
  end