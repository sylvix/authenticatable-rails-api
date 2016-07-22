require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test 'authenticate with username' do
    pw = 'secret'
    larry = User.create!(username: 'larry', email: 'larry@example.com', name: 'Larry Moulders', password: pw, password_confirmation: pw)
    post session_create_path, params: { username_or_email: larry.username, password: pw }
    results = JSON.parse(response.body)
    assert results['access_token'] =~ /\S{32}/
    assert results['user']['id'] == larry.id
  end

  test 'authenticate with email' do
    pw = 'secret'
    larry = User.create!(username: 'larry', email: 'larry@example.com', name: 'Larry Moulders', password: pw, password_confirmation: pw)
    post session_create_path, params: { username_or_email: larry.email, password: pw }
    results = JSON.parse(response.body)
    assert results['access_token'] =~ /\S{32}/
    assert results['user']['id'] == larry.id
  end

  test 'authenticate with invalid info' do
    pw = 'secret'
    larry = User.create!(username: 'larry', email: 'larry@example.com', name: 'Larry Moulders', password: pw, password_confirmation: pw)
    post session_create_path, params: { username_or_email: larry.email, password: 'huh' }
    assert response.status == 401
  end
end