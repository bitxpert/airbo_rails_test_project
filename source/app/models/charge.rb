class Charge < ActiveRecord::Base
	belongs_to :customer
	attr_accessor :state

	TRANSACTION_TYPES = {
		successful: {
			paid: true,
			refunded: false
		}, 
		failed: {
			paid: false,
			refunded: false
		},
		disputed:{
			paid: true,
			refunded: true
		}
	}
  scope :successful, -> {where(TRANSACTION_TYPES[:successful])}
  scope :failed, -> {where(TRANSACTION_TYPES[:failed])}
  scope :disputed, -> {where(TRANSACTION_TYPES[:disputed])}

	before_save :save_state
	def save_state
		self.attributes = TRANSACTION_TYPES[self.state]
	end
	def created
		self.created_at.to_i
	end
	def amount_in_dollars
		amount/100
	end
end
