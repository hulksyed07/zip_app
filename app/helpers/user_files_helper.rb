require 'zip'
module UserFilesHelper
	# def show_zip_file_content(user_file, filter="")
 #    file_name = user_file.my_file_file_name
 #    file_path = "#{Rails.root}/public/system/user_files/my_files/000/000/00#{user_file.id}/original/#{file_name}"
 #    # file_path = "C:/syed/hellorename.zip"
 #    puts file_path
	# 	content = []
 #    xml_entries = []
 #    all_entries = []
 #    other_entries = []
 #    Zip::File.open(file_path) do |zip_file|
 #      # puts 'inspecting zip_file'
 #      # puts zip_file.inspect
	#   # Handle entries one by one
	# 	  zip_file.each do |entry|
	# 	    all_entries << entry
	# 	  end

	# 	  # Find specific entry
	# 	  # entry = zip_file.glob('*.xml').first
 #      xml_entries = zip_file.glob('*.xml')
 #      # puts entry.inspect
 #      # content = File.open("#{file_path}/#{entry}").readlines
	# 	  # puts entry.get_input_stream.read
 #      # content = entry.get_input_stream.read unless entry.blank?
 #      # puts entry.read
 #      # content = entry.read
	# 	end
 #    # content = entry.get_input_stream.read
 #    # # puts content.inspect
 #    # if entry.blank?
 #    #   return ''
 #    # end
 #    # content.blank? ? entry : content
 #    str_to_return = ""
 #    other_entries.each do
 #      str << entry
 #    end
	# end

  def show_zip_file_content(user_file, filter="")
    zip_file_name = user_file.my_file_file_name
    file_path = "#{Rails.root}/public/system/user_files/my_files/000/000/00#{user_file.id}/original/#{zip_file_name}"
    str = ""
    Zip::File.open(file_path) do |zip_file|
      zip_file.each do |entry|
        if entry.name.include?('.xml')
          str+= "#{link_to entry.name, show_individual_file_content_user_file_path(id: user_file.id,file_name: entry.name)}"
          str+= "<br>"
        else
          str << "#{entry.name}<br>"
        end
      end
    end
    str
  end

  def show_individual_file_content(user_file, individual_file_name)
    zip_file_name = user_file.my_file_file_name
    file_path = "#{Rails.root}/public/system/user_files/my_files/000/000/00#{user_file.id}/original/#{zip_file_name}"
    content = ''
    if individual_file_name.include?('.xml')
      Zip::File.open(file_path) do |zip_file|
        entry = zip_file.glob(individual_file_name).first
        content = entry.get_input_stream.read unless entry.blank?
      end
    end
    content
  end
end
