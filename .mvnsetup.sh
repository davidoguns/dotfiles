# Maven environment and help set up
# That should absolutely be run after Java set up

MAVEN_HOME=/opt/mvn
PATH=$MAVEN_HOME/bin:$PATH

# $1: fully qualified name of groupId:artifactId
# all other args aren't positional:
#  -i == interactive mode
mvn_new_project() {
    if ! [[ $1 =~ ":" ]]; then
        echo "Must include ':' character to separate groupID:artifactID"
        return 1
    fi
    local groupID=$(echo "$1" | awk -F ':' '{print $1}')
    local artifactID=$(echo "$1" | awk -F ':' '{print $2}')
    echo "Creating new MVN project..."
    echo "groupID=$groupID"
    echo "artifactID=$artifactID"
    local interactiveMode="false"
    local executeCmd=1:while

    shift
    while [ $# -ne 0 ]
    do
        case "$1" in 
            "-i")
                interactiveMode="true";;
            "-c")
                executeCmd=0;;
            "-?")
                echo "mvn_new_project groupID:artifactID <args>"
                echo " -i:     sets interactive mode to true. Default: false"
                echo " -q:     Do not execute cmd. Only outputs it. Default: false"
                return 0
                ;;
        esac
        shift # will ignore other args
    done

    cmd="mvn archetype:generate -DgroupId=$groupID -DartifactId=$artifactID -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=$interactiveMode"
    echo "Executing command:\n$cmd"
    if [ $executeCmd -eq 1 ]; then
        $cmd
    fi
}

mvn_get_variable() {
    # possible improvments would be supporting flags that change the formatting to possibly
    # only show the value(s) of the requested variables, or use different formatting that
    # can make it slightly easier to use within a longer sequence of CLI pipes and filters.
    # As-is, this is human pretty printing
    while [ $# -ne 0 ]
    do
        #the order of '-q -DforceStdout' matters below
        local cmd="mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=$1 -q -DforceStdout"
        local value=$($cmd)
        echo "\${$1} = [$value]"
        shift
    done
}

mvn_get_run_classpath() {
    local outputDir=$(mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=project.build.directory -q -DforceStdout)
    local jarName="$(mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=project.build.finalName -q -DforceStdout).jar"
    local jarPath="$outputDir/$jarName"
    local buildCp=$(mvn dependency:build-classpath | grep "Dependencies classpath:" -A 1 | tail -1)
    local runCP="$jarPath:$buildCp"
    echo $runCP
}

