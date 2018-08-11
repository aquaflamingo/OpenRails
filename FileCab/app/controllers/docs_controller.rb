class DocsController < ApplicationController

    before_action :find_doc, only: [:show,:edit,:update,:destroy]
   
    def index 
        @docs = Doc.where(user_id: current_user) 
        # Only display documents that belong to user.

    end
    def show 
       find_doc
    end
    def new 
        @doc = current_user.docs.build
    end
    def create 
        @doc = current_user.docs.build(doc_params)

        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
    end

    def edit 
    end
    def update 
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render 'edit'
            # Render vs redirect, because redit is an http action
        end 
    end
    def destroy 
        @doc.destroy
        redirect_to docs_path
    end
    
    private 
        def find_doc
            # By rails convention, anything you need more than once you should make a method for DRY
            @doc = Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title,:content)
        end 
end
