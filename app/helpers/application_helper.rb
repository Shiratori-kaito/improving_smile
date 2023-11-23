module ApplicationHelper
  def assign_meta_tags(options = {})
    site = 'Face World',
    title = options[:title]
    description = '顔の表情を分析して、どんな感情を持っているのかを診断するサービスです。',
    keywords = '顔,表情,感情,診断,分析',
    image =  image_url('HomeTop.png')
    configs = {
      separator: '|',
      reverse: true,
      site:,
      title:,
      description:,
      keywords:,
      canonical: request.original_url,
      icon: {
        href: image_url('HomeTop.png')
      },
      og: {
        type: 'website',
        title: title.presence || site,
        description:,
        url: request.original_url,
        image:,
        site_name: site
      },
      twitter: {
        site:,
        card: 'summary_large_image',
        image:
      }
    }
    set_meta_tags(configs)
  end
end
