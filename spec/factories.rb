FactoryGirl.define do
  factory(:question) do
    title('What is science?')
    content('So, I\'m confused. What exactly IS science? Be specific.')
  end

  factory(:response) do
    content('It\'s like magic.  Only real.')
    question
  end
end
