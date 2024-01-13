FactoryBot.define do
  factory :analyse_face_detail do
    association :photo  # photo_idのために関連するphotoファクトリが必要です
    smile { rand(0..100) }  # 例: 0から100の範囲でランダムな値
    sunglass { [true, false].sample }  # ランダムな真偽値
    eye_open { rand(0..100) }
    mouth_open { rand(0..100) }
    eye_direction_yaw { rand(-90..90) }
    eye_direction_pitch { rand(-90..90) }
    agerange_low { rand(1..100).to_s }
    agerange_high { rand(1..100).to_s }
  end
end