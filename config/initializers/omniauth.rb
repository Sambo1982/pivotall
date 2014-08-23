OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '100244255790-pddgbdhir6uf58id34bk9dcserahtcge.apps.googleusercontent.com', 'gBtwHDw8NhlCQ5RTMMQrHYHz', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end