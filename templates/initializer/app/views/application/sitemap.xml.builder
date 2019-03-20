# frozen_string_literal: true

xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
  xml.url do
    xml.loc root_url
    xml.changefreq('hourly')
    xml.priority '1.0'
  end
end
