class SignificantsController < ApplicationController
  def new
    @significant = Significant.new
  end

  def create
    @significant = Significant.new(significant_params.merge!(user: current_user))
    if @significant.save
      flash[:success] = "Awesome! #{@significant.name} has been added! You can now create message dispensers to randomly send messages their way."
      redirect_to home_path
    else
      flash[:danger] = "Looks like your information isn't valid... You can handle a name and phone number right?"
      render :new
    end
  end

  private

  def significant_params
    params.require(:significant).permit(:phone, :name)
  end
end