require 'zip'
module UserFilesHelper
	def show_zip_file_content(user_file, filter="")
    file_name = user_file.my_file_file_name
    file_path = "#{Rails.root}/public/system/user_files/my_files/000/000/00#{user_file.id}/original/#{file_name}"
    # file_path = "C:/syed/hellorename.zip"
    puts file_path
		content = []
    entry = ''
    Zip::File.open(file_path) do |zip_file|
	  # Handle entries one by one
		  # zip_file.each do |entry|
		  #   # Extract to file/directory/symlink
		  #   puts "Extracting #{entry.name}"
		  #   entry.extract(dest_file)

		  #   # Read into memory
		  #   content = entry.get_input_stream.read
		  # end

		  # Find specific entry
		  entry = zip_file.glob('*.xml').first
      puts entry
      # content = File.open("#{file_path}/#{entry}").readlines
		  # puts entry.get_input_stream.read
      content = entry.get_input_stream.read unless entry.blank?
      # puts entry.read
      # content = entry.read
		end
    puts content.inspect
    if entry.blank?
      return ''
    end
    content.blank? ? entry : content
	end
end
