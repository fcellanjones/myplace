module AmenityHelper
include FontAwesome::Rails::IconHelper

  def amenity_icon(name)
    case name
    when "Shared workspace"
      fa_icon("building")
    when "Quiet working"
      fa_icon("volume-mute")
    when "Seperate room"
      fa_icon("laptop-house")
    when "Table and chair"
      fa_icon("chair")
    when "Speedy Wifi"
      fa_icon("wifi")
    when "Women-only space"
      fa_icon("female")
    when "Coffee and tea available"
      fa_icon("coffee")
    when "Kitchen available"
      fa_icon("utensils")
    when "Dog friendly"
      fa_icon("dog")
    when "Covid-secure"
      fa_icon("hand-sparkles")
    end
  end
end
