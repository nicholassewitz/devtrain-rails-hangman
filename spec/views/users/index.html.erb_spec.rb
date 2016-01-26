require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(name: "User 1", email: "1@user.com", password: "foobar", password_confirmation: "foobar"),
      User.create!(name: "User 2", email: "2@user.com", password: "foobar", password_confirmation: "foobar")
    ])
  end

  it "renders a list of users" do
    render
  end
end