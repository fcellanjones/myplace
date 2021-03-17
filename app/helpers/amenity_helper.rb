module AmenityHelper
   include FontAwesome::Rails::IconHelper

  def amenity_icon(name)
    case name
    when "Shared workspace"
      "https://img.icons8.com/wired/64/000000/wifi-logo.png"
    when "Quiet working"
      "https://img.icons8.com/wired/64/000000/plug.png"
    when "Seperate room"
      "https://img.icons8.com/wired/64/000000/tea.png"
    when "Table and chair"
      "https://img.icons8.com/dotty/80/000000/laptop.png"
    when "Speedy Wifi"
      "https://image.shutterstock.com/image-vector/open-palms-female-silhouette-glyph-260nw-723726370.jpg"
    when "Women-only space"
      "https://img.icons8.com/ios/2x/quiet.png"
    when "Coffee and tea available"
      "https://img.icons8.com/dotty/80/000000/laptop.png"
    when "Kitchen available"
      "https://img.icons8.com/dotty/80/000000/laptop.png"
    when "Dog friendly"
      "https://img.icons8.com/dotty/80/000000/laptop.png"
    when "Covid-secure"
      "https://img.icons8.com/dotty/80/000000/laptop.png"
    end
  end
end
