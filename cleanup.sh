#!/usr/bin/env bash
set -o nounset
set -o errexit

# Required tools:
# curl
# jq
# tr

gitlabUrl="${GITLAB_URL:-https://gitlab.com}"  # todo: point to gitlab url to cleanup
gitlabApiToken="${GITLAB_TOKEN}"  # todo: fill with admin api token
for_n_seconds=${FREQUENCY:-3600}

while true
do
	# Which runners are online?
	onlineRunnerIds=$(curl --fail --silent --header "PRIVATE-TOKEN: ${gitlabApiToken}" "${gitlabUrl}/api/v4/runners?scope=online&per_page=10000000000000000000000" | jq '.[].id' | tr '\n' ' ')

	# For all runners, except those that are online
	allRunnerIds=$(curl --fail --silent --header "PRIVATE-TOKEN: ${gitlabApiToken}" "${gitlabUrl}/api/v4/runners?per_page=10000000000000000000000" | jq '.[].id' | tr '\n' ' ')

	# Remove runners
	for id in ${allRunnerIds}; do
	    if [[ " ${onlineRunnerIds} " =~ " ${id} " ]]; then
		echo "skipping deletion of [${id}] because runner is online"
		continue
	    fi
	    echo "deleting [${id}]"
	    curl --fail --silent --request DELETE --header "PRIVATE-TOKEN: ${gitlabApiToken}" "${gitlabUrl}/api/v4/runners/${id}"
	done

	echo "sleeping for ${for_n_seconds} seconds"
	sleep ${for_n_seconds}
done
