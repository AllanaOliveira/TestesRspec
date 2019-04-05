module ValidUserRequestHelper
  # Signs in a valid user uwing the page.drive.post method
  def valid_sign_in
    @admin ||= FactoryGirl.create :admin
    page.driver.post new_admin_session_path, :admin => {:email => @admin.email, :password => @admin.password}
  end
end