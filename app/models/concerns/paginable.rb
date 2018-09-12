module Paginable
  extend ActiveSupport::Concern

  included do
    scope :paginate, (lambda do |per, page|
      return where(nil) if per.blank? || page.blank? || page.zero?
      offset((page.to_i - 1) * per.to_i).limit(per)
    end)
  end
end
