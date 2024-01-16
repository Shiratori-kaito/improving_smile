# frozen_string_literal: true

class AnalyseFaceEmotion < ApplicationRecord
  belongs_to :photo
  has_one :post, dependent: :destroy

  def emotion_data
    {
      '喜び' => happy,
      '悲しみ' => sad,
      '怒り' => angry,
      '驚き' => surprised,
      '落ち着き' => calm,
      '恐れ' => fear,
      '混乱' => confused,
      '嫌悪' => disgusted
    }
  end

  def score

    emotions = {
      # それぞれの感情の重みを設定して得点に反映する
      'happy' => 100.0 / 100,
      'surprised' => 3.0 / 4,
      'calm' => 2.0 / 3,
      'confused' => 1.0 / 6,
      'sad' => 1.0 / 8,
      'fear' => 1.0 / 10,
      'disgusted' => 1.0 / 12,
      'angry' => 1.0 / 12
    }

    emotions.each do |emotion, factor|
      value = send(emotion).to_i
      # 最初に半分の値を超えた感情を返す　また、max値が10000となっているため、100で割って、100点満点で表示する
      return (value / Settings.percent_scale * factor).round if value > Settings.half_of_max
    end

  
  end

  def max_score_emotion
    emotions = [
      { name: '喜び',  score: happy },
      { name: '悲しみ', score: sad },
      { name: '怒り',  score: angry },
      { name: '驚き',  score: surprised },
      { name: '落ち着き', score: calm },
      { name: '恐れ',  score: fear },
      { name: '混乱',  score: confused },
      { name: '嫌悪',  score: disgusted }
    ]
    max_emotion = emotions.max_by { |emotion| emotion[:score] }
    max_emotion_name = max_emotion[:name]
    return max_emotion_name
  end
end
