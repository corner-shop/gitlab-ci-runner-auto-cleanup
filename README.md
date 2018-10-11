## gitlab-ci-runner-auto-cleanup

A docker image that will automatically cleanup stale offline gitlab CI runners
every 'n' seconds.

run as:
	docker run -it -e GITLAB_TOKEN=XXXXXXXXXX  azulinho/gitlab-ci-runner-auto-cleanup:latest


Where GITLAB_TOKEN is an api token with the required privs.

In addition, you can set the following environment variables:

- FREQUENCY -> how often should we run the cleanup task in seconds
- GITLAB_URL -> URL for a private gitlab instance





