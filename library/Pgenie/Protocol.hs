module Pgenie.Protocol where

import Coalmine.Prelude hiding (Version)
import qualified Domain
import qualified DomainAeson
import qualified DomainCereal
import qualified DomainOptics
import qualified Test.QuickCheck.Arbitrary.Generic as GenericArbitrary

Domain.declare
  Nothing
  ( mconcat
      [ Domain.enumDeriver,
        Domain.boundedDeriver,
        Domain.showDeriver,
        Domain.eqDeriver,
        Domain.ordDeriver,
        Domain.genericDeriver,
        Domain.constructorIsLabelDeriver,
        Domain.accessorIsLabelDeriver,
        DomainAeson.toJsonDeriver,
        DomainOptics.labelOpticDeriver,
        DomainCereal.serializeDeriver
      ]
  )
  =<< Domain.loadSchema "domain/protocol.domain.yaml"

deriving via
  (GenericArbitrary.GenericArbitrary Request)
  instance
    GenericArbitrary.Arbitrary Request

deriving via
  (GenericArbitrary.GenericArbitrary RequestProcess)
  instance
    GenericArbitrary.Arbitrary RequestProcess

deriving via
  (GenericArbitrary.GenericArbitrary Response)
  instance
    GenericArbitrary.Arbitrary Response

deriving via
  (GenericArbitrary.GenericArbitrary Version)
  instance
    GenericArbitrary.Arbitrary Version

instance BroadPrinting Request where
  toBroadBuilder = to . renderAsYamlText

instance BroadPrinting RequestProcess where
  toBroadBuilder = to . renderAsYamlText

instance BroadPrinting Response where
  toBroadBuilder = to . renderAsYamlText

instance BroadPrinting Version where
  toBroadBuilder = to . renderAsYamlText
