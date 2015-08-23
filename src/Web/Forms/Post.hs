{-# LANGUAGE OverloadedStrings #-}
module Web.Forms.Post where

import Model.CoreTypes

import Text.Blaze.Html (Html)
import Text.Digestive hiding (Post)
import Text.Digestive.Bootstrap

postForm :: Monad m => Form Html m Post
postForm =
    Post <$> "title" .: text Nothing
         <*> "date" .: stringRead "Couldn't parse as UTCTime" Nothing
         <*> "content" .: text Nothing

postFormSpec :: FormMeta
postFormSpec =
    FormMeta
    { fm_method = POST
    , fm_target = "/write"
    , fm_elements =
        [ FormElement "title" (Just "Titel") InputText
        , FormElement "date" (Just "Datum") InputText
        , FormElement "content" (Just "Inhalt") $ InputTextArea (Just 30) (Just 10)
        ]
    , fm_submitText = "Publish"
    }
