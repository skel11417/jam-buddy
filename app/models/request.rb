class Request < ApplicationRecord
  belongs_to :musician
  belongs_to :opening
  belongs_to :user

  validate :is_not_duplicate?, on: :create
  validate :is_not_inverse?, on: :create

  def self.read_all(user_id)
    all_requests = Request.where(user_id: user_id)
    all_requests.each do |r|
      r.update(read: true)
    end
  end

  def self.sort_requests(user_id)
    all_requests = Request.where(user_id: user_id)

    musician_requests = all_requests.where(musician_status: "pending")
    opening_requests = all_requests.where(band_status: "pending")

    {"musicians" => musician_requests, "openings" => opening_requests}
  end

  def self.notification(user_id)
    all_requests = Request.where(user_id: user_id)
    unread = all_requests.select { |r| !r.read }
    notification = "Notifications"
    if (unread.length > 0)
      notification += " (#{unread.length} unread)"
    end

    return notification
  end

  private

  def is_not_duplicate?
    errors.add(:user_id, ": You have already made this request!") unless Request.where(user_id: self.user_id, musician_id: musician_id, opening_id: opening_id).length == 0
  end

  def is_not_inverse?
    errors.add(:user_id, ": This user has already requested you! Check your notifications") unless Request.where("musician_id = ? AND opening_id = ? AND user_id IS NOT ?", self.musician_id, self.opening_id, self.user_id).length == 0
  end
end
