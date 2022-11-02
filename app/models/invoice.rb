class Invoice < ApplicationRecord
  belongs_to :client

  validates :inv_number, presence: true, uniqueness: true

  def to_s
    return self.inv_number
  end

  def client_details
    self.client.company_name
  end

end

# t.string "inv_number"
# t.integer "client_id", null: false
# t.datetime "date_of_issue"
# t.datetime "due_date"
# t.string "job_reference"
# t.string "description"
# t.integer "quantity"
# t.integer "unit_price"
# t.integer "tax"
# t.integer "amount"
# t.integer "total_amount"
# t.integer "paid"
# t.integer "due_amount"