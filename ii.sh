#!/usr/bin/bash

NC='\033[0m' # No Color
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'

# files path and defined actions
declare -A target_action=(
    ["requirements.txt"]="pip install -r requirements.txt"
    ["poetry.lock"]="poetry install"
    ["composer.lock"]="composer install"
    ["package-lock.json"]="npm install"
    ["yarn.lock"]="yarn install"
    ["pnpm-lock.yaml"]="pnpm install"
    ["pnpm-lock.yml"]="pnpm install"
    ["Gemfile.lock"]="bundle install"
    ["Pipfile.lock"]="pipenv install"
    ["Cargo.lock"]="cargo build"
    ["go.mod"]="go mod tidy"
    ["Gopkg.lock"]="dep ensure"
    ["build.gradle"]="gradle build"
    ["pom.xml"]="mvn install"
    ["Makefile"]="make"
    ["environment.yml"]="conda env create -f environment.yml"
    ["environment.yaml"]="conda env create -f environment.yaml"
    ["mix.lock"]="mix deps.get"
    ["rebar.lock"]="rebar3 get-deps"
    ["Cartfile.resolved"]="carthage bootstrap"
    ["Podfile.lock"]="pod install"
    ["project.clj"]="lein deps"
    ["clj-deps.edn"]="clojure -A:deps"
    ["CMakeLists.txt"]="cmake ."
    ["shard.lock"]="shards install"
    ["build.sbt"]="sbt update"
    ["deps.edn"]="clojure -A:deps"
    ["spago.dhall"]="spago install"
    ["default.nix"]="nix-shell"
    ["flake.nix"]="nix develop"
    ["dub.json"]="dub upgrade"
    ["dub.selections.json"]="dub upgrade"
)

alert() {
    filename="$1"
    shift
    action="$@"
    echo -e ":${YELLOW}${filename}${NC} was changed. please run ${CYAN}${action}${NC}:"
}

is_changed() {
    # get list of files changed from git and grep
    changed_files="$(git diff-tree -r --name-status --no-commit-id $3 $4)"
    echo "$changed_files" | grep -Eq "$1"
}

alert_on_changed(){
    is_changed $1 $3 $4 && alert $1 "$2"
}

trigger_on_action() {
    for filename in "${!target_action[@]}"; do
        local command="${target_action[$filename]}"
        alert_on_changed $filename "$command" $1 $2
    done

    # TODO: Specific actions on special changes for specific files/directories... inside .precommit.yml
}
