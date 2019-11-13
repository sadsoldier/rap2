class RecordController < ApplicationController

    attr_accessor :search_timestamp, :search_source, :search_destination
    #attr_reader :pagy_nav, :records

    def initialize
        super
        @dir = Rails.configuration.records_dir
    end

    def update
        UpdateRecordsJob.perform_later
        redirect_to record_index_path
    end

    def index
        #@pagy, @records = pagy(Record.all.order(timestamp: :desc))


        search_timestamp = params[:timestamp]
        search_source = params[:source]
        search_destination = params[:destination]

        if search_source != nil
            search_source.gsub!(/[\-()_.+ ]/, '')
        end
        if search_destination != nil
            search_destination.gsub!(/[\-()_.+ ]/, '')
        end

        @pagy_nav, @records = pagy(Record
            .where('timestamp like ?', "%#{search_timestamp}%")
            .where('source like ?', "%#{search_source}%")
            .where('destination like ?', "%#{search_destination}%")
            .order(timestamp: :desc))

        @search_timestamp = search_timestamp
        @search_source = search_source
        @search_destination = search_destination

        render 'index'
    end

    def download
        id = params[:id]
        record = Record.find_by(id: id)
        send_file File.join(@dir, record.filename), :disposition => 'attachment'
    end

end
