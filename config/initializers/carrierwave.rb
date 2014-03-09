CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    host:  "//s3.amazonaws.com",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]

  }
  config.fog_directory = ENV["AWS_S3_BUCKET"]
end

def full_original_filename
  filename = super

  return filename if !filename.present?

  extension = File.extname(filename)
  basename = File.basename(filename, extension)[0...MAX_FILENAME_LENGTH]
  basename + extension
end