require 'sinatra'
# require 'sinatra/reloader'
require 'redcarpet'
require 'yaml'
require 'time'
require './helpers/markdown'

helpers Sinatra::MarkdownHelper
helpers Sinatra::TocHelper

class Post
    attr_reader :title,:title_ja,:date,:body,:category

    # キーワード引数にしてハッシュを受け取る
    def initialize(title:,title_ja:,date:,body:,category:)
        @title = title
        @title_ja = title_ja
        @date = date
        @body = body
        @category = category
    end

    def self.category_posts(category_name)
        # Postクラスのインスタンスを配列に入れて返す
        root = File.expand_path('../',__FILE__)
        category_posts = Dir.glob("#{root}/articles/#{category_name}/*.md").map do |file|
            # create_post(file)
            _, meta, content = File.read(file).split("---\n", 3)
            file_data = YAML.load(meta).to_h{|k,v|[k.to_sym,v]}
            file_data[:title] = File.basename(file,".md")
            file_data[:body] = content
            file_data[:category] = category_name
            # Postのインスタンスを返す
            Post.new(file_data)
        end
        sort_by_cleated_at(category_posts)
    end
    
    def self.sort_by_cleated_at(posts)
        posts.sort_by!{|post| post.cleated_at}
        # posts.reverse!
    end

    def next_article
        Post.category_posts(category).find{|a| a.cleated_at > self.cleated_at}
    end

    def prev_article
        Post.category_posts(category).reverse.find{|a| a.cleated_at < self.cleated_at}
    end

    def cleated_at
        Time.parse date.to_s
    end
end

root = File.expand_path('../',__FILE__)

categories = Dir.children("#{root}/articles")

categories.each do |category_name|
# Post.categories.each do |category_name|
    current_category = Post.category_posts(category_name)

    # 各記事
    
    current_category.each do |post|
        get "/#{category_name}/#{post.title}" do
            slim :post, :locals => {:category_name => category_name,:current_category => current_category,:current_article => post,:next_article => post.next_article,:prev_article => post.prev_article}
        end
    end

    # カテゴリ内記事一覧
    get "/#{category_name}" do
        redirect "/#{category_name}/#{current_category[0].title}"
        # slim :category, :locals => {:category => category_name}
    end
end

# カテゴリ一覧
get '/' do
    @path_name = request.path_info
    slim :index, :locals => {:categories => categories,:current_article => nil}
end


