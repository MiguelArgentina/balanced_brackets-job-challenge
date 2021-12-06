Rails.application.routes.draw do
  get 'test/calculate'
  root 'test#calculate'
end
