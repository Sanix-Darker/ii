# ii

I really don't know how to put this, but ~sometimes~, i found myself out of sync with dependencies from the main/master branch
on a project am working with team members, and i need times to times, after a `checkout -b` or `branch` creation, to try reinstalling that, sometimes deps were added/removed or just never touched... i think i should be aware on if i really need to run that or not.

So i made `ii`(Install It), it's basically a **git/hooks** that will notify if you need to run a command to be sync with the main/master version of the codebase in terms of dependencies.

## FEATURES

Here's a list of the languages/stacks and their associated package management tools supported:

| Language/Stack       | Package Manager           | Lock/Config File         | Install Command                |
|----------------------|---------------------------|--------------------------|--------------------------------|
| Python               | pip                       | requirements.txt         | `pip install -r requirements.txt` |
| Python               | Poetry                    | poetry.lock              | `poetry install`               |
| PHP                  | Composer                  | composer.lock            | `composer install`             |
| JavaScript/Node.js   | npm                       | package-lock.json        | `npm install`                  |
| JavaScript/Node.js   | Yarn                      | yarn.lock                | `yarn install`                 |
| JavaScript/Node.js   | pnpm                      | pnpm-lock.yaml           | `pnpm install`                 |
| Ruby                 | Bundler                   | Gemfile.lock             | `bundle install`               |
| Python               | Pipenv                    | Pipfile.lock             | `pipenv install`               |
| Rust                 | Cargo                     | Cargo.lock               | `cargo build`                  |
| Go                   | Go modules                | go.mod                   | `go mod tidy`                  |
| Go                   | Dep                       | Gopkg.lock               | `dep ensure`                   |
| Java                 | Gradle                    | build.gradle             | `gradle build`                 |
| Java                 | Maven                     | pom.xml                  | `mvn install`                  |
| General              | Make                      | Makefile                 | `make`                         |
| Python               | Conda                     | environment.yml          | `conda env create -f environment.yml` |
| Elixir               | Mix                       | mix.lock                 | `mix deps.get`                 |
| Erlang               | Rebar                     | rebar.lock               | `rebar3 get-deps`              |
| Swift                | Carthage                  | Cartfile.resolved        | `carthage bootstrap`           |
| Swift/Objective-C    | CocoaPods                 | Podfile.lock             | `pod install`                  |
| Clojure              | Leiningen                 | project.clj              | `lein deps`                    |
| Clojure              | Tools.deps                | clj-deps.edn             | `clojure -A:deps`              |
| C++                  | CMake                     | CMakeLists.txt           | `cmake .`                      |
| Crystal              | Shards                    | shard.lock               | `shards install`               |
| Scala                | sbt                       | build.sbt                | `sbt update`                   |
| Clojure              | deps.edn                  | deps.edn                 | `clojure -A:deps`              |
| PureScript           | Spago                     | spago.dhall              | `spago install`                |
| Nix                  | Nix                       | default.nix              | `nix-shell`                    |
| Nix                  | Nix Flakes                | flake.nix                | `nix develop`                  |
| D                    | Dub                       | dub.json                 | `dub upgrade`                  |
| D                    | Dub                       | dub.selections.json      | `dub upgrade`                  |


## HOW TO USE

Place all 3 files(post-merge, post-checkout, ii.sh) inside the `.git/hooks` of your project.
That's it.

