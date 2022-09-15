class Report < ApplicationRecord
    validates :content,{length:{maximum: 5000}}
end
