AssetSync.configure do |config|
    config.fog_provider = "Google"
    config.fog_directory = ENV['FOG_DIRECTORY']
    config.gzip_compression = true
end