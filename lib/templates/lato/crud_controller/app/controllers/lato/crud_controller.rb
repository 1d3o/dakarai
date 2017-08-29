# frozen_string_literal: true

module Lato
  # <%= @controller_name %>Controller.
  class <%= @controller_name %>Controller < Lato::ApplicationController

    before_action do
      core__set_menu_active_item('<%= @singular_name %>')
    end

    def index
      core__set_header_active_page_title('<%= @plural_name.humanize %>')
      @<%= @plural_name %> = <%= @model_name %>.all
      @widget_index_<%= @plural_name %> = core__widgets_index(
        @<%= @plural_name %>,
        search: 'search_key',
        pagination: 10
      )
    end

    def show
      core__set_header_active_page_title('<%= @singular_name.humanize %>')
      @<%= @singular_name %> = <%= @model_name %>.find_by(id: params[:id])
      return unless check_<%= @singular_name %>_presence
    end

    def new
      core__set_header_active_page_title('New <%= @singular_name.humanize %>')
      @<%= @singular_name %> = <%= @model_name %>.new
    end

    def create
      @<%= @singular_name %> = <%= @model_name %>.new(<%= @singular_name %>_params)

      unless @<%= @singular_name %>.save
        flash[:danger] = @<%= @singular_name %>.errors.full_messages.to_sentence
        redirect_to new_lato_<%= @singular_name %>_path
        return
      end

      flash[:success] = '<%= @singular_name.humanize %> created succesfully'
      redirect_to lato_<%= @singular_name %>_path(@<%= @singular_name %>.id)
    end

    def edit
      core__set_header_active_page_title('Edit <%= @singular_name.humanize %>')
      @<%= @singular_name %> = <%= @model_name %>.find_by(id: params[:id])
      return unless check_<%= @singular_name %>_presence
    end

    def update
      @<%= @singular_name %> = <%= @model_name %>.find_by(id: params[:id])
      return unless check_<%= @singular_name %>_presence

      unless @<%= @singular_name %>.update(<%= @singular_name %>_params)
        flash[:danger] = @<%= @singular_name %>.errors.full_messages.to_sentence
        redirect_to edit_lato_<%= @singular_name %>_path(@<%= @singular_name %>.id)
        return
      end

      flash[:success] = '<%= @singular_name.humanize %> updated succesfully'
      redirect_to lato_<%= @singular_name %>_path(@<%= @singular_name %>.id)
    end

    def destroy
      @<%= @singular_name %> = <%= @model_name %>.find_by(id: params[:id])
      return unless check_<%= @singular_name %>_presence

      unless @<%= @singular_name %>.destroy
        flash[:danger] = @<%= @singular_name %>.errors.full_messages.to_sentence
        redirect_to lato_<%= @singular_name %>_path(@<%= @singular_name %>.id)
        return
      end

      flash[:success] = '<%= @singular_name.humanize %> destroyed succesfully'
      redirect_to lato_<%= @singular_name %>s_path
    end

    private

    def <%= @singular_name %>_params
      params.require(:<%= @singular_name %>).permit(:name)
    end

    def check_<%= @singular_name %>_presence
      return true if @<%= @singular_name %>
      redirect_to lato_<%= @singular_name %>s_path
      false
    end

  end
end
