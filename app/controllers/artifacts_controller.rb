class ArtifactsController < ApplicationController

    # def index
    #     arr = []
    #     if params[:category]
    #         params[:category].each {|k, v| arr << v}
    #         render json: Artifact.where(category: [Category.where(name: arr)]).to_json(:only => [ :id, :title, :primary_image, :list_price, :description, :verification, :century, :classification], :include => :category)
    #     else
    #         render json: Artifact.all.to_json(:only => [ :id, :title, :primary_image, :list_price, :description, :verification, :century], :include => :category)
    #     end
    # end

    def index
        render json: Artifact.all.to_json(:only => [ :id, :title, :primary_image, :list_price, :description, :verification, :century], :include => { :category => {:only => [:name, :id] }})
    end

    def show
        render json: Artifact.find(params[:id]).to_json(:except => [ :created_at, :updated_at ], :include => { :category => {:only => [:name, :id] }})
    end


end
