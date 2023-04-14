class Cat < ApplicationRecord
    CAT_COLORS = [
        "brown",
        "white",
        "pink",
        "purple",
        "black"
    ]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: ["M", "F"]}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future 
        if birth_date > Date.today
            errors.add(:birth_date, "Birthday cannot be in future")
        end
    end

    def age
        ((Date.today - birth_date)/365.0).floor
    end



end
