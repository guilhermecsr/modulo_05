# frozen_string_literal: true

# spec/support/spec_test_helper.rb
module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
    user = User.where(login: user.to_s).first if user.is_a?(Symbol)
    request.session[:user] = user.id
  end

  def current_user
    User.find(request.session[:user])
  end
end
