class LinksController < ApplicationController

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_path(@link)
    else
      render 'pages/home'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def go
    @link = Link.find_by(slug: params[:slug])
    if @link
      redirect_to @link.og_url
    else
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:og_url, :slug)
  end
end
