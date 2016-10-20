class Item < ActiveRecord::Base
  validates :price, { numericality: { greater_than: 0, allow_nil: true } }
  validates :name, :description, presence: true


  belongs_to :category

  # after_initialize  { puts 'initialized' } # Item2.new; Item2.first
  # after_save        { puts 'saved' } # Item2.save; Item2.create; item.update_attributes()
  #
  # after_create      { category.inc(:items_count, 1) }
  #
  # after_create      { ItemMailer.new_item_created(self).deliver }
  # after_update      { }
  # after_destroy     { category.inc(:items_count, -1) } # Item2.destroy



end
