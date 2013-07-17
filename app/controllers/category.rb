
get '/:category_title' do
  @category = Category.find_by_title(params[:category_title])
  @posts = @category.posts

  erb :category
end

get '/:category_id/post/new' do
  @category = Category.find(params[:category_id])
  
  erb :new_post
end

get '/:category_title/:post_id' do
  @category = Category.find_by_title(params[:category_title])
  @post = Post.find(params[:post_id])

  erb :post
end

post '/:category_id/create_new_post' do
  @category = Category.find(params[:category_id])
  @post = @category.posts.create(params[:post])

  session[:id] = @post.id

  redirect "/#{@category.title}/#{@post.id}"
end


get '/:category_title/:post_id/edit' do

  if params[:key] == Post.find(params[:post_id]).key
    @category = Category.find_by_title(params[:category_title])
    @post = Post.find(params[:post_id])
 
    erb :edit_post
  else
    halt 401, "Not authorized\n"
  end
end


