# Helper Variables
# The command to replace the @VERSION in the files with the actual version
HEAD_SHA=$(git log -1 --format=format:"%H")
BUILD_SHA=$(git log -1 --format=format:"Git Build: SHA1: %H <> Date: %cd")
VER_MIN="/*! jQuery Mobile v$BUILD_SHA jquerymobile.com | jquery.org/license !*/"
VER_OFFICIAL=$(cat version.txt)
SED_VER_REPLACE='s/__version__/"$VER_OFFICIAL"/g'
SED_INPLACE_EXT="whyunowork"

function sed_ver_api {
  sed "$SED_VER_REPLACE"
}

function ver {
  sed "s/v@VERSION/$BUILD_SHA/"
}

# The output folder for the finished files
OUTPUT="compiled"

# The name of the files
NAME="jquery.mobile"
BASE_NAME="jquery.mobile"
THEME_FILENAME="jquery.mobile.theme"
STRUCTURE="jquery.mobile.structure"

# The CSS theme being used
THEME="default"

# If node is available then use node to run r.js
# otherwise use good old rhino/java
NODE=/usr/local/bin/node

RUN_JS='java -XX:ReservedCodeCacheSize=64m -classpath build/js.jar:build/google-compiler-20111003.jar org.mozilla.javascript.tools.shell.Main'

if [ -x $NODE ]; then
	RUN_JS=${NODE}
fi