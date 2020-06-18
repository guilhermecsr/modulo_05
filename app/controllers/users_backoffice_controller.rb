class UsersBackofficeController < UsersBackofficeController
  before_action :authenticate_user!
  layout 'admin_backoffice'
end
