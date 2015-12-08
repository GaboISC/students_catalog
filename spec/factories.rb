FactoryGirl.define do
  factory :teacher do
    email 'teacher@hotmail.com'
    password '12345678'
	password_confirmation '12345678'
    # if needed
    # is_active true
  end
end