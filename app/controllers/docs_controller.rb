class DocsController < ApplicationController
  before_filter :require_authentication!

  def index
    @docs = current_user.docs.all.alive
  end

  def new
    @user = current_user 
    @doc = Doc.new    
  end
  
  def show
    @doc = Doc.find(params[:id]) 
    return e404 unless @doc.present? || @doc.user == current_user 
  end

  def edit
    @doc = Doc.find(params[:id])
    return e404 unless @doc.present? || @doc.user == current_user 
  end

  def update
    @doc = Doc.find(params[:id])
    return e404 unless @doc.present? || @doc.user == current_user 
    @doc.update_attributes(params[:doc]) 
  end

  def create
    @user = current_user
    @doc = current_user.docs.build(params[:doc]) 
    redirect_to docs_path(@doc) 
  end

  def destroy
    @doc = Doc.find(params[:id])
    return e404 unless @doc.present? || @doc.user == current_user
    @doc.alive = false
    @doc.deleted_at = Time.now
    @doc.save 
  end

  def publish
    @doc = Doc.find(params[:id])
    @doc.parse
    response.headers["Content-Type"] = "application/octet-stream"
    response.headers["MIME-type"] = "application/octet-stream" 
    render "layouts/published_page", doc: @doc 
  end
end
