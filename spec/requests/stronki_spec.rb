require 'spec_helper'

describe "Stronki" do

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/stronki/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the right title" do
      visit '/stronki/home'
      page.should have_selector('title',
                                :text => "Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/stronki/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the right title" do
      visit '/stronki/help'
      page.should have_selector('title',
                                :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/stronki/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the right title" do
      visit '/stronki/about'
      page.should have_selector('title',
                                :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end


end