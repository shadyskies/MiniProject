$(document).ready(function () {
  $("#id_audio_file").change(function () {
    console.log("hi");
    $("#file1").text(this.files.length + " file(s) selected");
  });
});
$(document).ready(function () {
  $("#id_audio_file_2").change(function () {
    console.log("hello");
    $("#file2").text(this.files.length + " file(s) selected");
  });
});
