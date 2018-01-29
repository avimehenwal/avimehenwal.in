# Avi Mehenwal

### Installing hugo from precompiled binaries

[![asciicast](https://asciinema.org/a/159660.png)](https://asciinema.org/a/159660?speed=1.5)


## Useful commands

```
hugo new site ./ --force			# When the current folder is not empty
hugo new about.md
hugo new contact.md

hugo serve -t introduction
hugo new blog/your-post-title.md
hugo new projects/your-project-name.md

git submodule add -b master git@github.com:<USERNAME>/<USERNAME>.github.io.git public
```

[Link to avimehenwal website](https://avimehenwal.github.io)

## Manual Deploy
```
cp -vr public/* ../avimehenwal.github.io
```
