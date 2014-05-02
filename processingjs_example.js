// CSOUND RELATED FUNCTIONS

// called by csound.js
function moduleDidLoad() {
  var pjs = Processing.getInstanceById(getProcessingSketchId());
  console.log(pjs);
  console.log('test');
  pjs.bindCsound(csound);

  csound.Play();
  csound.CompileOrc(document.getElementById('orc').value);
  csound.ReadScore(document.getElementById('sco').value);
}
function attachListeners() { 
}

var count = 0;
function handleMessage(message) {
  console.log(message.data);
}


var playing = false;
var started = false;
var loaded = false;
var fname;

function togglePlay(){
    if(!playing) {
      if(started) csound.Play();
      else {
        csound.Play();
        //csound.CompileOrc($( "#orc_code").val() + "\n");
        //csound.ReadScore($( "#sco_code").val() + "\n");
        started = true;
      }
      document.getElementById('playButton').innerText = "Pause";
      playing = true;
    } else {
      csound.Pause()
        document.getElementById('playButton').innerText ="Play";
      playing = false;
    }
}

function handleFileSelect(evt) {
  if(!loaded) {
    var files = evt.target.files; 
    var f = files[0];
    var objectURL = window.webkitURL.createObjectURL(f);
    csound.CopyUrlToLocal(objectURL, f.name);
    fname = f.name;
    loaded = true;
  } else {
    csound.updateStatus("to load a new CSD, first refresh page!")
  }
}
