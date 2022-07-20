module Pgenie.Protocol.V1 where

import Coalmine.Prelude
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
  =<< Domain.loadSchema "domain/v1.domain.yaml"

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
  (GenericArbitrary.GenericArbitrary Artifact)
  instance
    GenericArbitrary.Arbitrary Artifact

instance BroadPrinting Request where
  toBroadBuilder = to . renderAsYamlText

instance BroadPrinting RequestProcess where
  toBroadBuilder = to . renderAsYamlText

instance BroadPrinting Response where
  toBroadBuilder = to . renderAsYamlText

instance BroadPrinting Artifact where
  toBroadBuilder = to . renderAsYamlText
