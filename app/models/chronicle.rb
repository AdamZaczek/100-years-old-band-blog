class Chronicle < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }, on: :create
	validates :body,  presence: true, length: { minimum: 5 }, on: :create
	mount_uploader :image, ImageUploader
end
