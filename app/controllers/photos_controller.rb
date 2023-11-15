class PhotosController < ApplicationController
  before_action :set_user, only: [:create, :detect_faces]
  skip_before_action :require_signup, only: %i[capture create detect_faces]


  def capture;end

  def create
    @photo = @user.photos.new
    if @photo.save
      @photo.image.attach(photo_params[:image])
      redirect_to photos_detect_faces_path
    else
      render :capture
    end

  end


  def detect_faces

    @photo = @user.photos.last
    @image = @photo.image

    client = Aws::Rekognition::Client.new(region: 'ap-northeast-1')
    response = client.detect_faces({
      image: {
        s3_object: {
          bucket: "smile-images", # 画像の保存先のバケット名
          name: @image.key # 画像のファイル名
        }
      },
      attributes: ['ALL']
    })
  
    face_detail = response.face_details.first
    @analyse_face_detail = AnalyseFaceDetail.create!({
      photo_id: @photo.id,
      smile: face_detail[:smile][:confidence],
      sunglass: face_detail[:sunglasses][:value],
      eye_open: face_detail[:eyes_open][:value],
      mouth_open: face_detail[:mouth_open][:value],
      eye_direction_yaw: face_detail[:eye_direction][:yaw],
      eye_direction_pitch: face_detail[:eye_direction][:pitch],
      agerange_high: face_detail[:age_range][:high],
      agerange_low: face_detail[:age_range][:low]
    })

    @emotion = face_detail.emotions

    @analyse_face_emotion = AnalyseFaceEmotion.create!({
    photo_id: @photo.id,
    happy: (@emotion.find { |e| e[:type] == 'HAPPY' }&.dig(:confidence) * 100).round,
    sad: (@emotion.find { |e| e[:type] == 'SAD' }&.dig(:confidence) * 100).round,
    angry: (@emotion.find { |e| e[:type] == 'ANGRY' }&.dig(:confidence) * 100).round,
    surprised: (@emotion.find { |e| e[:type] == 'SURPRISED' }&.dig(:confidence) * 100).round,
    calm: (@emotion.find { |e| e[:type] == 'CALM' }&.dig(:confidence) * 100).round,
    fear: (@emotion.find { |e| e[:type] == 'FEAR' }&.dig(:confidence) * 100).round,
    confused: (@emotion.find { |e| e[:type] == 'CONFUSED' }&.dig(:confidence) * 100).round,
    disgusted: (@emotion.find { |e| e[:type] == 'DISGUSTED' }&.dig(:confidence) * 100).round
    })
    @data = {
      "喜び" => @analyse_face_emotion.happy,
      "悲しみ" => @analyse_face_emotion.sad,
      "怒り" => @analyse_face_emotion.angry,
      "驚き" => @analyse_face_emotion.surprised,
      "落ち着き" => @analyse_face_emotion.calm,
      "恐れ" => @analyse_face_emotion.fear,
      "混乱" => @analyse_face_emotion.confused,
      "嫌悪" => @analyse_face_emotion.disgusted
    }

    @score = @analyse_face_emotion.happy.to_f - @analyse_face_emotion.sad.to_f - @analyse_face_emotion.angry.to_f - (@analyse_face_emotion.surprised.to_f / 2) + @analyse_face_emotion.fear.to_f + @analyse_face_emotion.confused.to_f + @analyse_face_emotion.disgusted.to_f

    @analyse_face_emotion.emotion_comment = extra_comment(@analyse_face_emotion)
    @analyse_face_emotion.save!


  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def set_user
    @user = User.find(current_user.id)
  end

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
      happy: "笑顔が眩しすぎて見えねえ！",
      sad: "悲しい時は母ちゃんに電話しろい！",
      angry: "GEKIOKO。",
      surprised: "部屋に虫でもいたの？",
      calm: "穏やかだね。それともサウナ中？",
      fear: "上司に呼び出された？？一緒についていくよ！",
      confused: "モヤモヤするときは思いっきり叫ぶんだ！",
      disgusted: "何か気に入らないことがあったのかな？"
    }

    conbined_emotions = {
      happy_sad: "君の笑顔の裏には深い感情があるんだね。",
      happy_angry: "エネルギッシュだけど、少し刺激的な一日だったかな？",
      happy_surprised: "何かうれしいサプライズがあったのかな？",
      happy_fear: "楽しいことと同時に何か心配事もあるのかな？",
      happy_confused: "楽しんでいるけど、同時に何か考え事をしているのかな？",
      happy_disgusted: "笑っているけど、何か気に入らないこともあったのかな？",
      sad_angry: "辛いことやフラストレーションがたまっているのかな？",
      sad_surprised: "予想外のことで悲しんでいるのかな？",
      sad_fear: "不安や心配が多い日だったのかな？",
      sad_confused: "何か疑問や不安を感じているのかな？",
      sad_disgusted: "何か気に食わないこととともに、悲しみも感じているのかな？",
      angry_surprised: "何か予想外のことに怒っているのかな？",
      angry_fear: "不安とフラストレーションが交錯しているのかな？",
      angry_confused: "何か理解できないことにイライラしているのかな？",
      angry_disgusted: "何か気に入らないことに怒りを感じているのかな？",
      surprised_fear: "何か驚くようなことが起こり、それに対して不安を感じているのかな？",
      surprised_confused: "驚いたこととともに、何か混乱しているのかな？",
      surprised_disgusted: "驚きの中で、何か気に入らないこともあったのかな？",
      fear_confused: "不安と疑問が頭の中を駆け巡っているのかな？",
      fear_disgusted: "何か心配事とともに、嫌なこともあったのかな？",
      confused_disgusted: "何か理解できないことと、気に食わないことが重なっているのかな？"
    }
      # 5000以上の感情を抽出
    high_emotions = emotion_params.select { |_k, v| v.to_i > 5000 }

    # 高い感情が1つだけの場合
    if high_emotions.length == 1
      emotion_key = high_emotions.keys.first
      emotions[emotion_key] || "コメントが定義されていません。"
    elsif high_emotions.length > 1
      # 上位2つの感情を抽出
      top_2_emotions = high_emotions.sort_by { |_k, v| -v }.take(2).map(&:first)
      combined_key = "#{top_2_emotions[0]}_#{top_2_emotions[1]}".to_sym
      return conbined_emotions[combined_key] || "コメントが定義されていません。"
    else
      return "感情を爆発させろ！！！"
    end
  end
end