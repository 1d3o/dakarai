# Application

## Installation

```shell
git clone application

cd application

bundle install

rails db:migrate

rails s
```

## Configuration

### Add precommit on git hooks to run tests before commit

```shell
cp bin/pre-commit ./git/hooks/pre-commit
chmod +x .git/hooks/post-commit
```

## Deploy

```shell
sh bin/deploy TAG_NAME
```
