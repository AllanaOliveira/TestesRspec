require "rails_helper"
RSpec.describe Admin, type: :request do
  # request
  describe "Request" do
    it "#index" do
      get root_path
      expect(response.status).to eq(200)
    end
  end
end