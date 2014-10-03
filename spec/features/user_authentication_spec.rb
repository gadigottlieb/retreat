require 'rails_helper'

describe 'User Authentication', js: true do

  before :each do
    User.destroy_all
    visit root_path
  end

  it 'should start on a page that has a log In and sign up button' do
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Log In'
  end

  # When logging in
  it 'should produce a modal with login prompt when Log In is clicked' do
    modal = find '#user-auth-modal'
    click_link 'Log In'
    expect(modal).to have_content 'Log In'

  end

  it 'should allow a user to login' do
    User.create!(email: 'test@example.com', password: 'qwertyui', image_url: 'blah', password_confirmation: 'qwertyui', first_name: 'tester', last_name: 'one')

    click_link 'Log In'

    within('#user-auth-modal') do
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'qwertyui'
    end

    click_button 'Log In'
    expect(page).to have_content 'Tester'
  end

  it 'should produce an error when user enters an email that isn\'t registered' do
    click_link 'Log In'

    within('#user-auth-modal') do
      fill_in 'email', with: 'blah'
      fill_in 'password', with: 'blahblah'
    end

    modal = find '#user-auth-modal'
    click_button 'Log In'
    expect(modal).to have_content('not registered')
  end

  # When creating a new account
  it 'should produce a modal with Sign Up prompt when sign up is clicked' do
    click_link 'Sign Up'
    modal = find '#user-auth-modal'
    expect(modal).to have_content 'Sign Up'
  end

  it 'should create a new user in the database' do
    click_link 'Sign Up'

    within '#user-auth-modal' do
      fill_in 'user[first_name]', with: 'New'
      fill_in 'user[last_name]', with: 'User'
      fill_in 'user[email]', with: 'newuser@testing.com'
      fill_in 'user[password]', with: 'testtest'
      fill_in 'user[password_confirmation]', with: 'testtest'
    end

    click_button 'Sign Up'
    expect(User.all.count).to eq(1)
  end

  it 'should log in a user once they make an account' do
    click_link 'Sign Up'

    within '#user-auth-modal' do
      fill_in 'user[first_name]', with: 'New'
      fill_in 'user[last_name]', with: 'User'
      fill_in 'user[email]', with: 'newuser@testing.com'
      fill_in 'user[password]', with: 'testtest'
      fill_in 'user[password_confirmation]', with: 'testtest'
    end

    click_button 'Sign Up'
    expect(page).to have_content 'User'
  end
end
