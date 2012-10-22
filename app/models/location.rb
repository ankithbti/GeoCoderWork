# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :city, :zipcode, :country
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |obj,results|
	  if geo = results.first
	    obj.city    = geo.city
	    obj.zipcode = geo.postal_code
	    obj.country = geo.country_code
	    
	  end
  end

  after_validation :geocode, :reverse_geocode if :address_changed?
end
