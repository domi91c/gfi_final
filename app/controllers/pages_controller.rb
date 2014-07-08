class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json


  # GET /pages/1
  # GET /pages/1.json
  def show

  end

  def help
	  render 'help.erb'
  end


end
