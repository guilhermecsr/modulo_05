class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if:
      :all_blank, allow_destroy: true

  scope :_search_subject, ->(page, subject_id) {
    includes(:answers, :subject)
        .where(subject_id: subject_id)
        .page(page)
  }

  scope :_search_, ->(page, term) {
    includes(:answers)
        .where("lower(description) LIKE ?", "%#{term.downcase}%")
        .page(page)
  }

  scope :last_questions, ->(page) {
    includes(:answers).order('created_at desc').page(page)
  }
end
