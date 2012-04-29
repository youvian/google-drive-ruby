# Author: Hiroshi Ichikawa <http://gimite.net/>
# The license of this source is "New BSD Licence"

require "cgi"


module GoogleSpreadsheet
    
    module Util #:nodoc:
        
        EXT_TO_CONTENT_TYPE = {
            ".csv" =>"text/csv",
            ".tsv" =>"text/tab-separated-values",
            ".tab" =>"text/tab-separated-values",
            ".doc" =>"application/msword",
            ".docx" => "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            ".ods" =>"application/x-vnd.oasis.opendocument.spreadsheet",
            ".odt" =>"application/vnd.oasis.opendocument.text",
            ".rtf" =>"application/rtf",
            ".sxw" =>"application/vnd.sun.xml.writer",
            ".txt" =>"text/plain",
            ".xls" =>"application/vnd.ms-excel",
            ".xlsx" => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            ".pdf" =>"application/pdf",
            ".png" =>"image/png",
            ".ppt" =>"application/vnd.ms-powerpoint",
            ".pps" =>"application/vnd.ms-powerpoint",
            ".htm" =>"text/html",
            ".html" =>"text/html",
            ".zip" =>"application/zip",
            ".swf" =>"application/x-shockwave-flash",
        }
        
      module_function
        
        def encode_query(params)
          return params.map(){ |k, v| CGI.escape(k.to_s()) + "=" + CGI.escape(v.to_s()) }.join("&")
        end
        
        def concat_url(url, piece)
          (url_base, url_query) = url.split(/\?/, 2)
          (piece_base, piece_query) = piece.split(/\?/, 2)
          result_query = [url_query, piece_query].select(){ |s| s && !s.empty? }.join("&")
          return (url_base || "") +
              (piece_base || "") +
              (result_query.empty? ? "" : "?#{result_query}")
        end
        
        def h(str)
          return CGI.escapeHTML(str.to_s())
        end
        
    end
    
end
