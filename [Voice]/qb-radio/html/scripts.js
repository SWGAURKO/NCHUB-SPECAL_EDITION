$(document).ready(function () {
  // Mouse Controls
  var documentWidth = document.documentElement.clientWidth;
  var documentHeight = document.documentElement.clientHeight;
  var RadioChannel = "0.0";
  var Emergency = false;
  var Powered = false;

  function escapeHtml(string) {
    return String(string).replace(/[&<>"'`=\/]/g, function (s) {
      return entityMap[s];
    });
  }

  function closeGui() {
    if (Powered) {
      if (RadioChannel < 11.0 || RadioChannel > 999.9) {
        if (RadioChannel < 10 && Emergency) {
        } else {
          RadioChannel = "0.0";
        }
      }
      $.post("https://qb-radio/close", JSON.stringify({ channel: RadioChannel }));
    } else {
      $.post("https://qb-radio/cleanClose", JSON.stringify({}));
    }
  }

  function closeSave() {
    if (Powered) {
      RadioChannel = parseFloat($("#RadioChannel").val());
      if (!RadioChannel) {
        RadioChannel = "0.0";
      }
    }
    closeGui();
  }

  // Listen for NUI Events
  window.addEventListener("message", function (event) {
    var item = event.data;
    if (item.reset === true) {
      closeGui();
    }
    if (item.set === true) {
      RadioChannel = item.setChannel;
    }
    if (item.open === true) {
      Emergency = item.jobType;

      if (RadioChannel != "0.0" && Powered) {
        $("#RadioChannel").val(RadioChannel);
      } else {
        if (Powered) {
          $("#RadioChannel").val("");
          $("#RadioChannel").attr("placeholder", "100.0+");
          $("#RadioChannel").prop("disabled", false);
        } else {
          $("#RadioChannel").val("");
          $("#RadioChannel").attr("placeholder", "Off");
          $("#RadioChannel").prop("disabled", true);
        }
      }

      $(".full-screen").fadeIn(100);
      $(".radio-container").fadeIn(100);
      $("#cursor").css("display", "block");
      $("#RadioChannel").focus();
    }
    if (item.open === false) {
      $(".full-screen").fadeOut(100);
      $(".radio-container").fadeOut(100);
      $("#cursor").css("display", "none");
    }
  });

  $("#Radio-Form").submit(function (e) {
    e.preventDefault();
    closeSave();
  });

  $("#power").click(function () {
    if (Powered === false) {
      Powered = true;
      $("#RadioChannel").prop("disabled", false);
      $("#RadioChannel").focus();
      $("#RadioChannel").val(RadioChannel === "0.0" ? "" : RadioChannel);
      $("#RadioChannel").attr("placeholder", "100.0+");
      $.post("https://qb-radio/click", JSON.stringify({}));
      $.post(
        "https://qb-radio/poweredOn",
        JSON.stringify({ channel: RadioChannel })
      );
    } else {
      Powered = false;
      $.post("https://qb-radio/click", JSON.stringify({}));
      $.post("https://qb-radio/poweredOff", JSON.stringify({}));

      $("#RadioChannel").val("");
      $("#RadioChannel").attr("placeholder", "Off");
      $("#RadioChannel").prop("disabled", true);
    }
  });
  $("#volumeUp").click(function () {
    $.post("https://qb-radio/click", JSON.stringify({}));
    $.post("https://qb-radio/volumeUp", JSON.stringify({}));
  });

  $("#volumeDown").click(function () {
    $.post("https://qb-radio/click", JSON.stringify({}));
    $.post("https://qb-radio/volumeDown", JSON.stringify({}));
  });

  // On 'Esc' call close method
  document.onkeyup = function (data) {
    if (data.which == 27) {
      closeSave();
    }
  };
});
