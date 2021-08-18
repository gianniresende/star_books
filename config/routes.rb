Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'

  api_version module: "Api/V1", path: {value: "api/v1"}, defaults: { format: :json } do
    resource :books
  end
end
