# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.1'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Rails.application.config.assets.precompile += %w( jquery-3.1.1.min.js )
Rails.application.config.assets.precompile += %w( typed.min.js )
Rails.application.config.assets.precompile += %w( isotope.min.js )
Rails.application.config.assets.precompile += %w( granim.min.js )
Rails.application.config.assets.precompile += %w( smooth-scroll.min.js )
Rails.application.config.assets.precompile += %w( scripts.js )
Rails.application.config.assets.precompile += %w( flickity.min.js )
