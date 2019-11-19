
class UpdateRecordsJob < ApplicationJob
    queue_as :default

    #self.queue_adapter = :resque

    def perform(*args)

        Record.delete_all
        list = []

        Dir[File.join(Rails.configuration.records_dir, "*.wav")].sort.each do |full_filename|
            filename = File.basename full_filename
            record = Record.new
            res = filename.match(/fs--(\d{4}-\d{2}-\d{2})-(\d{2}-\d{2}-\d{2})--income--[+]*(\d+).wav/)
            record.filename = filename
            record.size = File.size full_filename
            if res
                record.timestamp = "#{res[1]} #{res[2].gsub('-', ':')}"
                record.source = res[3]
            end
            res = filename.match(/fs--(\d{4}-\d{2}-\d{2})-(\d{2}-\d{2}-\d{2})--outcome--(\d+)--(\d+).wav/)
            if res
                record.timestamp = "#{res[1]} #{res[2].gsub('-', ':')}"
                record.source = res[3]
                record.destination = res[4]
            end
            record.save
        end

    end
end
