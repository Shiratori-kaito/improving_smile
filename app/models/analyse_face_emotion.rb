class AnalyseFaceEmotion < ApplicationRecord
  belongs_to :photo
  has_one :post

  def emotion_data
    {
      "喜び" => happy,
      "悲しみ" => sad,
      "怒り" => angry,
      "驚き" => surprised,
      "落ち着き" => calm,
      "恐れ" => fear,
      "混乱" => confused,
      "嫌悪" => disgusted
    }
  end

  def score
    if happy.to_i > 5000
      happy.to_i / 100
    elsif surprised.to_i > 5000
      (surprised.to_i / 100) * 3 / 4
    elsif calm.to_i > 5000
      (calm.to_i / 100) * 2 / 3
    elsif confused.to_i > 5000
      (confused.to_i / 100) * 1 / 6
    elsif fear.to_i > 5000
      (fear.to_i / 100) * 1 / 10
    elsif disgusted.to_i > 5000
      (disgusted.to_i / 100) * 1 / 12
    elsif angry.to_i > 5000
      (angry.to_i / 100) * 1 / 12
    else
      10
    end
  end
end
