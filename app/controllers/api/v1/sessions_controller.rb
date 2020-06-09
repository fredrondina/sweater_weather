class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
      return render json: {'error' => 'Invalid Credentials'}, status: 400 if user.nil?
    if user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: {'error' => 'Invalid Credentials'}, status: 400
    end
  end
end
