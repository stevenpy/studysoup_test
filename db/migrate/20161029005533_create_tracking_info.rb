class CreateTrackingInfo < ActiveRecord::Migration[5.0]
  def change
   create_table :tracking_infos do |t|
      t.string :city
      t.string :country
      t.string :event
      t.string :domain
      t.string :devicetype
      t.string :region
      t.string :clientname
      t.string :clientos
      t.string :url
      t.string :recipient
      t.string :ip
      t.string :timestamp
    end
  end
end
