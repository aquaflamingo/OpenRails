require 'rails_helper'

RSpec.describe UserController, type: :controller do

	describe 'GET #show' do
		context "user owns the profile" do
			it "does not shows edit profile"

			it "renders the :show template"
		end


		context "user does not own the profile" do
			it "does not show edit profile"

			it "renders the :show template"
		end
	end

end
