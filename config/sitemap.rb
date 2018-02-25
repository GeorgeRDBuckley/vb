# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://isitveganbeer.com"

SitemapGenerator::Sitemap.create do

  Beer.find_each do |beer|
    add main_beer_path(beer.brewery.slug, beer.slug), :lastmod => beer.updated_at, 
    :images => [{
    :loc => "#{beer.beer_image}",
    :title => "Is #{beer.name} by #{beer.brewery.name} Vegan?" }]
  end

  Brewery.find_each do |brewery|
    add main_brewery_path(brewery), :lastmod => brewery.updated_at, 
    :images => [{
    :loc => "#{brewery.brewery_logo}",
    :title => "Are #{brewery.name} beers Vegan?"}]
  end

  User.find_each do |user|
    add show_profile_path(user.username), :lastmod => user.updated_at
  end

  add '/beers', :changefreq => 'daily'

  add '/breweries', :changefreq => 'daily'
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
