class Request < ApplicationRecord
  belongs_to :musician
  belongs_to :opening
  belongs_to :user

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
end
