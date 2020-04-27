
function openTab(evt) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].classList.remove("active");
    tablinks[i].classList.remove("non-active");
    tablinks[i].classList.add("non-active");
  }
  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(this.dataset.name).style.display = "block";
  evt.currentTarget.classList.remove("non-active");
  evt.currentTarget.classList.add("active");
}

function listenerTabs() {
  const tabs = document.querySelectorAll('.tablinks');
  tabs.forEach(function(tab) { tab.addEventListener('click', openTab)})
}




export { listenerTabs }

