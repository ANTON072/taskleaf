class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  # before_validation :set_nameless_name

  belongs_to :user

  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  # CSVデータにどの属性をどの順番で出力するかを定義
  def self.csv_attributes
    %w[name description created_at updated_at]
  end

  def self.generate_csv
    # CSVデータの文字列を生成
    CSV.generate(headers: true) do |csv|
      # csvの1行目を出力
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{ |attr| task.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      task = new
      task.attributes = row.to_hash.slice(*csv_attributes)
      task.save!
    end
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, "にカンマを含めることはできません") if name&.include?(",")
  end

  def set_nameless_name
    self.name = "名前なし" if name.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at description id name updated_at user_id]
  end

end
