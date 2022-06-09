module PgenieProtocol.Model where

import qualified Domain
import qualified DomainCereal
import qualified DomainOptics
import PgenieProtocol.Prelude

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
