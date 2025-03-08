# Changelogger

![Changelogger Banner](./assets/banner.png)

<p align="center">
  <a href="https://packagist.org/packages/churchtools/changelogger"><img src="https://poser.pugx.org/churchtools/changelogger/d/total.svg?format=flat-square" alt="Total Downloads"></a>
  <a href="https://packagist.org/packages/churchtools/changelogger"><img src="https://poser.pugx.org/churchtools/changelogger/v/stable.svg?format=flat-square" alt="Latest Stable Version"></a>
  <a href="https://packagist.org/packages/churchtools/changelogger"><img src="https://poser.pugx.org/churchtools/changelogger/license.svg?format=flat-square" alt="License"></a>
  <a href="https://travis-ci.org/churchtools/changelogger"><img src="https://travis-ci.org/churchtools/changelogger.svg?branch=master" alt="Travis Build Status"></a>
</p>

**Changeloggger is a CLI tool to help you create better changelogs**

At ChurchTools we develop a SaaS. To keep our users informed, we write changelogs for every version. We used to add our changelogs to the issue, but many times we forgot to add the changelog—and manual copy 'n' paste is tedious work! This tool helps us to write and create consistent changelogs that are committable so the reviewer can check it before merging.

---

## What does it do?

_Changelogger_ saves each log entry as a YAML file in `changelogs/unreleased`. During the development process many files from different features, bug fixes, and so on find their way into this folder.

We create for each change a different file to easily track them. Adding them to a single file, like `Changelog.md` directly could lead to nasty merge conflicts. One file per change avoids that.

In the end, if a new version is built, _Changelogger_ takes all unreleased changes, sorts them and adds a new release to `CHANGELOG.md`. After that all files in `changelogs/unreleased` are deleted and your project is ready for the next version.

**Changelogger is not taking your git-logs.** There exists many tools that take your git-log and converts commit messages to changelog entries. IMHO, this leads in many cases to bad changelogs. Commit messages are not changelogs. They are pieces of information for developers and not the users. Our changelogs are handcrafted because non-developers, AKA our users, should be able to understand the changes.

## Installation

This package requires PHP 8.1
You can require the package as a dev-dependency

```bash
composer require --dev churchtools/changelogger
```

or install it globally

```bash
composer global require churchtools/changelogger
```

or build a docker image.

```bash
composer run docker:build
```

Then add this to e.g. your `~/.profile`:

```bash
changelogger () {
  docker run --rm -it -v $(PWD):/app changelogger changelogger $@
}
```

## Usage

```bash
# To add a new changelog use `new`.
changelogger new

# When a new version is released run `release` to generate the changelog.
# The <tag> is the version number or build number of the release.
changelogger release <tag>

# Need to start over? Run `clean` to remove all unreleased logs.
changelogger clean
```

![Changelogger Demo](assets/changelogger-demo.gif)

## License

[churchtools/changelogger](https://github.com/churchtools/changelogger) is licensed under the
[Apache License 2.0](LICENSE)
