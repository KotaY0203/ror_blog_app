Rails.application.routes.draw do
  # 一覧
  get "/articles", to: "articles#index", as: "articles"
  
  # 詳細
  get "/articles/detail/:id", to: "articles#detail", as: "articles_detail"
  
  # 新規作成
  get "/articles/post", to: "articles#post", as: "articles_post"
  post "/articles/post_confirm", to: "articles#post_confirm", as: "articles_post_confirm"
  post "/articles/post_done", to: "articles#post_done", as: "articles_post_done"

  # 編集
  get "/articles/edit/:id", to: "articles#edit", as: "articles_edit"
  post "/articles/edit_confirm/:id", to: "articles#edit_confirm", as: "articles_edit_confirm"
  post "/articles/edit_done/:id", to: "articles#edit_done", as: "articles_edit_done"
  
  # 削除
  get "/articles/delete_confirm/:id", to: "articles#delete_confirm", as: "articles_delete_confirm"
  post "/articles/delete/:id", to: "articles#delete", as: "articles_delete"
end
