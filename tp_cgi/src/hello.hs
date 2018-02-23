import Data.Maybe
import Network.CGI
import Text.XHtml

main :: IO ()
main = runCGI $ handleErrors cgiMain

cgiMain :: CGI CGIResult
cgiMain = do
  name <- getInput "name"
  output $ renderPage name

renderPage :: Maybe String -> String
renderPage name = renderHtml $
  body << (h1 << ("Hello " ++ fromMaybe "unknown" name)
          +++ (p << ("13 * 37 = " ++ show (13*37))))
