module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        begin
            projects = ProjectServices::ProjectLister.call(params)
            render_success('Loaded projects', projects)
        rescue Exception => e
            render_failure('Projects not loaded', e.message)
        end
      end

      def show
        begin
            project = ProjectServices::ProjectLoader.call(params)
            render_success('Loaded project', project)
        rescue Exception => e
            render_failure('Project not loaded', e.message)
        end
      end

      def create
        begin
            project = ProjectServices::ProjectCreator.call(params)
            render_success('Saved project', project)
        rescue Exception => e
            render_failure('Project not saved', e.message)
        end
      end

      def update
        begin
            project = ProjectServices::ProjectUpdater.call(params)
            render_success('Updated project', project)
        rescue Exception => e
            render_failure('Project not updated', e.message)
        end
      end

      def destroy
        begin
            project = ProjectServices::ProjectEraser.call(params)
            render_success('Project deleted', project)
        rescue Exception => e
            render_failure('Project not deleted', e.message)
        end
      end
    end
  end
end