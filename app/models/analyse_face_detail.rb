class AnalyseFaceDetail < ApplicationRecord
  belongs_to :photo
  has_one :post


  def eye_direction_pitch_description
    if eye_direction_pitch > 10
      "上"
    elsif eye_direction_pitch < -10
      "下"
    else
      "正面"
    end
  end

  def eye_direction_yaw_description
    if eye_direction_yaw > 10
      "右"
    elsif eye_direction_yaw < -10
      "左"
    else
      "正面"
    end
  end

  def eye_open_judge
    if eye_open === 1
      "◎"
    else
      " もう少し目を開けましょう！"
    end
  end

  def age_range
    "#{agerange_low} ~ #{agerange_high}"
  end

  def mouth_open_judge
    if mouth_open === 1
      "開"
    else
      "閉"
    end
  end

end
