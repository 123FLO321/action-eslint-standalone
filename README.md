# GitHub Action for Standalone ESLint

This Action executes [ESLint](https://github.com/eslint/eslint) and generates annotations from ESLint Violations.

## Usage

An example workflow(`.github/workflows/eslint.yml`) to executing ESLint follows:

```yaml
name: SwiftLint

on:
  pull_request:
    paths:
      - '.github/workflows/eslint.yml'
      - '.eslintrc.json'
      - '**/*.js'

jobs:
  SwiftLint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: GitHub Action for ESLint
        uses: 123FLO321/action-eslint-standalone@1.0.0
      - name: GitHub Action for ESLint with --max-warnings=0
        uses: 123FLO321/action-eslint-standalone@1.0.0
        with:
          args: --max-warnings=0
```

## Author

Florian Kostenzer

## License

[MIT](LICENSE)
