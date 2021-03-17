class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :business, :hosts, :membership, :privacy, :support, :terms]

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

  def guidelines
  end
end
