# frozen_string_literal: true

module PhotosHelper
  def extra_comment(analyse_face_emotion)
    emotion_params = {
      happy: analyse_face_emotion.happy,
      sad: analyse_face_emotion.sad,
      angry: analyse_face_emotion.angry,
      surprised: analyse_face_emotion.surprised,
      calm: analyse_face_emotion.calm,
      fear: analyse_face_emotion.fear,
      confused: analyse_face_emotion.confused,
      disgusted: analyse_face_emotion.disgusted
    }

    emotions = {
      happy: '笑顔が眩しすぎて見えねえ！',
      sad: '悲しい時は母ちゃんに電話しろい！',
      angry: 'GEKIOKO。',
      surprised: '部屋に虫でもいたの？',
      calm: 'サウナで整い中？',
      fear: '上司に呼び出された？？一緒についていくよ！',
      confused: 'モヤモヤするときは思いっきり叫ぶんだ！',
      disgusted: '何か気に入らないことがあったのかな？'
    }

    conbined_emotions = {
      happy_sad: '君の笑顔の裏には深い感情があるんだね。',
      happy_angry: 'エネルギッシュだけど、少し刺激的な一日だったかな？',
      happy_surprised: '何かうれしいサプライズがあったのかな？',
      happy_fear: '楽しいことと同時に何か心配事もあるのかな？',
      happy_confused: '楽しんでいるけど、同時に何か考え事をしているのかな？',
      happy_disgusted: '笑っているけど、何か気に入らないこともあったのかな？',
      sad_angry: '辛いことやフラストレーションがたまっているのかな？',
      sad_surprised: '予想外のことで悲しんでいるのかな？',
      sad_fear: '不安や心配が多い日だったのかな？',
      sad_confused: '何か疑問や不安を感じているのかな？',
      sad_disgusted: '何か気に食わないこととともに、悲しみも感じているのかな？',
      angry_surprised: '何か予想外のことに怒っているのかな？',
      angry_fear: '不安とフラストレーションが交錯しているのかな？',
      angry_confused: '何か理解できないことにイライラしているのかな？',
      angry_disgusted: '何か気に入らないことに怒りを感じているのかな？',
      surprised_fear: '何か驚くようなことが起こり、それに対して不安を感じているのかな？',
      surprised_confused: '驚いたこととともに、何か混乱しているのかな？',
      surprised_disgusted: '驚きの中で、何か気に入らないこともあったのかな？',
      fear_confused: '不安と疑問が頭の中を駆け巡っているのかな？',
      fear_disgusted: '何か心配事とともに、嫌なこともあったのかな？',
      confused_disgusted: '何か理解できないことと、気に食わないことが重なっているのかな？'
    }
    # 5000以上の感情を抽出
    high_emotions = emotion_params.select { |_k, v| v.to_i > 5000 }

    # 高い感情が1つだけの場合
    if high_emotions.length == 1
      emotion_key = high_emotions.keys.first
      emotions[emotion_key] || 'コメントが定義されていません。'
    elsif high_emotions.length > 1
      # 上位2つの感情を抽出
      top_2_emotions = high_emotions.sort_by { |_k, v| -v }.take(2).map(&:first)
      combined_key = "#{top_2_emotions[0]}_#{top_2_emotions[1]}".to_sym
      conbined_emotions[combined_key] || 'コメントが定義されていません。'
    else

      '感情を爆発させろ！！！'

    end
  end
end
