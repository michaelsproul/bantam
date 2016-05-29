{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Bantam.Service.View.Login (
    loginView
  ) where

import           Bantam.Service.Data
import           Bantam.Service.Path

import           P

import           Text.Blaze.Html (Html, (!))
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as HA


loginView :: Maybe Email -> Html
loginView e =
  H.main $ do
    H.h1 "Login"
    H.form
      ! HA.action (H.textValue $ encodedPathText loginPath ())
      ! HA.method "post"
      $ do

      H.div ! HA.class_ ("form-group" <> maybe "" (const " has-error") e) $ do
        H.label ! HA.for "email" $
          "Email"
        H.input
          ! HA.class_ "form-control"
          ! HA.type_ "email"
          ! HA.name "email"
          ! HA.value (H.textValue . maybe "" renderEmail $ e)

      H.div ! HA.class_ "form-group" $ do
        H.label ! HA.for "password" $
          "Password"
        H.input
          ! HA.class_ "form-control"
          ! HA.type_ "password"
          ! HA.name "password"
          ! HA.value ""

      H.button ! HA.class_ "btn btn-default" ! HA.type_ "submit" $
        "Login"
