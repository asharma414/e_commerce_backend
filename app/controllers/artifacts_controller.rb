class ArtifactsController < ApplicationController

    def index
        render json: Artifact.all.to_json(:only => [ :id, :title, :image_url, :list_price, :description, :verification, :century])
    end

    def show
        render json: Artifact.find(params[:id]).to_json(:except => [ :created_at, :updated_at ])
    end

end
