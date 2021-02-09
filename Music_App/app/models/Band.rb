# == Schema Information
#
# Table name: bands
#
#  id   :bigint           not null, primary key
#  name :string           not null
#
class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
