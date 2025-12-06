#!/usr/bin/env sh

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

APP_BASE_NAME=`basename "$0"`
APP_HOME=`cd "$(dirname "$0")" && pwd`

DEFAULT_JVM_OPTS=""

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support.
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  Darwin* )
    darwin=true
    ;;
  SunOS* )
    sunos=true
    ;;
  AIX* )
    aix=true
    ;;
  * )
    ;;
esac

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname "$PRG"`/.." >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
fi

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "true" -o "$darwin" = "true" ] ; then
    ulimit -n $MAX_FD >/dev/null 2>&1
    if [ $? -ne 0 ] ; then
        warn "Could not set maximum file descriptor limit: $MAX_FD"
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    GRADLE_OPTS="$GRADLE_OPTS ""-Xdock:name=$APP_NAME" ""-Xdock:icon=$APP_HOME/media/gradle.icns"""
fi

# Split up the JVM_OPTS And GRADLE_OPTS values into an array, following the shell quoting rules
function splitJvmOpts() {
    JVM_OPTS=()
    while [ "$1" != "" ] ; do
        if [ "${1:0:1}" = '"' ]; then
            value=""
            while [ "${1: -1}" != '"' ] ; do
                value="$value ${1:1}"
                shift
            done
            JVM_OPTS+="$value ${1:0:${#1}-1}"
        else
            JVM_OPTS+="$1"
        fi
        shift
    done
}

splitJvmOpts $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS

exec "$JAVACMD" ${JVM_OPTS[@]} -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
