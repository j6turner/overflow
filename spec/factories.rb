FactoryGirl.define do
  factory(:question) do
    title('What is science?')
    content('So, I\'m confused. What exactly IS science? Be specific.')
    user
  end

  factory(:response) do
    content('It\'s like magic.  Only real.')
    question
    user
  end

  factory(:user) do
    sequence(:email) { |n| "lol#{n}@omg.com" }
    password("12345678")
  end
end
