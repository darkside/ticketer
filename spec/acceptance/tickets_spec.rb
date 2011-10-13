require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Tickets Index" do

  background do
    @user = Factory :user
    login_as @user
    visit root_path
  end

  scenario "User should see the amount of tickets he has" do
    page.should have_content("You have #{@user.tickets.count} tickets")
  end

  scenario "User should be able to create tickets" do
    page.should have_link( I18n.t("tickets.new.title"),
      :href => new_ticket_path )
  end

end

