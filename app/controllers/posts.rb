PostsTest::App.controllers :posts do
  
  get :index, :map => '/foo/bar' do
    @posts = Post.all
    @post = Post.new
    render 'index'
  end

  post :create, map: 'post' do 
    @post = Post.new(params[:post])
    @post.save 
    redirect_to "/foo/bar"
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
