module Api
  module V1
    class ClientsController < ApplicationController
      def index
        begin
            clients = ClientServices::ClientLister.call(params)
            render_success('Loaded clients', clients)
        rescue Exception => e
            render_failure('Clients not loaded', e.message)
        end
      end

      def show
        begin
            client = ClientServices::ClientLoader.call(params)
            render_success('Loaded client', client)
        rescue Exception => e
            render_failure('Client not loaded', e.message)
        end
      end

      def create
        begin
            client = ClientServices::ClientCreator.call(params)
            client.save
            render_success('Saved client', client)
        rescue Exception => e
            render_failure('Client not saved', e.message)
        end
      end

      def update
        begin
            client = ClientServices::ClientUpdater.call(params)
            render_success('Updated client', client)
        rescue Exception => e
            render_failure('Client not updated', e.message)
        end
      end

      def destroy
        begin
            client = ClientServices::ClientEraser.call(params)
            render_success('Client deleted', client)
        rescue Exception => e
            render_failure('Client not deleted', e.message)
        end
      end
    end
  end
end