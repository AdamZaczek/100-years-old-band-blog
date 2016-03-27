class Photo < ActiveRecord::Base
    mount_uploader :photo, ImageUploader
end
