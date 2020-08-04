# frozen_string_literal: true

class AdminsBackofficeController < ApplicationController
  before_action :authenticate_admin!
  # layout 'admins_backoffice'
  layout 'application'
end
