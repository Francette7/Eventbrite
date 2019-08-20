class AttendancesController < ApplicationController
	def index
		@attendance = Attendance.all
	end

	def new
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new
	end

	def create
		# Amount in cents
		  @amount = 500

		  customer = Stripe::Customer.create({
		    email: params[:stripeEmail],
		    source: params[:stripeToken],
		  })

		  charge = Stripe::Charge.create({
		    customer: customer.id,
		    amount: @amount,
		    description: 'Rails Stripe customer',
		    currency: 'usd',
		  })

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
	end
	def show
		@event = Event.find(params[:event_id])
		@attendance =@event.users[:id]

	end
end
