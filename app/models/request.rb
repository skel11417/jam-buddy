class Request < ApplicationRecord
  belongs_to :musician
  belongs_to :opening
  belongs_to :user

  def requested_path
    if self.musician_status == "pending"
      return musician_path(self.musician_id)
    else
      return opening_path(self.opening_id)
    end
  end

  def self.sort_requests(user_id)
    all_requests = Request.where(user_id: user_id)

    musician_requests = all_requests.where(musician_status: "pending")
    opening_requests = all_requests.where(band_status: "pending")

    {"musicians" => musician_requests, "openings" => opening_requests}
  end
end
