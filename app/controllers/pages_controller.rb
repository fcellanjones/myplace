class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def about
  end

  def business
  end

  def hosts
  end

  def membership
  end

  def privacy
  end

  def support
  end

  def terms
  end
end
