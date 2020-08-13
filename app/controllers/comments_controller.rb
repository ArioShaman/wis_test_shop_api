class CommentsController < ApplicationController
    before_action :set_commentable, only: [:index, :create]
    # before_action :set_klass, only: [:create]

    def index
        @comments = Comment.where( 
            commentable_id: @commentable_id, 
            commentable_type: @commentable_type
        )
        render json: @comments, 
                include: "*.*", 
                adapter: :json,
                status: 200
    end

    def create
        @guest_user = GuestUser.find_by!(token: params[:token])
        @klass = @commentable_type.capitalize.constantize
        puts ">>> #{ap @commentable_id}"
        @model = @klass.find(@commentable_id)
        puts ">>> #{ap @model}"
        @model.comments.create(
            text: params["text"],
            guest_user: @guest_user
        )
        render json: {
            status: :ok
        }
    end

    private
        def set_commentable
            if params[:phone_id]
                @commentable_type = "Phone"
                @commentable_id = params[:phone_id]
            elsif params[:order_id]
                @commentable_type = "Order"
                @commentable_id = params[:order_id]
            end
        end
end
