// Get the tab menu items
var tabMenuItems = document.querySelectorAll('.categorynavbar a');


// Get the tab content items
var tabContentItems = document.querySelectorAll('.tab-content');
var tabContentsItems = document.querySelectorAll('.tab-menu li ');

//// Get the box elements
//var boxElements = document.querySelectorAll('.box');

// Add a click event listener to each tab menu item
tabMenuItems.forEach(function(item) {
  item.addEventListener('click', function(event) {
    // Prevent the default behavior of the a tag
    event.preventDefault();

    // Remove the 'active' class from all tab menu items
    tabMenuItems.forEach(function(item) {
      item.classList.remove('active');
		});
		// Remove the 'active' class from all tab menu items
    tabContentsItems.forEach(function(item) {
      item.classList.remove('active');
    });

    // Add the 'active' class to the clicked tab menu item
    item.classList.add('active');

    // Get the value of the "href" attribute of the clicked tab menu item
    var tab = item.getAttribute('href');

    // Hide all tab content items
    tabContentItems.forEach(function(item) {
      item.classList.remove('active');
    });

    // Show the corresponding tab content item
    document.querySelector(tab).classList.add('active');
  });
});

tabMenuItems.forEach(function(item) {
  item.addEventListener('click', function() {
    tabMenuItems.forEach(function(item) {
      item.classList.remove('active');
    });
    this.classList.add('active');

    // Get the index of the clicked tab menu item
    var index = Array.prototype.indexOf.call(tabMenuItems, this);

    // Remove the 'active' class from all tab content items
    tabContentsItems.forEach(function(item) {
      item.classList.remove('active');
    });

    // Add the 'active' class to the corresponding tab content item
    tabContentsItems[index].classList.add('active');
  });
});



//// Set the data-url attribute of the box elements to the desired URLs
//boxElements.forEach(function(box) {
//  box.setAttribute('data-url', 'https://www.google.com');
//});