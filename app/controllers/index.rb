get '/' do
  @categories = Category.all

  erb :index
end
 

get '/:category_title' do
  @category = Category.find_by_title(params[:category_title])
  @posts = @category.posts

  erb :category
end

get '/:category/post/new' do
  @category = Category.find_by_title(params[:category])
  
  erb :new_post
end

post '/create_new_post' do
  @category = Category.find(params[:category_id])
  @post = @category.posts.create(params[:post])

  redirect "/#{@category.title}/#{@post.id}"
end

get '/:category/:post_id' do
  @category = Category.find_by_title(params[:category])
  @post = Post.find(params[:post_id])

  erb :post
end

get '/:category/:post_id/edit' do

  if params[:key] == Post.find(params[:post_id]).key
    @category = Category.find_by_title(params[:category])
    @post = Post.find(params[:post_id])
 
    erb :edit_post
  else
    redirect '/'
  end
end


