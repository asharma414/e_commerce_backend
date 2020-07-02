class ArtifactsController < ApplicationController

    def index
        render json: Artifact.all
    end

end
