

class UserFilesController < ApplicationController
	before_action :set_user_file, only: [:show, :show_individual_file_content]
	
	def new
		@user_file = UserFile.new
	end

	def index
		@user_files = UserFile.all
	end

	def search
		unless params[:search_filter].blank?
			search_filter = params[:search_filter]
			@user_files = UserFile.where("my_file_file_name like '%#{search_filter}%'")
		else
			@user_files = UserFile.all
		end
		render :index
	end

	def create
		puts 'inspecting params inside controlller'
		# puts params[:user_file][:my_file].inspect
		# puts params[:user_file][:my_file].content_type
		# !params[:user_file][:my_file].content_type = 'application/zip'
		# user_file_par = user_file_params
		# puts user_file_par.inspect
		# puts user_file_par[:my_file].content_type
		# # !user_file_par[:my_file].content_type = "application/zip"
		# !user_file_par[:my_file].content_type = '["application/zip"]'
		# puts user_file_par[:my_file].content_type 
		# @user_file = UserFile.create( user_file_par )
		@user_file = UserFile.create( user_file_params )
		redirect_to user_files_path
		# if @user_file.save
		# 	render :show
		# else
		# 	render :new, notice: 'File not saved properly'
		# end
	end

	def show
	end

	def show_individual_file_content
		@file_name = params[:file_name]
	end

	private

	def set_user_file
		@user_file = UserFile.find(params[:id])
	end

	def user_file_params
  	params.require(:user_file).permit(:my_file)
  	# !params[:user_file][:my_file].content_type = 'application/zip'
  	# params[:user_file]
	end
end

