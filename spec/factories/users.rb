FactoryGirl.define do
	factory :user do
		email 'user@test.com'
		username 'redditRobot'
		password '12345678'
		password_confirmation '12345678'

		factory :user2 do
			email 'anotheruser@test.com'
			username 'snarky66'
		end
	end
end