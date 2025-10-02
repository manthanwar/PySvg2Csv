# Build Script

From project root run the following commands:

```sh
./sripts/build.sh            # no arg => default build ./dist/*
./sripts/build.sh clean      # remove the ./dist/ folder
./sripts/build.sh cleanBuild # clean and build ./dist/*
./sripts/build.sh test       # upload to TestPyPI server
./sripts/build.sh upload     # upload to PyPI server
```