# sample-bats-repo-buildkite-plugin

Buildkite Pipeline Local Run (+ copies the output of the latest run into output.txt)
```
bk local run |& tee output.txt
```

Docker Compose Run (no auto remove container after exiting)
```
docker compose run -it test
```

Docker Compose Run (auto remove container after exiting)
```
docker compose run -it --rm test
```

## References
- ["|& tee" - StackExchange: Ask Ubuntu](https://askubuntu.com/a/731237)