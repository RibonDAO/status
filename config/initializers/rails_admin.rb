RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authenticate_with do
    # this is a rails controller helper
    authenticate_or_request_with_http_basic('Login required') do |email, password|

      # Here we're checking for username & password provided with basic auth
      resource = Admin.find_by(email: email)

      # we're using devise helpers to verify password and sign in the user
      if resource&.valid_password?(password)
        sign_in :admin, resource
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = [Incident]
end
