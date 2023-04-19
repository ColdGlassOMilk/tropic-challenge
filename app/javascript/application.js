// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:load", function () {
  const createUserButton = document.getElementById("createUserBtn");
  const createUserForm = document.getElementById("createUserForm");
  if (createUserButton) {
    createUserButton.addEventListener("click", function (event) {
      event.preventDefault();
      createUserForm.submit();
    });
  }
});
