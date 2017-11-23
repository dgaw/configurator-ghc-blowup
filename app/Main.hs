{-# LANGUAGE OverloadedStrings   #-}

module Main where

import qualified Data.Configurator as C
import Data.Text as T

data AppCfg
  = AppCfg
  { acBaseUrl             :: T.Text
  , acDbName              :: T.Text
  , acDbHost              :: T.Text
  , acDbUser              :: T.Text
  , acDbPass              :: T.Text
  , acSessionCookie       :: T.Text
  , acPort                :: Int
  , acName                :: T.Text
  , acDesc                :: T.Text
  , acEmailName           :: T.Text
  , acEmailAddr           :: T.Text
  , acMailGunApiKey       :: T.Text
  , acMailGunDomain       :: T.Text
  } deriving Show

parseConfig :: FilePath -> IO AppCfg
parseConfig cfgFile =
    do cfg <- C.load [C.Required cfgFile]
       baseUrl <- C.require cfg "baseUrl"
       dbName <- C.require cfg "dbName"
       dbHost <- C.require cfg "dbHost"
       dbUser <- C.require cfg "dbUser"
       dbPass <- C.require cfg "dbPass"
       sessCookie <- C.require cfg "sessionCookie"
       port <- C.require cfg "port"
       name <- C.require cfg "siteName"
       desc <- C.require cfg "siteDescription"
       emailName <- C.require cfg "emailName"
       emailAddr <- C.require cfg "emailAddr"
       mailGunApiKey <- C.require cfg "mailGunApiKey"
       mailGunDomain <- C.require cfg "mailGunDomain"
       return (AppCfg baseUrl dbName dbHost dbUser dbPass sessCookie port
                      name desc emailName emailAddr mailGunApiKey mailGunDomain)

main :: IO ()
main = do
  _ <- parseConfig "dummy.cfg"
  putStrLn "Done"
