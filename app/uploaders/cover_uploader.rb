# frozen_string_literal: true

class CoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w[jpg jpeg png]
  end

  version :small do
    process resize_to_fit: [100, 300]
  end

  version :large do
    process resize_to_fit: [300, 900]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "cover.#{file.extension}" if original_filename
  end
end
