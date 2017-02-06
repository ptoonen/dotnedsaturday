#!/bin/bash

app_name=$1
latest_version=
previous_versions=($(docker service ls --filter name=$app_name | grep -w $app_name -v | awk 'NR>=2{ print $2 }' | sed 's/[a-zA-Z]//g'))
if [ ${#previous_versions[*]} -gt 1 ]; then
      # Determine version
      echo "multiple versions detected"
      sorted_versions=($(for i in "${previous_versions[@]}"; do echo "$i"; done | sort -rn))
      latest_version=${sorted_versions[0]}
   else
      latest_version=$(( ${previous_versions[0]} ))
fi

echo '##vso[task.setvariable variable=previousAppVersion;]'$latest_version