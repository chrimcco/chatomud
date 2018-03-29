require 'require_all'

require 'socket'

require 'logger_factory'

require 'handlers/rooms_handler'
require 'handlers/items_handler'
require 'handlers/furnitures_handler'
require 'handlers/doors_handler'
require 'handlers/entities_handler'
require 'handlers/characters_handler'

require 'spawners/characters_spawner'
require 'spawners/items_spawner'
require 'spawners/wounds_spawner'

require 'spawners/factories/characters_factory'
require 'spawners/factories/skill_sets_factory'
require 'spawners/factories/attribute_sets_factory'
require 'spawners/factories/items_factory'
require 'spawners/factories/weapon_stats_factory'
require 'spawners/factories/melee_stats_factory'
require 'spawners/factories/ranged_stats_factory'
require 'spawners/factories/missile_stats_factory'
require 'spawners/factories/armor_stats_factory'
require 'spawners/factories/shield_stats_factory'
require 'spawners/factories/inventories_factory'
require 'spawners/factories/lids_factory'
require 'spawners/factories/locks_factory'

require 'spawners/outfitters/characters_outfitter'
require 'spawners/outfitters/items_outfitter'

require 'referrers/attribute_bonus_referrer'
require 'referrers/category_rank_referrer'
require 'referrers/rank_referrer'
require 'referrers/skill_category_referrer'
require 'referrers/skill_referrer'
require 'referrers/protection_referrer'
require 'referrers/attack_referrer'

require 'timers/timers_assistant'

require 'cm_socket'

module ChatoMud

  log = nil

  class Server

    # TODO group handlers, spawners, factories, outfitters & referrers separately under
    # handlers_assistant, spawners_assistant, etc.
    attr_reader :rooms_handler
    attr_reader :items_handler
    attr_reader :furnitures_handler
    attr_reader :doors_handler
    attr_reader :entities_handler
    attr_reader :characters_handler

    attr_reader :characters_spawner
    attr_reader :items_spawner
    attr_reader :wounds_spawner

    attr_reader :characters_factory
    attr_reader :attribute_sets_factory
    attr_reader :skill_sets_factory
    attr_reader :items_factory
    attr_reader :weapon_stats_factory
    attr_reader :melee_stats_factory
    attr_reader :ranged_stats_factory
    attr_reader :missile_stats_factory
    attr_reader :armor_stats_factory
    attr_reader :shield_stats_factory
    attr_reader :inventories_factory
    attr_reader :lids_factory
    attr_reader :locks_factory

    attr_reader :characters_outfitter
    attr_reader :items_outfitter

    attr_reader :attribute_bonus_referrer
    attr_reader :category_rank_referrer
    attr_reader :rank_referrer
    attr_reader :skill_category_referrer
    attr_reader :skill_referrer
    attr_reader :protection_referrer
    attr_reader :attack_referrer

    attr_reader :timers_assistant

    def initialize
      log = LoggerFactory.create_mud_server_logger
      log.info("ChatoMud listening port 1234.")
      log.info("Environment: #{Rails.env.to_s}".red)
      @server_socket = TCPServer.new(1234)
      initialize_referrers
      initialize_handlers
      initialize_spawners
      initialize_factories
      initialize_outfitters
      initialize_timers_assistant
    end

    def listen
      log.info("ChatoMud listening now.")
      loop do
        begin
          player_socket = @server_socket.accept.extend CMSocket
        rescue IOError
          log.info("ChatoMud server stopped listening.")
          return
        end
        @entities_handler.add_player_controller(player_socket)
      end
    end

    def bye
      terminate_handlers
      terminate_timers_assistant
      @server_socket.close
      log.info("ChatoMud server shutdown.")
      Thread.current.terminate
    end

    private

    def initialize_handlers
      log.info("Instantiating handlers.")
      @rooms_handler = Handlers::RoomsHandler.new(self)
      @items_handler = Handlers::ItemsHandler.new(self)
      @furnitures_handler = Handlers::FurnituresHandler.new(self)
      @doors_handler = Handlers::DoorsHandler.new(self)
      @entities_handler = Handlers::EntitiesHandler.new(self)
      @characters_handler = Handlers::CharactersHandler.new(self)
      
      @rooms_handler.load_rooms
      @doors_handler.load_doors
      @entities_handler.load_bots
    end

    def initialize_spawners
      @characters_spawner = Spawners::CharactersSpawner.new(self)
      @items_spawner = Spawners::ItemsSpawner.new(self)
      @wounds_spawner = Spawners::WoundsSpawner.new(self)
    end

    def initialize_factories
      log.info("Initializing factories.")
      @characters_factory = Spawners::Factories::CharactersFactory.new(self)
      @attribute_sets_factory = Spawners::Factories::AttributeSetsFactory.new(self)
      @skill_sets_factory = Spawners::Factories::SkillSetsFactory.new(self)
      @items_factory = Spawners::Factories::ItemsFactory.new(self)
      @weapon_stats_factory = Spawners::Factories::WeaponStatsFactory.new(self)
      @melee_stats_factory = Spawners::Factories::MeleeStatsFactory.new(self)
      @ranged_stats_factory = Spawners::Factories::RangedStatsFactory.new(self)
      @missile_stats_factory = Spawners::Factories::MissileStatsFactory.new(self)
      @armor_stats_factory = Spawners::Factories::ArmorStatsFactory.new(self)
      @shield_stats_factory = Spawners::Factories::ShieldStatsFactory.new(self)
      @inventories_factory = Spawners::Factories::InventoriesFactory.new(self)
      @lids_factory = Spawners::Factories::LidsFactory.new(self)
      @locks_factory = Spawners::Factories::LocksFactory.new(self)
    end

    def initialize_outfitters
      log.info("Initializing outfitters.")
      @characters_outfitter = Spawners::Outfitters::CharactersOutfitter.new(self)
      @items_outfitter = Spawners::Outfitters::ItemsOutfitter.new(self)
    end

    def initialize_referrers
      @attribute_bonus_referrer = Referrers::AttributeBonusReferrer.new
      @category_rank_referrer = Referrers::CategoryRankReferrer.new
      @rank_referrer = Referrers::RankReferrer.new
      @skill_category_referrer = Referrers::SkillCategoryReferrer.new
      @skill_referrer = Referrers::SkillReferrer.new
      @protection_referrer = Referrers::ProtectionReferrer.new
      @attack_referrer = Referrers::AttackReferrer.new
    end

    def initialize_timers_assistant
      @timers_assistant = Timers::TimersAssistant.new(self)
    end

    def terminate_handlers
      @rooms_handler.bye
      @items_handler.bye
      @furnitures_handler.bye
      @doors_handler.bye
      @entities_handler.bye
      @characters_handler.bye
    end

    def terminate_timers_assistant
      @timers_assistant.bye
    end

  end

end