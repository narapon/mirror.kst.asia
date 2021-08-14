
If you want to set permissions on all files to a+r, and all directories to a+x, and do that recursively through the complete subdirectory tree, use:

```sh
chmod -R a+rX *
```