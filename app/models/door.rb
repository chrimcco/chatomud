class Door < ApplicationRecord

  has_one :nr,  class_name: 'Room', foreign_key: 'sd_id'

  has_one :ner, class_name: 'Room', foreign_key: 'swd_id'

  has_one :er,  class_name: 'Room', foreign_key: 'wd_id'

  has_one :ser, class_name: 'Room', foreign_key: 'nwd_id'
  
  has_one :sr,  class_name: 'Room', foreign_key: 'nd_id'

  has_one :swr, class_name: 'Room', foreign_key: 'ned_id'
  
  has_one :wr,  class_name: 'Room', foreign_key: 'ed_id'

  has_one :nwr, class_name: 'Room', foreign_key: 'sed_id'
  
  has_one :ur,  class_name: 'Room', foreign_key: 'dd_id'

  has_one :dr,  class_name: 'Room', foreign_key: 'ud_id'

  has_one :lock, as: :parent, dependent: :destroy, inverse_of: :parent


  validates :short_desc, :long_desc, :full_desc, presence: true

  validates_inclusion_of :open, in: [true, false]

  validates_inclusion_of :see_through, in: [true, false]

end
