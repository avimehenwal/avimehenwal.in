# Avi Mehenwal

[![Netlify Status](https://api.netlify.com/api/v1/badges/a00db104-562e-4c21-a7e2-321c0c84998b/deploy-status)](https://app.netlify.com/sites/aviportfolio/deploys)

### Installing hugo from precompiled binaries

[![asciicast](https://asciinema.org/a/159660.png)](https://asciinema.org/a/159660?speed=1.5)


## Useful commands

```
hugo new site ./ --force			  # When the current folder is not empty

hugo serve -t introduction -D   # run server with a theme and build all drafts
hugo new blog/your-post-title.md
hugo new projects/your-project-name.md

git submodule add -b master git@github.com:<USERNAME>/<USERNAME>.github.io.git public
```

[Link to avimehenwal website](https://avimehenwal.github.io)

## Manual Deploy
```
cp -vr public/* ../avimehenwal.github.io
```

Build in under docs/
```
hugo -d docs  # --destination string
```

## conventions to follow

1. [In english, there is no space before punctuation](https://english.stackexchange.com/questions/4645/is-it-ever-correct-to-have-a-space-before-a-question-or-exclamation-mark)
2. `h4` for questions