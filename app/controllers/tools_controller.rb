class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def destroy
    tool = Tool.find( params[:id] )
    tool.destroy
    redirect_to tools_path
  end
end
