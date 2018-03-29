class Room < ApplicationRecord

  has_one :nr,  class_name: 'Room', foreign_key: 'sr_id',  inverse_of: :sr

  has_one :ner, class_name: 'Room', foreign_key: 'swr_id', inverse_of: :swr

  has_one :er,  class_name: 'Room', foreign_key: 'wr_id',  inverse_of: :wr

  has_one :ser, class_name: 'Room', foreign_key: 'nwr_id', inverse_of: :nwr
  
  has_one :sr,  class_name: 'Room', foreign_key: 'nr_id',  inverse_of: :nr
  
  has_one :swr, class_name: 'Room', foreign_key: 'ner_id', inverse_of: :ner

  has_one :wr,  class_name: 'Room', foreign_key: 'er_id',  inverse_of: :er

  has_one :nwr, class_name: 'Room', foreign_key: 'ser_id', inverse_of: :ser
  
  has_one :ur,  class_name: 'Room', foreign_key: 'dr_id',  inverse_of: :dr

  has_one :dr,  class_name: 'Room', foreign_key: 'ur_id',  inverse_of: :ur


  has_one :nd,  class_name: 'Door', foreign_key: 'sr_id',  inverse_of: :sr

  has_one :ned, class_name: 'Door', foreign_key: 'swr_id', inverse_of: :swr

  has_one :ed,  class_name: 'Door', foreign_key: 'wr_id',  inverse_of: :wr

  has_one :sed, class_name: 'Door', foreign_key: 'nwr_id', inverse_of: :nwr
  
  has_one :sd,  class_name: 'Door', foreign_key: 'nr_id',  inverse_of: :nr
  
  has_one :swd, class_name: 'Door', foreign_key: 'ner_id', inverse_of: :ner

  has_one :wd,  class_name: 'Door', foreign_key: 'er_id',  inverse_of: :er

  has_one :nwd, class_name: 'Door', foreign_key: 'ser_id', inverse_of: :ser
  
  has_one :ud,  class_name: 'Door', foreign_key: 'dr_id',  inverse_of: :dr

  has_one :dd,  class_name: 'Door', foreign_key: 'ur_id',  inverse_of: :ur


  has_many :characters

  has_many :furnitures

  has_one :inventory, as: :parent, dependent: :destroy, inverse_of: :parent

end
