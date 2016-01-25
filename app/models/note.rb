# == Schema Information
#
# Table name: notes
#
#  id      :integer          not null, primary key
#  text    :text             not null
#  user_id :integer          not null
#  lat     :float            not null
#  lng     :float            not null
#

class Note < ActiveRecord::Base
  def distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[:lat].to_f - loc1[:lat].to_f) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[:lng].to_f - loc1[:lng].to_f) * rad_per_deg

    lat1_rad = loc1[:lat].to_f * rad_per_deg
    lon1_rad = loc1[:lng].to_f * rad_per_deg

    lat2_rad = loc2[:lat].to_f * rad_per_deg
    lon2_rad = loc2[:lng].to_f * rad_per_deg

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

  def self.find_based_on_radius(params)
    filtered_notes = Note.all.select do |note|
      if (note.distance(note, params) <= params[:radius].to_f)
        true
      else
        false
      end
    end
  end


end
