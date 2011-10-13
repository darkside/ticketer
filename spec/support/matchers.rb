def with_a_logged_user(&block)
  include Devise::TestHelpers

  context "with a logged user" do
    let(:user) { Factory :user }

    before :each do
      sign_in user
    end

    instance_eval &block
  end
end

