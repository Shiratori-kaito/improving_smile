FactoryBot.define do
  factory :analyse_face_emotion do
    association :photo
    happy {10}
    sad {8000}
    angry {10}
    surprised {10}
    calm {10}
    fear {10}
    confused {10}
    disgusted {10}
    emotion_comment {'悲しい時は母ちゃんに電話しろい！'}
  end
end