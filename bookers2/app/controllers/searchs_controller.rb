class SearchsController < ApplicationController

  def search
    @userbook = (params[:userbook]).to_i
    moji = (params[:moji]).to_i

    if @userbook == 1
      if moji == 1
        @userbooks = User.where("name LIKE ?","#{params[:keyword]}")
      elsif moji == 2
        @userbboks = User.where("name LIKE ?","#{params[:keyword]}%")
      elsif moji == 3
        @userbooks = User.where("name LIKE ?","%#{params[:keyword]}")
      else
        @userbooks = User.where("name LIKE ?","%#{params[:keyword]}%")
      end

    else

      if moji == 1
        @userbooks = Book.where("title LIKE ?","#{params[:keyword]}")
      elsif moji == 2
        @userbooks = Book.where("title LIKE ?","#{params[:keyword]}%")
      elsif moji == 3
        @userbooks = Book.where("title LIKE ?","%#{params[:keyword]}")
      else
        @userbooks = Book.where("title LIKE ?","%#{params[:keyword]}%")
      end
    end
  end

end
