module ApplicationHelper
    def default_meta_tags
    {
        site: 'マガラバ',
        title: '漫画考察・ネタバレ・感想を投稿・共有するなら',
        description: 'マガラバは漫画の考察・ネタバレ・感想などの投稿・共有サービスです。王道のワンピースやHUNTER×HUNTER、ナルトなどの漫画からマイナーな漫画まで幅広い漫画があり、簡単に考察・ネタバレ・感想などを投稿・共有することができます。',
        charset: 'utf-8',
        reverse: true,
        separator: '  ',
        og: defalut_og,
        twitter: default_twitter_card,
        icon: [
            { href: image_url('/favorite/favorite_icon_2.png') },
            { href: image_url('/favorite/mobile_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
        ]
    }
    end
    def defalut_og
    {
        site_name: :site,
        title: :full_title,          # :full_titleとすると、サイトに表示される <title> と全く同じものを表示できる
        description: :description,   # 上に同じ
        type: 'website',
        url: request.original_url,
        image: image_url('default_ogp_2.png'),
        locale: 'ja_JP',
    }
    end
    
    def default_twitter_card
        {
        card: 'summary_large_image', # またはsummary
        site: '@MG_and_MN'            # twitterID
        }
    end
end
