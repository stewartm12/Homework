require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "is_password?" do 
    it "verifies a password is correct" do 
      expect(user.is_password?("good answer")).to be true 
    end
  end

  describe "reset_session_token!" do 
    it "sets a new session token on the user" do 
      user.valid?
      old_session_token = user.session_token 
      user.reset_session_token! 
      expect(user.session_token("good answer")).to_not eq(old_session_token)
    end
  end

  describe "::find_by_credentials" do 
    before {user.save! }

    it "returns user with good credentials" do
      expect(User.find_by_credentials("someone@fakesite.com", "good_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("hero@fakesite.com", "bad_password")).to eq(nil)
    end
  end
end
