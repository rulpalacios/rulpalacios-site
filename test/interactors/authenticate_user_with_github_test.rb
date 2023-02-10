class AuthenticateUserWithGithubTest < ActiveSupport::TestCase
  def setup
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  def test_user_can_sing_in_with_github
    auth = OmniAuth.config.mock_auth[:github]

    assert AuthenticateUserWithGithub.call(auth: auth).success?
  end
end