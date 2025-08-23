class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :state_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
    validates :state_id, numericality: {other_than: 0}
    validates :city
    validates :street
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'is invalid. Input only 10 or 11 digit numbers'} 
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, state_id: state_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end