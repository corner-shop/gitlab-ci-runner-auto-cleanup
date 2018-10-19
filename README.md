[![pipeline status](https://gitlab.com/theCornerShop/gitlab-ci-runner-auto-cleanup/badges/next-release/pipeline.svg)](https://gitlab.com/theCornerShop/gitlab-ci-runner-auto-cleanup/commits/next-release)

## gitlab-ci-runner-auto-cleanup

A docker image that will automatically cleanup stale offline gitlab CI runners
every 'n' seconds.

run as:

     docker run -it -e GITLAB_TOKEN=XXXXXXXXXX registry.gitlab.com/thecornershop/gitlab-ci-runner-auto-cleanup:0.1.1

Where GITLAB_TOKEN is an api token with the required privs.

In addition, you can set the following environment variables:

- FREQUENCY -> how often should we run the cleanup task in seconds
- GITLAB_URL -> URL for a private gitlab instance





