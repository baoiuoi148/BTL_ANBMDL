const nutToggle = document.getElementById("toggle");
const menuNav = document.querySelector(".nav");
const menuUser = document.querySelector(".menu");
if (nutToggle) {
    nutToggle.addEventListener("click", () => {
        if (menuNav) menuNav.classList.toggle("show");
        if (menuUser) menuUser.classList.toggle("show_menu");
    });
}