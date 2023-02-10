class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    result = AuthenticateUserWithGithub.call(auth: request.env['omniauth.auth'])
    if result.success?
      sign_in_and_redirect result.user
    else
      redirect_to root_path
    end
  end
end