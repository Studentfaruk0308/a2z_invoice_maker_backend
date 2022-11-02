class Profile < ApplicationRecord

    before_save :downcase_email

	VALID_NAME_REGEX = /[a-z\s.-]/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	VALID_CONTACT_REGEX = /\A\d{10}\z/
    
    validates :company_name, presence: true, uniqueness: true, format: { with: VALID_NAME_REGEX, message: "should not contain numbers or symbols" }

	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "invalid"}

	validates :contact_number, presence: true, format: { with: VALID_CONTACT_REGEX, message: "invalid"}

    def downcase_email
        self.email = email.downcase
    end

    def to_s
        return self.company_name
    end

end

# t.string "profile_name"
# t.string "company_name"
# t.string "address"
# t.string "abn"
# t.string "email"
# t.string "contact_number"
# t.string "bank_details"