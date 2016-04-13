def set_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
                  { :provider => :facebook,
                    :uid => '1234',
                    :info => {
                      :email => 'foobar@example.com'
                    }
                  })
end

def set_invalid_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end
