class DocumentsController < ApplicationController

  before_action :require_login

	# form to upload a new document
	def new
		if logged_in?
			@user = current_user
			@document = @user.documents.new
		else
			flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
			redirect_to '/'
		end
	end

	# create action for new document
	def create
		@user = current_user
		@document = @user.documents.new(doc_params)
		if @user.save
			redirect_to documents_path
		else
			@errors = @user.errors.full_messages + @document.errors.full_messages
			render "new"
		end
	end

	# show all documents uploaded for one user
	def index
		@user = current_user
		if admin? 
			@documents = Document.all
		elsif logged_in?
			@documents = @user.documents
		else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_to '/'
    end
	end

	# show one document (in full resolution if multiple sizes are used)
	def show
		@user = current_user
		doc = Document.find(params[:id])
		if admin? || (logged_in? && @user.documents.include?(doc))
			@document = doc
		else
			flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
			redirect_to '/'
		end
	end

	def destroy
		@document = Document.find(params[:id])
		if admin? || (logged_in? && @document.user.id == current_user.id)
			@document.destroy
			redirect_to documents_path
		else
			flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
			redirect_to '/'
		end
	end

	def download
		@document = Document.find(params[:id])
		if admin? || (logged_in? && @document.user.id == current_user.id)
	  	send_file(@document.media.path)
	  end
	end

	private 
	def doc_params
		params.require(:document).permit(:name, :media, :remote_media_url)
	end
end
