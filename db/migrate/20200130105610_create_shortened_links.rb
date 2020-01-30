class CreateShortenedLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :shortenedlink do |t|
      t.string :longLink
      t.string :shortLink
      t.timestamps
    end
  end
end
