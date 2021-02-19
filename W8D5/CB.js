window.setTimeout(function() {
  alert('HAMMERTIME');
}, 5000) 

// setTimeOut is asynchronous

function hammerTime(time) {
  window.setTimeout(function() {
    alert(`${time} is hammertime!.`);
  }, 5000)}

  