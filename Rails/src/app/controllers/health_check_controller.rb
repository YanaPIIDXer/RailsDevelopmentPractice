class HealthCheckController < ApplicationController
    def index()
        render json: {message: "Health Check OK"}
    end
end
