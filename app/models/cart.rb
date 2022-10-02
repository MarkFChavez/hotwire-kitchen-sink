class Cart < ApplicationRecord

  validates :identifier, presence: true, uniqueness: true

  has_many :line_items

  def add(product)
    line_item = line_items.find_by(product: product)

    if line_item
      line_item.increment!(:quantity)
    else
      line_items.create(product: product)
    end
  end

  def remove(product)
    line_item = line_items.find_by(product: product)
    return if line_item.nil?

    if line_item.quantity <= 1
      line_item.destroy
    else
      line_item.decrement!(:quantity)
    end
  end

  def total_price
    line_items.sum(&:subtotal)
  end

end
