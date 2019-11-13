class ErrorController < ApplicationController

    def not_found
        #render 'not_found', status: 404
        respond_to do |format|
            format.html { render status: 404 }
            format.json { render json: { error: "not-found" }, status: 404 }
        end
    end

    def unacceptable
        respond_to do |format|
            format.html { render status: 422 }
            format.json { render json: { error: "params unacceptable" }, status: 422 }
        end
    end


    def internal_error
        respond_to do |format|
            format.html { render status: 500 }
            format.json { render json: { error: "internal-error" }, status: 500 }
        end
  end

end
