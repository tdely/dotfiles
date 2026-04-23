import std / [htmlparser, parseopt, posix, strutils, terminal, xmltree]

const
  progName = "emojiparser"
  progUse = "$1: usage: $1 [-h] [infile] [outfile]" % progName

proc main(args: var seq[string]) =
  let input =
    if not isatty(stdin):
      readAll(stdin).strip()
    else:
      ""
  let html =
    if input.len == 0:
      try:
        if args.len > 2:
          quit(progUse & "\n// too many arguments", 1)
        elif args.len == 0:
          quit(progUse & "\n// no input file specified or standard input given", 1)
        loadHtml(args[0])
      except IOError as e:
        quit(e.msg, 1)
    else:
      if args.len > 1:
        quit(progUse & "\n// too many arguments for standard input", 1)
      parseHtml(input)

  if html.len == 0:
    quit("No HTML data", 1)

  if args.len == 2:
    args.del(0)

  var f =
    if args.len > 0:
      open(args[0], fmWrite)
    else:
      stdout
  var i = 0
  for tr in html.findAll("tr"):
    var c, name: string
    for child in tr.items():
      if child.kind == xnElement and child.tag() == "td":
        if "chars" in child.attr("class"):
          c = child.innerText
        elif "name" in child.attr("class"):
          name = child.innerText
    if c != "" and name != "":
      inc i
      let line = "$1\t$2" % [c, name]
      f.writeLine(line)

  if f != stdout:
    echo "Wrote $1 emojis to $2" % [$i, args[0]]

when isMainModule:
  var
    p = initOptParser()
    args: seq[string]
  while true:
    next p
    case p.kind
    of cmdEnd:
      break
    of cmdShortOption, cmdLongOption:
      case p.key:
      of "h", "help":
        quit(progUse, QuitSuccess)
      else:
        quit(progUse, EPERM)
    of cmdArgument:
      args.add p.key
  main(args)
