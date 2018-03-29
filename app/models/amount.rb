class Amount < ApplicationRecord

  enum fluid: [:water, :wine, :beer, :oil]

  belongs_to :stackable, class_name: 'Item', optional: true

  belongs_to :edible, class_name: 'Item', optional: true

  belongs_to :drinkable, class_name: 'Item', optional: true

end
