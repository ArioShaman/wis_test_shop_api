class Phone < ApplicationRecord
	mount_uploader :image, ItemImageUploader
end
