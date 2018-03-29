require 'parslet'

module ChatoMud

  module Grammar

     class Parser < Parslet::Parser

      # Alphanumerical & Spaces
      rule(:spaces)  { match('\s').repeat(1) }
      rule(:spaces?) { spaces.maybe }

      rule(:letter) { match('[a-zA-z]') }
      rule(:word)   { letter.repeat(1) }

      rule(:digit)  { match('[0-9]') }
      rule(:digit_non_zero) { match('[1-9]') }
      rule(:number) { digit_non_zero >> digit.repeat }

      rule(:code) { letter >> (letter | str('_') | digit).repeat(1)}

      # command
      #######################################################
      root(:command)

      rule(:command) {
        direction |
        exits |
        scan | directed_scan |
        look_at | look_at_on_another | look_in | look_around |
        get_ground | get_container | drop | drop_all | put | give |
        empty_on_ground | empty_into_another |
        emoted_say | simple_say |
        kill | kill_incomplete |
        hit | hitonce |
        inventory |
        simple_emote |
        eat | drink |
        open_door | close_door |
        lock_door | unlock_door |
        open_item | close_item |
        lock_item | unlock_item |
        junk |
        simple_wear | directed_wear | remove |
        simplest_sheathe | simple_sheathe | directed_sheathe |
        simple_draw | draw |
        wield |
        load | unload |
        fire |
        aim | aim_simple |
        possess | release |
        grip |
        switch |
        set | set_stance |
        stand | simple_sit | sit | rest |
        tables |
        score | skills |
        combat | armor |
        time |
        stop |
        quit |
        mudstats |
        spawn_npc | simple_spawn_npc |
        spawn_item | simple_spawn_item
      }

      # emotes
      #######################################################
      rule(:emote) {
        (
          str('@') >> str('').as(:at) |
          ref.as(:ref) |
          spaces.as(:spaces) |
          emote_text.as(:emote_text)
        ).repeat(1).as(:emote)
      }

      rule(:bracketed_emote) {
        str('(') >> emote >> str(')')
      }

      rule(:emote_text) {
        (
          (str('*') | str('~') | str('@') | str('(') | str(')')).absent? >> 
          any
        ).repeat(1)
      }
      
      # emotes: refs
      #######################################################
      rule(:ref) {
        ref_character | ref_item
      }

      rule(:ref_character) {
        str('~').as(:type) >> kword.as(:target)
      }

      rule(:ref_item) {
        str('*').as(:type) >> kword.as(:target)
      }

      # emotes: kword
      #######################################################
      rule(:kword) {
        (number.as(:index) >> str('.')).maybe >> word.as(:word)
      }

      # speech
      #######################################################
      rule(:speech) {
        any.repeat(1).as(:speech)
      }

      # say & simple_say
      #######################################################
      rule(:emoted_say) {
        (spaces? >> say_c >> spaces? >> bracketed_emote >> spaces? >>  speech).as(:emoted_say)
      }

      rule(:simple_say) {
        (spaces? >> say_c >> spaces >> speech).as(:simple_say)
      }

      rule(:say_c) {
        str('say') | str('sa')
      }

      # mudstats
      #######################################################
      rule(:mudstats) {
        spaces? >> mudstats_c >> spaces? >> str('').as(:mudstats)
      }

      rule(:mudstats_c) {
        str('mudstats') | str('mudstat') | str('mudsta') | str('mudst') | str('muds') | str('mud')
      }

      # eat
      #######################################################
      rule(:eat) {
        (spaces? >> eat_c >> spaces >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> (spaces >> number.as(:amount)).maybe >> spaces?).as(:eat)
      }

      rule(:eat_c) {
        str('eat')
      }

      # drink
      #######################################################
      rule(:drink) {
        (spaces? >> drink_c >> spaces >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> (spaces >> number.as(:amount)).maybe >> spaces?).as(:drink)
      }

      rule(:drink_c) {
        str('drink') | str('drin') | str('dri')
      }

      # junk
      #######################################################
      rule(:junk) {
        (spaces? >> junk_c >> spaces >> kword.as(:target) >> spaces?).as(:junk)
      }

      rule(:junk_c) {
        str('junk')
      }

      # simple_wear & directed_wear
      #######################################################
      rule(:simple_wear) {
        (spaces? >> wear_c >> spaces >> kword.as(:target) >> spaces?).as(:simple_wear)
      }

      rule(:directed_wear) {
        (spaces? >> wear_c >> spaces >> kword.as(:target) >> spaces >> word.as(:slot) >> spaces?).as(:directed_wear)
      }

      rule(:wear_c) {
        str('wear') | str('wea')
      }

      # simplest_sheathe & simple_sheathe & directed_sheathe
      #######################################################
      rule(:simplest_sheathe) {
        spaces? >> sheathe_c >> spaces? >> str('').as(:simplest_sheathe)
      }

      rule(:simple_sheathe) {
        (spaces? >> sheathe_c >> spaces >> kword.as(:target) >> spaces?).as(:simple_sheathe)
      }

      rule(:directed_sheathe) {
        (spaces? >> sheathe_c >> spaces >> kword.as(:target) >> spaces >> kword.as(:sheath) >> spaces?).as(:directed_sheathe)
      }

      rule(:sheathe_c) {
        str('sheathe') | str('sheath') | str('sheat') | str('shea') | str('she') | str('sh')
      }

      # simple_draw & draw
      #######################################################
      rule(:simple_draw) {
        spaces? >> draw_c >> spaces? >> str('').as(:simple_draw)
      }

      rule(:draw) {
        (spaces? >> draw_c >> spaces >> kword.as(:target) >> spaces?).as(:draw)
      }

      rule(:draw_c) {
        str('draw') | str('dra')
      }

      # wield
      #######################################################
      rule(:wield) {
        (spaces? >> wield_c >> spaces >> kword.as(:target) >> spaces?).as(:wield)
      }

      rule(:wield_c) {
        str('wield') | str('wiel') | str('wie') | str('wi')
      }

      # TODO add directed_load i.e. the ability to choose the missile.
      # load
      #######################################################
      rule(:load) {
        spaces? >> load_c >> spaces? >> str('').as(:load)
      }

      rule(:load_c) {
        str('load') | str('loa')
      }

      # fire
      #######################################################
      rule(:fire) {
        spaces? >> fire_c >> spaces? >> str('').as(:fire)
      }

      rule(:fire_c) {
        str('fire') | str('fir') | str('fi')
      }

      # unload
      #######################################################
      rule(:unload) {
        spaces? >> unload_c >> spaces? >> str('').as(:unload)
      }

      rule(:unload_c) {
        str('unload') | str('unloa')
      }

      # aim & aim_simple
      #######################################################
      rule(:aim) {
        (spaces? >> aim_c >> spaces >> (northeast_c | northwest_c | southeast_c | southwest_c | north_c | east_c | south_c | west_c | up_c | down_c).as(:direction) >> spaces >> kword.as(:target) >> spaces?).as(:aim)
      }

      rule(:aim_simple) {
        (spaces? >> aim_c >> spaces >> kword.as(:target) >> spaces?).as(:aim_simple)
      }

      rule(:aim_c) {
        str('aim') | str('ai')
      }

      # grip
      #######################################################
      rule(:grip) {
        spaces? >> grip_c >> spaces? >> str('').as(:grip)
      }

      rule(:grip_c) {
        str('grip') | str('gri') | str('gr')
      }

      # switch
      #######################################################
      rule(:switch) {
        spaces? >> switch_c >> spaces? >> str('').as(:switch)
      }

      rule(:switch_c) {
        str('switch') | str('switc') | str('swit') | str('swi')
      }

      # set & set_stance
      #######################################################
      rule(:set) {
        spaces? >> set_c >> spaces? >> str('').as(:set)
      }

      rule(:set_stance) {
        (spaces? >> set_c >> spaces >> stance >> spaces >> word.as(:stance) >> spaces?).as(:set_stance)
      }

      rule(:set_c) {
        str('set') | str('se')
      }

      rule(:stance) {
        str('stance') | str('stanc') | str('stan') | str('sta') | str('st') | str('s')
      }

      # sit
      #######################################################
      rule(:simple_sit) {
        spaces? >> sit_c >> spaces? >> str('').as(:simple_sit)
      }

      rule(:sit) {
        (spaces? >> sit_c >> spaces >> kword.as(:target) >> spaces?).as(:sit)
      }

      rule(:sit_c) {
        str('sit') | str('si')
      }

      # tables
      #######################################################
      rule(:tables) {
        spaces? >> tables_c >> spaces? >> str('').as(:tables)
      }

      rule(:tables_c) {
        str('tables') | str('table') | str('tabl') | str('tab') | str('ta') | str('t')
      }

      # stand
      #######################################################
      rule(:stand) {
        spaces? >> stand_c >> spaces? >> str('').as(:stand)
      }

      rule(:stand_c) {
        str('stand') | str('stan') | str('sta')
      }

      # rest
      #######################################################
      rule(:rest) {
        spaces? >> rest_c >> spaces? >> str('').as(:rest)
      }

      rule(:rest_c) {
        str('rest') | str('res')
      }

      # score
      #######################################################
      rule(:score) {
        spaces? >> score_c >> spaces? >> str('').as(:score)
      }

      rule(:score_c) {
        str('score') | str('scor') | str('sco') | str('sc')
      }

      # skills
      #######################################################
      rule(:skills) {
        spaces? >> skills_c >> spaces? >> str('').as(:skills)
      }

      rule(:skills_c) {
        str('skills') | str('skill') | str('skil') | str('ski') | str('sk')
      }

      # combat
      #######################################################
      rule(:combat) {
        spaces? >> combat_c >> spaces? >> str('').as(:combat)
      }

      rule(:combat_c) {
        str('combat') | str('comba') | str('comb') | str('com') | str('co')
      }

      # armor
      #######################################################
      rule(:armor) {
        spaces? >> armor_c >> spaces? >> str('').as(:armor)
      }

      rule(:armor_c) {
        str('armor') | str('armo') | str('arm') | str('ar')
      }

      # time
      #######################################################
      rule(:time) {
        spaces? >> time_c >> spaces? >> str('').as(:time)
      }

      rule(:time_c) {
        str('time') | str('tim') | str('ti')
      }

      # quit
      #######################################################
      rule(:quit) {
        spaces? >> quit_c >> spaces? >> str('').as(:quit)
      }

      rule(:quit_c) {
        str('quit') | str('qui') | str('qu') | str('q')
      }

      # remove
      #######################################################
      rule(:remove) {
        (spaces? >> remove_c >> spaces >> kword.as(:target) >> spaces?).as(:remove)
      }

      rule(:remove_c) {
        str('remove') | str('remov') | str('remo') | str('rem') | str('re') | str('r')
      }

      # inventory
      #######################################################
      rule(:inventory) {
        spaces? >> inventory_c >> spaces? >> str('').as(:inventory)
      }

      rule(:inventory_c) {
        str('inventory') | str('inventor') | str('invento') | str('invent') | str('inven') | str('inve') | str('inv') | str('in') | str('i')
      }

      # spawn_npc & simple_spawn_npc
      #######################################################
      rule(:spawn_npc) {
        (spaces? >> spawn_npc_c >> spaces >> code.as(:npc_template_code) >> spaces >> code.as(:character_outfitter_code) >> spaces?).as(:spawn_npc)
      }

      rule(:simple_spawn_npc) {
        (spaces? >> spawn_npc_c >> spaces >> code.as(:npc_template_code) >> spaces?).as(:simple_spawn_npc)
      }

      rule(:spawn_npc_c) {
        str('spawn_npc') | str('spawn_np') | str('spawn_n')
      }

      # spawn_item & simple_spawn_item
      #######################################################
      rule(:spawn_item) {
        (spaces? >> spawn_item_c >> spaces >> code.as(:item_template_code) >> spaces >> code.as(:item_outfitter_code) >> spaces?).as(:spawn_item)
      }

      rule(:simple_spawn_item) {
        (spaces? >> spawn_item_c >> spaces >> code.as(:item_template_code) >> spaces?).as(:simple_spawn_item)
      }

      rule(:spawn_item_c) {
        str('spawn_item') | str('spawn_ite') | str('spawn_it') | str('spawn_i')
      }

      # shutdown
      #######################################################
      rule(:shutdown) {
        spaces? >> shutdown_c >> spaces? >> str('').as(:shutdown)
      }

      rule(:shutdown_c) {
        str('shutdown')
      }

      # hit
      #######################################################
      rule(:hit) {
        (spaces? >> hit_c >> spaces >> kword.as(:target) >> spaces?).as(:hit)
      }

      rule(:hit_c) {
        str('hit') | str('hi') | str('h')
      }

      # hitonce - DEBUG
      #######################################################
      rule(:hitonce) {
        (spaces? >> hitonce_c >> spaces >> kword.as(:target) >> spaces?).as(:hit_once)
      }

      rule(:hitonce_c) {
        str('hitonce') | str('hitonc') | str('hiton') | str('hito')
      }

      # stop
      #######################################################
      rule(:stop) {
        spaces? >> stop_c >> spaces? >> str('').as(:stop)
      }

      rule(:stop_c) {
        str('stop') | str('sto') | str('st')
      }

      # kill
      #######################################################
      rule(:kill) {
        (spaces? >> kill_c >> spaces >> kword.as(:target) >> spaces?).as(:kill)
      }

      rule(:kill_c) {
        str('kill')
      }

      # kill_incomplete
      #######################################################
      rule(:kill_incomplete) {
        (spaces? >> kill_incomplete_c >> spaces >> kword.as(:target) >> spaces?).as(:kill_incomplete)
      }

      rule(:kill_incomplete_c) {
        str('kil') | str('ki') | str('k')
      }

      # open door
      #######################################################
      rule(:open_door) {
        (spaces? >> open_c >> spaces >> (northeast_c | northwest_c | southeast_c | southwest_c | north_c | east_c | south_c | west_c | up_c | down_c).as(:direction) >> spaces?).as(:open_door)
      }

      rule(:open_c) {
        str('open') | str('ope') | str('op') | str('o')
      }

      # close door
      #######################################################
      rule(:close_door) {
        (spaces? >> close_c >> spaces >> (northeast_c | northwest_c | southeast_c | southwest_c | north_c | east_c | south_c | west_c | up_c | down_c).as(:direction) >> spaces?).as(:close_door)
      }

      rule(:close_c) {
        str('close') | str('clos') | str('clo') | str('cl') | str('c')
      }

      # lock door
      #######################################################
      rule(:lock_door) {
        (spaces? >> lock_c >> spaces >> (northeast_c | northwest_c | southeast_c | southwest_c | north_c | east_c | south_c | west_c | up_c | down_c).as(:direction) >> spaces?).as(:lock_door)
      }

      rule(:lock_c) {
        str('lock') | str('loc')
      }

      # unlock door
      #######################################################
      rule(:unlock_door) {
        (spaces? >> unlock_c >> spaces >> (northeast_c | northwest_c | southeast_c | southwest_c | north_c | east_c | south_c | west_c | up_c | down_c).as(:direction) >> spaces?).as(:unlock_door)
      }

      rule(:unlock_c) {
        str('unlock') | str('unloc') | str('unlo') | str('unl')
      }

      # open item
      #######################################################
      rule(:open_item) {
        (spaces? >> open_c >> spaces >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> spaces?).as(:open_item)
      }

      # close item
      #######################################################
      rule(:close_item) {
        (spaces? >> close_c >> spaces >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> spaces?).as(:close_item)
      }

      # lock item
      #######################################################
      rule(:lock_item) {
        (spaces? >> lock_c >> spaces >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> spaces?).as(:lock_item)
      }

      # unlock item
      #######################################################
      rule(:unlock_item) {
        (spaces? >> unlock_c >> spaces >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> spaces?).as(:unlock_item)
      }

      # possess
      #######################################################
      rule(:possess) {
        (spaces? >> possess_c >> spaces >> kword.as(:target) >> spaces?).as(:possess)
      }

      rule(:possess_c) {
        str('possess') | str('posses') | str('posse') | str('poss') | str('pos') | str('po')
      }

      # release
      #######################################################
      rule(:release) {
        spaces? >> release_c >> spaces? >> str('').as(:release)
      }

      rule(:release_c) {
        str('release') | str('releas') | str('relea') | str('rele') | str('rel')
      }

      # directions
      #######################################################
      rule(:direction) {
        spaces? >> (northeast | northwest | southeast | southwest | north | east | south | west |  up | down).as(:direction) >> spaces?
      }

      rule(:north) {
        north_c.as(:towards) >> bracketed_emote.maybe >> spaces?
      }

      rule(:northeast) {
        northeast_c.as(:towards) >> bracketed_emote.maybe >> spaces?
      }

      rule(:east) {
        east_c.as(:towards) >> spaces? >> bracketed_emote.maybe >> spaces?
      }

      rule(:southeast) {
        southeast_c.as(:towards) >> bracketed_emote.maybe >> spaces?
      }

      rule(:south) {
        south_c.as(:towards) >> spaces? >> bracketed_emote.maybe >> spaces?
      }

      rule(:southwest) {
        southwest_c.as(:towards) >> bracketed_emote.maybe >> spaces?
      }

      rule(:west) {
        west_c.as(:towards) >> spaces? >> bracketed_emote.maybe >> spaces?
      }

      rule(:northwest) {
        northwest_c.as(:towards) >> bracketed_emote.maybe >> spaces?
      }

      rule(:up) {
        up_c.as(:towards) >> spaces? >> bracketed_emote.maybe >> spaces?
      }

      rule(:down) {
        down_c.as(:towards) >> spaces? >> bracketed_emote.maybe >> spaces?
      }

      rule(:north_c) {
        (str('north') | str('nort') | str('nor') | str('no') | str('n')) >> str('').as(:north)
      }

      rule(:northeast_c) {
        (str('northeast') | str('northeas') | str('northea') | str('northe') | str('ne')) >> str('').as(:north)
      }

      rule(:east_c) {
        (str('east') | str('eas') | str('ea') | str('e')) >> str('').as(:east)
      }

      rule(:southeast_c) {
        (str('southeast') | str('southeas') | str('southea') | str('southe') | str('se')) >> str('').as(:north)
      }

      rule(:south_c) {
        (str('south') | str('sout') | str('sou') | str('so') | str('s')) >> str('').as(:south)
      }

      rule(:southwest_c) {
        (str('southwest') | str('southwes') | str('southwe') | str('southw') | str('sw')) >> str('').as(:north)
      }

      rule(:west_c) {
        (str('west') | str('wes') | str('we') | str('w')) >> str('').as(:west)
      }

      rule(:northwest_c) {
        (str('northwest') | str('northwes') | str('northwe') | str('northw') | str('nw')) >> str('').as(:north)
      }

      rule(:up_c) {
        (str('up') | str('u')) >> str('').as(:up)
      }

      rule(:down_c) {
        (str('down') | str('dow') | str('do') | str('d')) >> str('').as(:down)
      }

      # exits
      #######################################################
      rule(:exits) {
        spaces? >> exits_c >> spaces? >> str('').as(:exits)
      }

      rule(:exits_c) {
        str('exits') | str('exit') | str('exi') | str('ex')
      }

      # scan & directed_scan
      #######################################################
      rule(:scan) {
        spaces? >> scan_c >> spaces? >> str('').as(:scan)
      }

      rule(:directed_scan) {
        (spaces? >> scan_c >> spaces >> (northeast_c | northwest_c | southeast_c | southwest_c | north_c | east_c | south_c | west_c | up_c | down_c).as(:direction) >> spaces?).as(:directed_scan)
      }

      rule(:scan_c) {
        str('scan') | str('sca')
      }

      # simple_emote
      #######################################################
      rule(:simple_emote) {
        spaces? >>
        simple_emote_c >>
        spaces >>
        emote.as(:simple_emote) >>
        spaces?
      }

      rule(:simple_emote_c) {
        str('emote') | str('emot') | str('emo') | str('em') | str(',')
      }

      # look
      #######################################################
      rule(:look_around) {
        spaces? >> look_c >> str('').as(:look_around) >> spaces?
      }

      rule(:look_at) {
        (spaces? >> look_c >> spaces >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> spaces?).as(:look_at)
      }

      rule(:look_at_on_another) {
        (spaces? >> look_c >> spaces >> kword.as(:character) >> spaces >> kword.as(:target) >> spaces?).as(:look_at_on_another)
      }

      rule(:look_in) {
        (spaces? >> look_c >> spaces? >> str('.') >> spaces? >> kword.as(:target) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> spaces?).as(:look_in)
      }

      rule(:look_c) {
        str('look') | str('loo') | str('lo') | str('l')
      }

      # get
      #######################################################
      rule(:get_ground) {
        (spaces? >> get_c >> spaces >> (number.as(:amount) >> spaces).maybe >> kword.as(:target) >> spaces?).as(:get_ground)
      }

      rule(:get_container) {
        (spaces? >> get_c >> spaces >> (number.as(:amount) >> spaces).maybe >> kword.as(:target) >> spaces >> kword.as(:source) >> spaces?).as(:get_container)
      }

      rule(:get_c) {
        str('get') | str('ge') | str('g')
      }

      # drop_all
      #######################################################
      rule(:drop_all) {
        spaces? >> drop_c >> spaces >> str('*') >> spaces? >> str('').as(:drop_all)
      }

      # drop
      #######################################################
      rule(:drop) {
        (spaces? >> drop_c >> spaces >> (number.as(:amount) >> spaces).maybe >> kword.as(:target) >> spaces?).as(:drop)
      }

      rule(:drop_c) {
        str('drop') | str('dro') | str('dr')
      }

      # give
      #######################################################
      rule(:give) {
        (spaces? >> give_c >> spaces >> (number.as(:amount) >> spaces).maybe >> kword.as(:target) >> spaces? >> kword.as(:receiver) >> spaces?).as(:give)
      }

      rule(:give_c) {
        str('give') | str('giv') | str('gi') | str('g')
      }

      # put
      #######################################################
      rule(:put) {
        (spaces? >> put_c >> spaces >> (number.as(:amount) >> spaces).maybe >> kword.as(:target) >> spaces >> kword.as(:destination) >> (spaces? >> str('.') >> str('').as(:ground)).maybe >> spaces?).as(:put)
      }

      rule(:put_c) {
        str('put') | str('pu') | str('p')
      }

      # empty
      #######################################################
      rule(:empty_on_ground) {
        (spaces? >> empty_c >> spaces >> kword.as(:target) >> spaces?).as(:empty_on_ground)
      }

      rule(:empty_into_another) {
        (spaces? >> empty_c >> spaces >> kword.as(:target) >> spaces >> kword.as(:destination) >> spaces?).as(:empty_into_another)
      }

      rule(:empty_c) {
        str('empty') | str('empt') | str('emp')
      }

    end
  end
end
