
    require 'ostruct'

#class Hash
#  def to_o
#    JSON.parse to_json, object_class: OpenStruct
#  end
#end


class HomeController < ApplicationController
    #wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
    #wrap_parameters :person, include: [:name, :role]

#    require 'ostruct'


    def index
        if session[:user_id]
            redirect_to record_index_path
        else
            redirect_to login_path
        end
    end

    def hello
        #obj = OpenStruct.new(params)
        #obj = JSON.parse(params.to_json, object_class: OpenStruct)
        #render json: { result: obj.role.rolename }

        render json: { result: User.all }
    end

end
