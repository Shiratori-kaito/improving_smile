require 'aws-sdk-rekognition'
require 'aws-sdk-s3'

s3 = Aws::S3::Client.new(region: 'ap-northeast-1')
s3_response = s3.get_object(bucket: "smile-images", key: "mai.jpg")

client = Aws::Rekognition::Client.new(region: 'ap-northeast-1')

# 画像ファイルをバイトデータとして読み込む
image = { bytes: s3_response.body.read }

# Amazon Rekognitionに画像を送って顔認識を行う
response = client.detect_faces({ image: image, attributes:['ALL']})

# 結果を表示する

puts response

