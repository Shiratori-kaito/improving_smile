FactoryBot.define do
  factory :post do
    analyse_face_detail_id {1}
    analyse_face_emotion_id {1}
    photo_id {1}
    association :user, factory: :user
    blur {false}

    created_at {Time.zone.now}
    updated_at {Time.zone.now}
  end
end
