class Book < ApplicationRecord

    enum inout: { in: 1, out: 2 }

    validates :year, presence: true, numericality: { only_integer: true } 
    validates :month, presence: true, numericality: { only_integer: true }
    validates :inout, presence: true, numericality: { only_integer: true }
    validates :category, presence: true
    validates :amount, presence: true, numericality: { only_integer: true }
end
