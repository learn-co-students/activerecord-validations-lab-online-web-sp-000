class AuthorsController < ApplicationController
    def show 
        @author = Author.find(params[:id])
    end 

    def new 
        @author = Author.new 
    end 

    def edit 
        @author = Author.new 
    end 

    def create
        @author = Author.new(author_params) 
        @author.save 
        redirect_to author_path(@author)

    end

    def update
        @author = Author.find(params[:id])
        @author.update(author_params)
        redirect_to author_path(@author)
      end

    private 

    def author_params
        params.require(:author).permit!
    end 

end 



        

