class AdminsBackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_backoffice'
end
