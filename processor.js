var diffs = null;

function process() {
  diffs = $('#diffs').val().split("\n")
  var remaining = $('#steps').val()

  if (remaining < 0)
    remaining = diffs.length + remaining / 1

  debugger
  for (var i = 0; i < remaining; i++) {
    processNext();
  }
}

function processNext() {
  if (!diffs)
    diffs = $('#diffs').val().split("\n")

  $('#json1').val($('#json2').val())

  diff = JSON.parse(diffs[0])
  diffs.splice(0,1)

  existing_str = $('#json1').val()
  existing = JSON.parse(existing_str)
  patched = jsondiffpatch.patch(existing, diff)
  $('#json2').val(JSON.stringify(patched))

  $('#visualdiff').empty().append(jsondiffpatch.html.diffToHtml(existing, patched, diff));
}