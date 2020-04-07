# File.mtime('articles/sinatra/project.md') #=> 2020-04-06 22:21:00.164515787 +0900

require 'open-uri'

# require 'uri'
# p URI.join('http://www.ruby-lang.org/', '/ja/man-1.6/')
# => #<URI::HTTP:0x2010017a URL:http://www.ruby-lang.org/ja/man-1.6/>

require 'Fileutils'

# プロジェクトフォルダの絶対パスを生成する
root = File.expand_path('../../',__FILE__) #=>/Users/MAY/test_sinatra

build_dir = File.join(root,'build')
public_dir = File.join(build_dir,'public')

# build/public/stylesheetsディレクトリを作る
# Dir.mkdir("#{root}/build")
style_dir = File.jois(public_dir,'stylesheets')
FileUtils.mkdir_p(style_dir) unless Dir.exist?(style_dir)

# img,jsディレクトリのコピー
publics = ['img','js']
publics.each do |dir|
    static_dir = File.join(root,'public',dir)
    FileUtils.cp_r(static_dir,public_dir)
end

css = Dir.glob("#{root}/public/**/*.css")
#=> ["/Users/MAY/test_sinatra/public/stylesheets/solarized-light.css", "/Users/MAY/test_sinatra/public/stylesheets/style.css", "/Users/MAY/test_sinatra/public/stylesheets/normalize.css"]

# stylesheets配下にcssをすべてコピーする
FileUtils.cp(css,style_dir)

def file_write(file_name,text)
    File.open(file_name, "w") { |f| f.puts text }
end

categories = Dir.children("./articles") #=>["sinatra", "sass"]

categories.each do |category|
    # カテゴリ名のディレクトリを作る
    cate_dir = File.join(build_dir,category)
    Dir.mkdir(cate_dir)

    posts = Dir.glob("#{root}/articles/#{category}/*.md").map do |file|
        File.basename(file,".md")
    end

    # 各記事のURLにアクセスしてbodyをhtmlファイルに書き出す
    posts.each do |post|
        OpenURI.open_uri("http://localhost:4567/#{category}/#{post}") { |io|
            file_write("#{cate_dir}/#{post}.html",io.read)
        }
    end
end
