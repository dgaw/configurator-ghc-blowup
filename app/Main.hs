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
  , acPort                :: T.Text
  , acName                :: T.Text
  , acDesc                :: T.Text
  , acEmailName           :: T.Text
  , acEmailAddr           :: T.Text
  , acMailGunApiKey       :: T.Text
  , acMailGunDomain       :: T.Text
  , extraConf1            :: T.Text
  , extraConf2            :: T.Text
  , extraConf3            :: T.Text
  , extraConf4            :: T.Text
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
       extraConf1 <- C.require cfg "extraConf1"
       extraConf2 <- C.require cfg "extraConf2"
       extraConf3 <- C.require cfg "extraConf3"
       extraConf4 <- C.require cfg "extraConf4"
       return (AppCfg baseUrl dbName dbHost dbUser dbPass sessCookie port
                      name desc emailName emailAddr mailGunApiKey mailGunDomain
                      extraConf1 extraConf2 extraConf3 extraConf4)

main :: IO ()
main = do
  _ <- parseConfig "dummy.cfg"
  putStrLn "Done"
