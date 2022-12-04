all: format test-strictly

format:
	path=pgenie-protocol.cabal && cabal-fmt -c --indent 2 $$path || cabal-fmt -i $$path
	ormolu --mode inplace -ce $$(find . -name "*.hs" -not -path "./.stack-snapshot/*" -not -path "./dist/*" -not -path "./dist-newstyle/*" -not -path "./.stack-work/*")

build-fast:
	stack build --fast --test --no-run-tests --ghc-options "-j -threaded +RTS -A128m -n2m -RTS -fno-warn-typed-holes -fdefer-typed-holes"

build-strictly:
	stack build --test --no-run-tests --ghc-options "-j -threaded +RTS -A128m -n2m -RTS -Werror=incomplete-patterns -Wincomplete-patterns -Wcompat -Widentities -Wincomplete-record-updates -Wincomplete-uni-patterns -Wmissing-home-modules -Wpartial-fields -Wredundant-constraints"

test-fast:
	stack build --fast --test --ghc-options "-j -threaded +RTS -A128m -n2m -RTS -fno-warn-typed-holes -fdefer-typed-holes"

test-strictly:
	stack build --test --ghc-options "-j -threaded +RTS -A128m -n2m -RTS -Werror=incomplete-patterns -Wincomplete-patterns -Wcompat -Widentities -Wincomplete-record-updates -Wincomplete-uni-patterns -Wmissing-home-modules -Wpartial-fields -Wredundant-constraints"

run-strictly: build-strictly
	stack run

run-fast: build-fast
	stack run

clean:
	stack clean

build: build-fast

test: test-fast

run: run-fast
