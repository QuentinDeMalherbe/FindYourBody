class BooksController < ApplicationController
  def create
    @book = Book.new
    activity = Activity.find(params["activity_id"])
    @book.activity = activity
    @book.user = current_user
    @book.status = 'booked'
    @book.timebook = DateTime.now;
    if @book.save!
      redirect_to activities_path
      # changer ca  vers les booking utilisateur
    end
  end

end

