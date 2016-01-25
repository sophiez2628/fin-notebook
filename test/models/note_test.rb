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

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
