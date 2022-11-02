class Client < ApplicationRecord
    has_many :invoices

    before_save :downcase_email
    before_save :downcase_alternate_email

	VALID_NAME_REGEX = /[a-z\s.-]/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	VALID_MOBILE_REGEX = /\A\d{10}\z/
    VALID_PHONE_REGEX = /\A\d{10}\z/
    
    validates :company_name, presence: true, uniqueness: true, format: { with: VALID_NAME_REGEX, message: "should not contain numbers or symbols" }

	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "invalid"}

    validates :alternate_email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "invalid"}

	validates :mobile_number, presence: true, format: { with: VALID_MOBILE_REGEX, message: "invalid"}

	validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX, message: "invalid"}

    def downcase_email
        self.email = email.downcase
    end

    def downcase_alternate_email
        self.alternate_email = alternate_email.downcase
    end

    def to_s
        return self.company_name
    end

end

# t.string "company_name"
# t.string "contact_person_name"
# t.string "email"
# t.string "alternate_email"
# t.string "mobile_number"
# t.string "phone_number"
# t.string "postal_address"