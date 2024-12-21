class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :paginated, -> (page, per_page) { offset((page - 1) * per_page).limit(per_page) }

end
