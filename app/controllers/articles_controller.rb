class ArticlesController < ApplicationController
    def index
        if !params[:condition].blank?
            @articles = Article.where(deleted_at: Article::FLAG_NOT_DELETED).where('title LIKE ?', "%#{params[:condition]}%")
        else
            @articles = Article.where(deleted_at: Article::FLAG_NOT_DELETED)
        end
    end

    def detail
        @article = Article.find(params[:id])
    end

    def post
        @title = params[:title] ? params[:title] : ""
        @content = params[:content] ? params[:content] : ""
    end

    def post_confirm
        @title = params[:title] ? params[:title] : ""
        @content = params[:content] ? params[:content] : ""

        article = Article.new(title: @title, content: @content)

        # invalidならpostへ、入力値を保持させてリダイレクト
        if article.invalid?
            redirect_to articles_post_path(title: @title, content: @content),
             flash: {
                 title_error: article.errors.messages[:title], 
                 content_error: article.errors.messages[:content],
                 message: "入力内容に誤りがあります"
            }
        end
    end

    def post_done
        @title = params[:title] ? params[:title] : ""
        @content = params[:content] ? params[:content] : ""

        article = Article.new(title: @title, content: @content)
        article.save
    end

    def edit
        article = Article.find(params[:id])
        saved_title = article.title ? article.title : ""
        saved_content = article.content ? article.content : ""

        @title = params[:title] ? params[:title] : saved_title
        @content = params[:content] ? params[:content] : saved_content
    end

    def edit_confirm
        @title = params[:title] ? params[:title] : ""
        @content = params[:content] ? params[:content] : ""

        article = Article.new(title: @title, content: @content)

        # invalidならpostへ　入力値を保持させてリダイレクト
        if article.invalid?
            redirect_to articles_edit_path(title: @title, content: @content),
             flash: {
                 title_error: article.errors.messages[:title], 
                 content_error: article.errors.messages[:content],
                 message: "入力内容に誤りがあります"
            }
        end
    end

    def edit_done
        inputted_title = params[:title]
        inputted_content = params[:content]

        article = Article.find(params[:id])

        article.update(title: inputted_title, content: inputted_content)
    end

    def delete_confirm
        @article = Article.find(params[:id])
    end

    def delete
        # 論理削除
        article = Article.find(params[:id])
        article.update(deleted_at: Time.current)
    end
end