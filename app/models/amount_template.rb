class AmountTemplate < ApplicationRecord
  enum fluid: [:water, :wine, :beer, :oil]

  belongs_to :stackable, class_name: 'ItemTemplate', optional: true

  belongs_to :edible, class_name: 'ItemTemplate', optional: true

  belongs_to :drinkable, class_name: 'ItemTemplate', optional: true
end
