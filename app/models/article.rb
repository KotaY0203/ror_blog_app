class Article < ApplicationRecord
    FLAG_NOT_DELETED = nil
    MAX_TITLE_NUM = 255

    validates :title, presence: true, length: {maximum: MAX_TITLE_NUM}
    validates :content, presence: true
end
