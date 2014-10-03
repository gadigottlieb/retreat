User.destroy_all
User.create!(email: "ericfrommelt@gmail.com", password: "qwerty123", password_confirmation: "qwerty123", image_url: "http://placekitten.com/300/300", first_name: "Eric", last_name: "Frommelt")
User.create!(email: "najee_gardner@me.com", password: "qwerty123", password_confirmation: "qwerty123", image_url: "http://placekitten.com/300/300", first_name: "Najee", last_name: "Gardner")
User.create!(email: "gadigottlieb@gmail.com", password: "qwerty123", password_confirmation: "qwerty123", image_url: "http://placekitten.com/300/300", first_name: "Gadi", last_name: "Gottlieb")

najee_getaways = [
  {city: 'Narrowsburg', country: 'NY', departure_date: '2014-07-23', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'Los Angeles', country: 'CA', departure_date: '2013-04-12', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'San Francisco', country: 'CA', departure_date: '2013-04-20', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'Orlando', country: 'FL', departure_date: '2012-11-04', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'Paris', country: 'France', departure_date: '2010-02-16', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id}
]

Getaway.destroy_all
najee_getaways.each do |getaway|
  Getaway.create!(getaway)
end
