class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email,:category_id, :content

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
end
