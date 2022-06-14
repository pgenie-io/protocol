module PgenieProtocol.V1 where

import qualified Domain
import qualified DomainCereal
import qualified DomainOptics
import PgenieProtocol.Prelude
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
