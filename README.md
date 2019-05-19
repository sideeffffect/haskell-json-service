# haskell-json-service

[![Build Status](https://travis-ci.org/sideeffffect/haskell-json-service.svg?branch=master)](https://travis-ci.org/sideeffffect/haskell-json-service)

## Run & Run Tests

```
stack run
```

```
stack test
```

## Experiment

```
curl localhost:8080
```

```
curl -H "Content-Type: application/json" -d '{ "getX": 1, "getY": 2 }' localhost:8080/sum
```

```
$ ./src/Lib.hs
```

## Setup

### Stack installation
[`https://www.haskellstack.org/`](https://www.haskellstack.org/)
```
curl -sSL https://get.haskellstack.org/ | sh
```

### Haskell Language Server
(can take a long time)
```
git clone https://github.com/haskell/haskell-ide-engine --recursive
cd haskell-ide-engine && ./install.hs build-all
```

[`https://marketplace.visualstudio.com/items?itemName=alanz.vscode-hie-server`](https://marketplace.visualstudio.com/items?itemName=alanz.vscode-hie-server)

### Debugging in VS Code

```
stack install phoityne-vscode haskell-dap
```

[`https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode`](https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode)

