PostsTest::App.controllers :posts do
  
  get :padrino_index, :map => '/' do
    @posts = Post.all
    @post = Post.new
    render 'index'
  end

  post :create, map: 'post' do 
    @post = Post.new(params[:post])
    @post.save 
    # redirect_to "/"
    redirect url_for(:posts, :padrino_index)
  end

  delete :delete, map: "post/:id/delete" do 
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect url_for(:posts, :padrino_index)
  end
  get :delete, map: "post/:id/delete" do 
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect url_for(:posts, :padrino_index)
  end
  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
