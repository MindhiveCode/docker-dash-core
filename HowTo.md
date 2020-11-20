# Making a new release

1. Duplicate version folder
2. Update the DASH_CORE version in all the right places
3. Calculate the hash for the latest version by modifying the below link, downloading the file, and then dropping the zip file into this sha256 generator
> https://codeload.github.com/dashpay/dash/archive/v0.16.1.1.tar.gz

> https://emn178.github.io/online-tools/sha256_checksum.html

4. Testing locally, you'll run:

```
  VERSION=0.16.1.1 BUILD_PATH=0.16
  VERSION=0.16.1.1 BUILD_PATH=0.16/alpine
```