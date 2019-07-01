---
date: "2017-03-28T00:02:24+01:00"
type: "search-index"
url: "index.json"
---

{{- $.Scratch.Add "index" slice -}}
{{- range where .Site.Pages "Type" "not in"  (slice "page" "search-index") -}}
{{- $.Scratch.Add "index" (dict "title" .Title "ref" .Permalink "tags" .Params.tags) -}}
{{- end -}}
{{- $.Scratch.Get "index" | jsonify -}}