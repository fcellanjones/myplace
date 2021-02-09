module AmenityHelper
  def amenity_icon(name)
    case name
    when "Speedy Wifi"
      "https://img.icons8.com/wired/64/000000/wifi-logo.png"
    when "Sockets available"
      "https://img.icons8.com/wired/64/000000/plug.png"
    when "Tea and Coffee"
      "https://img.icons8.com/wired/64/000000/tea.png"
    when "Screen available"
      "https://img.icons8.com/dotty/80/000000/laptop.png"
    when "Safe space"
      "https://image.shutterstock.com/image-vector/open-palms-female-silhouette-glyph-260nw-723726370.jpg"
    when "Quiet spaces"
      "https://img.icons8.com/ios/2x/quiet.png"
    end
  end
end
