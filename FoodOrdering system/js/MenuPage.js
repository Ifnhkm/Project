// Get the tab menu items
var tabMenuItems = document.querySelectorAll('.tab-menu li');

// Get the tab content items
var tabContentItems = document.querySelectorAll('.tab-content');
var tabContentsItems = document.querySelectorAll('.tab-menu li.active');

// Add a click event listener to each tab menu item
tabMenuItems.forEach(function (item) {
  item.addEventListener('click', function () {
    // Remove the 'active' class from all tab menu items
    tabMenuItems.forEach(function (item) {
      item.classList.remove('active');
    });
    // Remove the 'active' class from all tab menu items
    tabContentsItems.forEach(function (item) {
      item.classList.remove('active');
    });

    // Add the 'active' class to the clicked tab menu item
    item.classList.add('active');

    // Get the value of the "data-tab" attribute of the clicked tab menu item
    var tab = item.getAttribute('data-tab');

    // Hide all tab content items
    tabContentItems.forEach(function (item) {
      item.classList.remove('active');
    });

    // Show the corresponding tab content item
    document.querySelector('#' + tab).classList.add('active');
  });
});


/*Click to direct other page section */
// Get the box elements
var boxElements = document.querySelectorAll('.tab-content .box');

// Add a click event listener to each box element
boxElements.forEach(function (box) {
  box.addEventListener('click', function () {
    // Get the content of the clicked item
    var content = box.innerHTML;
    let result = confirm("Add the food to cart?");
if (result) {
  // The user clicked "OK"
} else {
  // The user clicked "Cancel"
}
  });
});


