require 'rails_helper'
require 'capybara/rails'
RSpec.feature "home", type: :feature do
  describe "home page" do
    
    it " shows navigation" do
      visit "/"
      #looking for content via css selectors
      expect(page.find('.links')).to have_content("Aktualności")
    end

    it "is landing page" do
      visit "/"    
      expect(page).to have_content("Strona startowa")
    end

    it 'allows unauthenticated get index' do
      visit :posts
      expect(page.status_code).to be(200)
    end
  end
    

  describe "admin panel" do
    
    scenario 'does not let people visit admin without authenticating' do
      if page.driver.respond_to?(:basic_auth)
        page.driver.basic_auth("x", "x")
      elsif page.driver.respond_to?(:basic_authorize)
        page.driver.basic_authorize("x", "x")
      elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
        page.driver.browser.basic_authorize("x", "x")
      else
        raise "Wish I knew how to log in!"
      end

      visit :admin
    end
    
    it 'does not let people visit admin without authenticating' do
      visit :admin
      expect(page.status_code).to be(401)
    end
    
    scenario "guest can not acces new post form" do
      visit "/posts/new"
      expect(page.status_code).to be(401)
    end
  end
end