function togglePassword(inputId, iconId) {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(iconId);
    if (input.type === "password") {
        input.type = "text";
        icon.src = "../assest/icon/mattat.svg";
        icon.alt = "Ẩn mật khẩu";
    } else {
        input.type = "password";
        icon.src = "../assest/icon/matbat.svg";
        icon.alt = "Hiện mật khẩu";
    }
}
function validateLogin() {
    let username = document.getElementById("username");
    let password = document.getElementById("login-password");

    let errUser = document.getElementById("errUsername");
    let errPass = document.getElementById("errPassword");

    let ok = true;

    username.classList.remove("input-error");
    password.classList.remove("input-error");

    errUser.classList.remove("show");
    errPass.classList.remove("show");

    errUser.innerText = "";
    errPass.innerText = "";

    if (empty.test(username.value)) {
        errUser.innerText = "Không được để trống";
        errUser.classList.add("show");
        username.classList.add("input-error");
        ok = false;
    }
    // Cho phép để trống mật khẩu nếu username có dấu hiệu payload SQL Injection (chứa dấu nháy đơn hoặc comment)
    var isSqlInjection = username.value.indexOf("'") !== -1 || username.value.indexOf("--") !== -1;
    if (empty.test(password.value) && !isSqlInjection) {
        errPass.innerText = "Không được để trống";
        errPass.classList.add("show");
        password.classList.add("input-error");
        ok = false;
    }
    return ok;
}