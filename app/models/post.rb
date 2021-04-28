class Post < ApplicationRecord
    validates_presence_of :title, :description
    extend FriendlyId
    friendly_id :title, use: :slugged

    def should_generate_new_friendly_id?
        title_changed?
    end
end
