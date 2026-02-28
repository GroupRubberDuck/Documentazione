.data.organization.projectV2.items.nodes[] |
select(.content.title != null) |
. as $item |
($item.fieldValues.nodes | map(select(.field.name == "Size")) | .[0].name // "-") as $size |
($item.content.createdAt // "-" | if . != "-" then .[0:10] else "-" end) as $startDate |
($item.content.closedAt // "-" | if . != "-" then .[0:10] else "-" end) as $endDate |
($item.content.body // "") as $body |
(if ($body | test("### Autore"; "i"))
  then (
    $body |
    split("\n") |
    . as $lines |
    ([ range(length) | select($lines[.] | test("^### Autore"; "i")) ] | .[0]) as $idx |
    $lines[$idx+1:] |
    map(select(length > 0)) |
    .[0] // "-" |
    gsub("@"; "") |
    gsub(","; " ") |
    gsub("\\s+"; " ") |
    ltrimstr(" ") | rtrimstr(" ") |
    split(" ") |
    map(select(length > 0)) |
    map(select(test("_No.response_|No response"; "i") | not)) |
    join(", ")
  )
  elif ($item.content.assignees.nodes | length) > 0
  then ([$item.content.assignees.nodes[].login] | join(", "))
  else "-" end) as $autore |
(if ($body | test("### Verificatore"; "i"))
  then (
    $body |
    split("\n") |
    . as $lines |
    ([ range(length) | select($lines[.] | test("^### Verificatore"; "i")) ] | .[0]) as $idx |
    $lines[$idx+1:] |
    map(select(length > 0)) |
    .[0] // "-" |
    gsub("@"; "") |
    gsub(","; " ") |
    gsub("\\s+"; " ") |
    ltrimstr(" ") | rtrimstr(" ") |
    split(" ") |
    map(select(length > 0)) |
    map(select(test("_No.response_|No response"; "i") | not)) |
    join(", ")
  )
  else "-" end) as $verificatore |
[
  $item.content.title,
  $item.content.url,
  $autore,
  $verificatore,
  $startDate,
  $endDate,
  $size
] | join("|")