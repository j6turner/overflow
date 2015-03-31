FactoryGirl.define do
  factory(:question) do
    title('What is science?')
    content('So, I\'m confused. What exactly IS science? Be specific.')
    id(1)
    user_id(1)
  end

  factory(:response) do
    content('It\'s like magic.  Only real.')
    question_id(1)
    user_id(1)
  end

  factory(:user) do
    name("Sarah James")
    email("lol@omg.com")
    password("12345678")
  end
end
