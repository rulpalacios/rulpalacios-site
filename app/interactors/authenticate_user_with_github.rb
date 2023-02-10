class AuthenticateUserWithGithub
  include Interactor

  def call
    context.user = find_or_create_user_by_oauth
  end

  private

  def find_or_create_user_by_oauth
    user = User.find_or_create_by(email: oauth_email) do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def oauth_email
    context.auth.info.email
  end
end