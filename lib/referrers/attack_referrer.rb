module ChatoMud

  module Referrers

    class AttackReferrer

      def find(skill, roll, against)
        roll = 150 if roll > 150
        roll = 105 if roll > 105 && skill == :brawl # remove this once 'improvised weapons' are introduced
        Attack.where(against: against, skill: skill).where("score_limit >= ?", roll).last
      end

      def maximum_miss_score(skill, against)
        Attack.where(against: against, skill: skill, connects: false).order(score_limit: :desc)[0].score_limit
      end

    end

  end

end
