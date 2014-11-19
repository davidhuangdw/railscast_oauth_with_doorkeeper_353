require File.expand_path('lib/omniauth/strategies/todo', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :todo, '02595cf0ea6999035993f3eee8eb3e3f53bfb7378d0a6752c93862f88cc4cecf',
           'fc09c1bc20c7bd09495b800194de7208418ec4cff0ee71d883d5597cec8e6113'
end