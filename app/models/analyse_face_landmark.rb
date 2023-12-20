class AnalyseFaceLandmark < ApplicationRecord

  def center_of_mouth(mouth_up_y,mouth_down_y)
    mouth_up_y + (mouth_down_y - mouth_up_y)  * 0.30
  end

  def corner_of_mouth(center_of_mouth,mouth_left_y,mouth_right_y)
    if center_of_mouth > mouth_left_y or center_of_mouth > mouth_right_y
      return nil
    else
      return '口角チェック： 口角を上げましょう！'
    end
  end
end
