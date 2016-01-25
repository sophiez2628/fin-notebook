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
end
