require 'active_support/concern'

module Item
  extend ActiveSupport::Concern

  included do
    validates_presence_of :email, :owner_name, :start_location
    attr_readonly :email

    has_many :answers, as: :item, dependent: :destroy
    has_one :item_reactivator, as: :item, dependent: :destroy

    scope :not_blocked, -> { where(blocked: false) }
    scope :blocked, -> { where(blocked: true) }
    scope :confirmed, -> { where.not(email_confirmed_at: nil) }
    scope :current, -> { where("#{table_name}.updated_at >= ?", outdating_date) }
    scope :outdated, -> { where("#{table_name}.updated_at < ?", outdating_date) }
    scope :is_public, -> { where(is_public: true) }

    before_save :update_coordinates
  end

  module ClassMethods
    def outdating_date
      31.days.ago
    end

    def visible_for(user = nil, scope)
      if user&.admin?
        scope.current
      else
        scope.current.not_blocked.confirmed.is_public
      end
    end
  end

  def current?
    updated_at >= self.class.outdating_date
  end

  def outdated?
    updated_at < self.class.outdating_date
  end

  def visible?
    !blocked && email_confirmed? && current?
  end

  def email_confirmed?
    !email_confirmed_at.nil?
  end

  def confirm_email!
    update!(email_confirmed_at: Time.now)
  end

  def get_or_create_reactivator
    return item_reactivator if item_reactivator
    ItemReactivator.create! item: self
  end

  def unblock!
    update!(blocked: false)
  end

  def block!
    update!(blocked: true)
  end

  def owner_show_token
    self.to_sgid(expires_in: nil, for: :owner).to_s
  end

  def update_coordinates
    return if start_location.blank?
    results = Geocoder.search(start_location)
    coordinates = results.first.coordinates
    self.start_latitude, self.start_longitude = coordinates[0], coordinates[1]
  end
end
