module Pagination
  extend ActiveSupport::Concern

  included do
    helper_method :per_page, :pagination_block, :current_page

    private

    def per_page
      params[:per] || self.class.class_variable_get(:@@_pagination_per)
    end

    def pagination_block(model)
      return [] if current_page.zero?
      total_pages = model.unscope(:offset, :limit).count / per_page
      pages = []
      3.downto(1).each { |index| pages << current_page - index }
      pages << current_page
      1.upto(3).each { |index| pages << current_page + index }
      pages.delete_if { |page| page < 1 || page > total_pages }
      pages
    end

    def current_page
      if @current_page.nil?
        @current_page = params[:page].blank? ? 1 : params[:page].to_i
      end

      @current_page
    end
  end

  class_methods do
    def per_page_default(per)
      class_variable_set(:@@_pagination_per, per)
    end
  end
end
