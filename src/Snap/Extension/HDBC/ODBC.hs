{-|

'Snap.Extension.HDBC.ODBC' implements a 'MonadHDBC' by using
a connection to an ODBC database.

-}

module Snap.Extension.HDBC.ODBC
  ( hdbcInitializer
  , module Snap.Extension.HDBC
  ) where

import Control.Monad.IO.Class ( liftIO )

import Database.HDBC         ( ConnWrapper (..) )
import Database.HDBC.ODBC ( connectODBC )

import Snap.Extension ( Initializer, mkInitializer )
import Snap.Extension.HDBC



-- | The Initializer for 'Connection'.
-- The 'String' provides arguments for the ODBC database connection.
hdbcInitializer :: String -> Initializer HDBCState
hdbcInitializer args =
  liftIO (connectODBC args) >>= mkInitializer . HDBCState . ConnWrapper


