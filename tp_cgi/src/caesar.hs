import Data.Maybe
import Text.XHtml
import Network.CGI
import Data.Char (chr, isLower, ord)

shiftChar :: Int -> Char -> Char
shiftChar n c | isLower c = chr $ ord 'a' + ((n + ord c - ord 'a') `mod` 26)
              | otherwise = c

codeCaesar :: Int -> String -> String
codeCaesar n = map (shiftChar n)

main :: IO ()
main = runCGI $ handleErrors cgiMain

cgiMain :: CGI CGIResult
cgiMain = do
  key <- getInput "key"
  msg <- getInput "msg"
  output $ renderPage key msg

renderPage :: Maybe String -> Maybe String -> String
renderPage key msg = renderHtml $
  body << (h1 << "Ave Cesar !")
          +++ (p << (codeCaesar (read (fromMaybe "0" key)::Int) (fromMaybe "" msg)))
