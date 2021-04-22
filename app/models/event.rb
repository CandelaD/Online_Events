class Event < ApplicationRecord
    has_rich_text :description
    has_and_belongs_to_many :users
end
