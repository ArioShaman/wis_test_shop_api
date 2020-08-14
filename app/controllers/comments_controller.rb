class CommentsController < ApplicationController
    before_action   :set_commentable, 
                    only: [
                        :index, 
                        :create, 
                        :add_sub_comment
                    ]


    def index
        @comments = Comment.where( 
            commentable_id: @commentable_id, 
            commentable_type: @commentable_type
        ).where(comment_id: nil)

        render json: @comments, 
                include: "**", 
                adapter: :json,
                status: 200
    end

    def create

        # Define comment owner
        @klass = @commentable_type.capitalize.constantize
        @model = @klass.find(@commentable_id)
        
        # Get data from api
        @guest_user = GuestUser.find_by!(token: params[:token])
        
        @model.comments.create(
            text: params["text"],
            guest_user: @guest_user
        )

        render json: {
            status: :ok
        }
    end

    def add_sub_comment

        # Define comment owner
        @klass = @commentable_type.capitalize.constantize
        @model = @klass.find(@commentable_id)

        # Get data from api
        @guest_user = GuestUser.find_by!(token: params[:token])
        @parent_comment = Comment.find(params[:comment_id])

        @model.comments.create(
            text: params["text"],
            guest_user: @guest_user,
            comment: @parent_comment
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
