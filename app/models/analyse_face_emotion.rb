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
      return (value / 100 * factor).round if value > 5000
    end

    30
  end
end
