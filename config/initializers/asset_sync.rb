AssetSync.configure do |config|
    config.fog_provider = "Google"
    config.fog_directory = ENV['FOG_DIRECTORY']
    config.gzip_compression = true
    config.google_storage_access_key_id = ENV['GOOGLE_STORAGE_ACCESS_KEY_ID']
    config.google_storage_secret_access_key = ENV['GOOGLE_STORAGE_SECRET_ACCESS_KEY']
end