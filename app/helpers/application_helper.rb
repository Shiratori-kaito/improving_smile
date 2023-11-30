# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: 'Face World',
      title: '自分の顔の表情を分析して、結果を返します。',
      reverse: true,
      charset: 'utf-8',
      description: 'ユーザーは分析結果を通して、自分の顔の表情にはどのような感情が含まれているかを知ることができます。',
      keywords: '表情,顔,分析,感情',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@nvrl623', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
