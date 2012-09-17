class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper #potrzebny do przechowywania sesji
end
