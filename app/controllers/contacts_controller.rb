class ContactsController < ApplicationController


  def show
    @contact = Contact.find(params[:id])
  end


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save

        # Sends email to user when user is created.
        SendEmailContactJob.set(wait: 2.seconds).perform_later(@contact)

        format.html { redirect_to @contact, notice: 'Message is sent!' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def contact_params
      params.require(:contact).permit(:name, :message)
    end
end
