# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  def profile
    @user = current_user
  end
end
