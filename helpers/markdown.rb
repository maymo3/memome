require 'sinatra'
# require 'redcarpet'
module Sinatra
    module MarkdownHelper
        def markdown(text)
            render_options = {
                # filter_html: true, # htmlタグの入力を無効化(サニタイズ)
                with_toc_data: true,
                hard_wrap:   true  # 空行を改行ではなく、改行を改行に変換
            }
            renderer = Redcarpet::Render::HTML.new(render_options)
        
            extensions = {
                # autolink:            true,
                fenced_code_blocks:  true,
                lax_spacing:         true,
                no_intra_emphasis:   true,
                strikethrough:       true,
                superscript:         true,
                tables:              true,
                space_after_headers: true
            }
            # これで変換され、HTMLを返す
            Redcarpet::Markdown.new(renderer, extensions).render(text)
        end
    end

    module TocHelper
        def toc(text)
            toc_option = {
            nesting_level: 1
            }
        
            toc_renderer = Redcarpet::Render::HTML_TOC.new
            toc = Redcarpet::Markdown.new(toc_renderer, toc_option)
            toc.render(text) # .html_safe
        end
    end

    helpers MarkdownHelper, TocHelper
end