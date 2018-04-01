class Room < ApplicationRecord

  before_validation :set_default_associations, on: :create


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

  def reassign_exits
    update_attributes(nr:  Room.find(nr_id))  unless nr_id.nil?
    update_attributes(ner: Room.find(ner_id)) unless ner_id.nil?
    update_attributes(er:  Room.find(er_id))  unless er_id.nil?
    update_attributes(ser: Room.find(ser_id)) unless ser_id.nil?
    update_attributes(sr:  Room.find(sr_id))  unless sr_id.nil?
    update_attributes(swr: Room.find(swr_id)) unless swr_id.nil?
    update_attributes(wr:  Room.find(wr_id))  unless wr_id.nil?
    update_attributes(nwr: Room.find(nwr_id)) unless nwr_id.nil?
    update_attributes(ur:  Room.find(ur_id))  unless ur_id.nil?
    update_attributes(dr:  Room.find(dr_id))  unless dr_id.nil?
  end

  private

  def set_default_associations
    self.inventory = Inventory.new
  end

end
