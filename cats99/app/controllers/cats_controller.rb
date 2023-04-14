class CatsController < ApplicationController
    def index
        @cats = Cat.all 
        render :index
    end
    
    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save!
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def edit
        @cat = Cat.new(params[:id])
        render :edit
    end

    def update
        @cat = Cat.new(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    private
    
    def cat_params
        params.requires(:cat).permit(:birth_date,:color,:name,:sex,:description)
    end
end