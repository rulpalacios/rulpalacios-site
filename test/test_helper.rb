# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  provider: 'github',
  uid: '123545',
  info: {
    email: 'john_doe@mail.com',
    name: 'John Doe',
    nickname: 'john_doe',
    image: 'https://avatars.githubusercontent.com/u/123545?v=3',
    urls: {
      GitHub: '',
      Blog: '',
    },
  },
  credentials: {
    token: '1234567890',
    expires: false,
  }
})

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
