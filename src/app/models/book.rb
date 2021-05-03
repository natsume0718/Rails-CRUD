class Book < ApplicationRecord
    validates :year, presence: true, numericality: { only_integer: true } 
    validates :month, presence: true, numericality: { only_integer: true }
    validates :inout, presence: true, numericality: { only_integer: true }
    validates :category, presence: true
    validates :amount, presence: true, numericality: { only_integer: true }
end
