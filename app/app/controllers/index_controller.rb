class IndexController < ApplicationController

    def index
        render 'index'
    end

    def notfound
        render 'notfound'
    end
end
