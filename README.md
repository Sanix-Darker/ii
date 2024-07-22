# ii

I really don't know how to put this up... let's break that with some use cases :

- You are working on branch x, that is linked to env_x with dependency x, you switch to another branch, x is still in your environment but not in lock/config file, you're out of sync.
- ~Sometimes~ (**EVERY SINGLE TIME**), you're working on a team project, you often find yourself always checking after a pull/checkout, if **xxx install** was run to be sync with the main(remote) branch, because, deps are added/upgraded overtime...

I think i should be aware if i really need to run that install command or not.
So i made `_ii_`(Install It), it's a small **git/hooks** that will notify if you need to run an install command to be sync with the main/master version of the codebase in terms of dependencies.


https://github.com/user-attachments/assets/6fef9d11-1923-4034-9df7-b3f3af32d862


## REQUIREMENTS

- git

## FEATURES

Here's a list of the languages/stacks and their associated package management tools supported by ii:

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
