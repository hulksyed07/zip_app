# Paperclip.options[:content_type_mappings] = { zip: 'application/zip' }
class UserFile < ApplicationRecord
	has_attached_file :my_file#, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	# validates_attachment_presence :my_file
	validates_attachment_content_type :my_file, :content_type => ["application/zip", "application/x-zip", "application/x-zip-compressed"]
	# before_post_process :skip_for_zip
	# do_not_validate_attachment_file_type :
	# before_save :change_content_type

	# def skip_for_zip
	#    ! %w(application/zip application/x-zip).include?(asset_content_type)
	# end
	

	# def change_content_type
	# 	@content_type = 'application/zip'
	# end

end
