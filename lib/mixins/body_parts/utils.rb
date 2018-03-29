module ChatoMud

  module Mixins

    module BodyParts

      module Utils

          def body_part_description(body_part)
            return case body_part
              when :head
                "the head"
              when :face
                "the face"
              when :leye
                "the left eye"
              when :reye
                "the right eye"
              when :neck
                "the neck"
              when :lshoulder
                "the left shoulder"
              when :rshoulder
                "the right shoulder"
              when :larm
                "the left arm"
              when :rarm
                "the right arm"
              when :lelbow
                "the left elbow"
              when :relbow
                "the right elbow"
              when :lforearm
                "the left forearm"
              when :rforearm
                "the right forearm"
              when :lwrist
                "the left wrist"
              when :rwrist
                "the right wrist"
              when :lhand
                "the left hand"
              when :rhand
                "the right hand"
              when :chest
                "the chest"
              when :abdomen
                "the abdomen"
              when :lside
                "the left side"
              when :rside
                "the right side"
              when :back
                "the back"
              when :groin
                "the groin"
              when :lhip
                "the left hip"
              when :rhip
                "the right hip"
              when :lthigh
                "the left thigh"
              when :rthigh
                "the right thigh"
              when :lknee
                "the left knee"
              when :rknee
                "the right knee"
              when :lshin
                "the left shin"
              when :rshin
                "the right shing"
              when :lankle
                "the left ankle"
              when :rankle
                "the right ankle"
              when :lfoot
                "the left foot"
              when :rfoot
                "the right foot"
              else
                raise "unknown body location '#{body_part}'"
            end
          end

      end

    end

  end

end
