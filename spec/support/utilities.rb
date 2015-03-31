def sign_in(user)
  visit log_in_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_on "Log In"
end

def add_response(response)
  fill_in 'Content', :with => response.content
  click_on "Add Response"
end
